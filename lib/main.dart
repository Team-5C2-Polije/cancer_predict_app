import 'dart:io';

import 'package:cancer_predict_app/main_window_page.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  _runFlask();
}

void _runFlask() async {
  try {
    Process.run('python', ['app.py'], workingDirectory: './')
        .then((ProcessResult results) {
      Logger().i(results.stdout);
      Logger().i(results.stderr);
    });
  } catch (e) {
    Logger().e("Error running Flask: $e");
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _apiResponse = "Waiting for API response...";

  Future<void> _callApi() async {
    try {
      // Memanggil API dengan Dio
      var response = await Dio().get('http://127.0.0.1:5000/test?name=Black');

      // Update state dengan respons dari API
      setState(() {
        _apiResponse = "RESPONSE : ${response.data['message']}";
      });
    } catch (e) {
      // Handle error
      setState(() {
        _apiResponse = "Failed to load data: $e";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _callApi();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _apiResponse,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: () {
                Get.to(
                  const MainWindowPage()
                );
              },
              child: const Text("START"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
