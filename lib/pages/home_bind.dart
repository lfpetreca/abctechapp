import 'package:get/get.dart';

import '../controller/assist_controller.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssistController>(() => AssistController());
  }
}
