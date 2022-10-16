import 'package:abctechapp/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home_bind.dart';
import '../pages/home_page.dart';
import '../pages/order_bind.dart';
import '../pages/order_page.dart';
import '../provider/assist_provider.dart';
import '../services/assist_services.dart';

void main() {
  initServices();
  runApp(AbcTechApp());
}

void initServices() {
  Get.lazyPut(() => AssistService(assistProvider: AssistProvider()));
}

class AbcTechApp extends StatelessWidget {
  final ThemeData theme = ThemeData(
    primarySwatch: Colors.blueGrey,
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        fontFamily: 'OpenSans',
      ),
    ),
  );

  AbcTechApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Abc Tech App',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(secondary: Colors.orange),
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const SplashPage(),
        ),
        GetPage(
          name: '/order',
          page: () => const OrderPage(),
          binding: OrderBind(),
        ),
        GetPage(
          name: '/assists',
          page: () => const HomePage(),
          binding: HomeBind(),
        )
      ],
    );
  }
}
