import 'package:get/get.dart';

import '../constants.dart';

abstract class AssistProviderInterface {
  Future<Response> getAssists();
}

class AssistProvider extends GetConnect implements AssistProviderInterface {
  @override
  Future<Response> getAssists() => get('${Constants.url}/assistance');
}
