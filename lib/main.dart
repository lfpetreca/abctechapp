import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../pages/home_bind.dart';
import '../pages/home_page.dart';
import '../provider/assist_provider.dart';
import '../services/assist_services.dart';

void main() {
  initServices();
  runApp(const AbcTechApp());
}

void initServices() {
  Get.lazyPut(() => AssistService(assistProvider: AssistProvider()));
}

class AbcTechApp extends StatelessWidget {
  const AbcTechApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Abc Tech App',
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: [
        GetPage(name: "/", page: () => const HomePage(), binding: HomeBind())
      ],
    );
  }
}
