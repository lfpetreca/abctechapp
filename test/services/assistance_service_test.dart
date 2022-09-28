import 'dart:convert';
import 'dart:io';

import 'package:abctechapp/model/assist.dart';
import 'package:abctechapp/provider/assist_provider.dart';
import 'package:abctechapp/services/assist_services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'assistance_service_test.mocks.dart';

@GenerateMocks([AssistProviderInterface])
void main() {
  late AssistService service;
  late MockAssistProviderInterface provider;

  setUp(() async {
    provider = MockAssistProviderInterface();
    service = AssistService(assistProvider: provider);

    String json =
        File('${Directory.current.path}/test/resources/assist_response.json')
            .readAsStringSync();

    when(provider.getAssists()).thenAnswer((_) async => Future.sync(
        () => Response(statusCode: HttpStatus.ok, body: jsonDecode(json))));
  });
  test('Testando o retono com sucesso', () async {
    List<Assist> list = await service.getAssists();
    expect(list.length, 5);
    expect(list[0].id, 1);
  });
}
