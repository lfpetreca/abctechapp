import 'package:get/get.dart';

import '../controller/order_controller.dart';
import '../services/geolocation_service.dart';
import '../provider/order_provider.dart';
import '../services/order_service.dart';

class OrderBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(
      () => OrderController(
        GeolocationService(),
        OrderService(OrderProvider()),
      ),
    );
  }
}
