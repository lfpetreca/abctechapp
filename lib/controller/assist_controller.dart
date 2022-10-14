import 'package:get/get.dart';

import '../model/assist.dart';
import '../services/assist_services.dart';

class AssistController extends GetxController with StateMixin<List<Assist>> {
  late AssistService _service;
  List<Assist> allAssists = [];
  List<Assist> selectedAssists = [];

  @override
  void onInit() {
    super.onInit();
    _service = Get.find<AssistService>();
    getAssistList();
  }

  void getAssistList() {
    change([], status: RxStatus.loading());
    _service.getAssists().then((value) {
      allAssists = value;
      change(value, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change([], status: RxStatus.error(error.toString()));
    });
  }

  void finishSelectAssists() {
    Get.back();
  }

  void selectList(int index) {
    Assist assist = allAssists[index];
    int indexFound =
        selectedAssists.indexWhere((element) => element.id == assist.id);

    if (indexFound == -1) {
      selectedAssists.add(assist);
    } else {
      selectedAssists.removeAt(indexFound);
    }

    change(allAssists, status: RxStatus.success());
  }

  bool isSelected(int index) {
    Assist assist = allAssists[index];
    int indexFound =
        selectedAssists.indexWhere((element) => element.id == assist.id);

    if (indexFound >= 0) {
      return true;
    } else {
      return false;
    }
  }
}
