import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

import '../controller/order_controller.dart';
import '../model/assist.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({Key? key}) : super(key: key);

  Widget renderAssists(List<Assist> assists) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: assists.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(assists[index].name),
      ),
    );
  }

  Widget buildForm(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return SingleChildScrollView(
      child: Form(
        key: controller.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              children: const [
                Expanded(
                  child: Text(
                    'Preencha o fomulário de ordem de serviço',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: TextFormField(
                controller: controller.operatorIdController,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: "Código do prestador"),
                textAlign: TextAlign.center,
                validator: (value) {
                  if (value != null && value.length < 3) {
                    return 'Código do prestador precista ter ao menos 3 caracteres';
                  }
                  return null;
                },
              ),
            ),
            Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 25),
                    child: Text(
                      'Selecione os serviços a serem prestados',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox.fromSize(
                  size: const Size(40, 40),
                  child: ClipOval(
                    child: Material(
                      color: Colors.orange,
                      child: InkWell(
                        onTap: () => controller.editAssists(),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Icon(Icons.search),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Obx(
              () => renderAssists(controller.selectedAssists),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      final isValidForm = formKey.currentState!.validate();
                      isValidForm ? controller.finishStartOrder() : null;
                    },
                    child: const Text("Finalizar"),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ordem de serviço"),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: controller.obx(
          (state) => buildForm(context),
          onLoading: const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
