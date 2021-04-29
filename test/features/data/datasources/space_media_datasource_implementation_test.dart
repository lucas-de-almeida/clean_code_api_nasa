import 'package:clean_code_nasa/core/http_client/http_client.dart';
import 'package:clean_code_nasa/features/data/datasource/space_media_datasource.dart';
import 'package:clean_code_nasa/features/data/datasource/space_media_datasource_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../Mock/space_media_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late ISpaceMediaDatasource datasource;

  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = NasaDataSourceImplementation(client);
  });
  final tDateTime = DateTime(2021, 02, 02);
  final urlExpected =
      ' https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2021-02-02';
  test('should call the get method  with correct url', () async {
    when(() => client.get(any())).thenAnswer(
        (_) async => HttpResponse(data: spaceMediaMock, statusCode: 200));

    await datasource.getSpaceMediaFromDate(tDateTime);

    verify(() => client.get(urlExpected)).called(1);
  });
}
