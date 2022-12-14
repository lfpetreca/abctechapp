import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/assist_controller.dart';
import '../model/assist.dart';

class HomePage extends GetView<AssistController> {
  const HomePage({super.key});

  Widget renderAssits(List<Assist> assist) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: assist.length,
      itemBuilder: ((context, index) => ListTile(
            title: Text(assist[index].name),
            selectedColor: Theme.of(context).colorScheme.secondary,
            selected: controller.isSelected(index),
            onTap: () => controller.selectList(index),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Lista de Serviços',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 30,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 15,
                      ),
                      child: Text(
                        'Os serviços disponíveis são:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              controller.obx(
                (state) => renderAssits(state ?? []),
                onEmpty: const Text('Não há assistências disponíveis.'),
                onError: (error) => Text(error.toString()),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        onPressed: () {
          controller.finishSelectAssists();
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
