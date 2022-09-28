import 'package:abctechapp/controller/assist_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/assist.dart';

class HomePage extends GetView<AssistController> {
  const HomePage({super.key});

  Widget renderAssits(List<Assist> assist) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: assist.length,
      itemBuilder: ((context, index) =>
          ListTile(title: Text(assist[index].name))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lista de Serviços')),
        body: Container(
          constraints: const BoxConstraints.expand(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: const [
                  Expanded(
                      child: Text('Os serviços disponíveis são:',
                          textAlign: TextAlign.center))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextButton(
                        onPressed: controller.getAssistList,
                        child: const Text('Regarregar')),
                  )
                ],
              ),
              controller.obx((state) => renderAssits(state ?? []),
                  onEmpty: const Text('Não encontramos nenhum serviço.'),
                  onError: (error) => Text(error.toString()))
            ],
          ),
        ));
  }
}
