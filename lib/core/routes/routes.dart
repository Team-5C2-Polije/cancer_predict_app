import 'package:cancer_predict_app/presentation/app_binding.dart';
import 'package:cancer_predict_app/presentation/main_window_page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String initialRoute = "/HomePage";

  static final routes = [
    GetPage(
        name: MainWindowPage.routeName.toString(),
        page: () => const MainWindowPage(),
        binding: AppBinding()),
  ];
}