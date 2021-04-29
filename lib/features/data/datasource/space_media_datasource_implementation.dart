import 'dart:convert';

import 'package:clean_code_nasa/core/http_client/http_client.dart';
import 'package:clean_code_nasa/core/utils/converters/date_to_string_converter.dart';
import 'package:clean_code_nasa/core/utils/keys/nasa_api_keys.dart';
import 'package:clean_code_nasa/features/data/datasource/endpoints/nasa_endpoints.dart';
import 'package:clean_code_nasa/features/data/datasource/space_media_datasource.dart';
import 'package:clean_code_nasa/features/data/models/space_media_model.dart';

class NasaDataSourceImplementation implements ISpaceMediaDatasource {
  final HttpClient client;

  NasaDataSourceImplementation(this.client);

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    final response = await client.get(NasaEndPoints.apod(
        NasaApiKeys.apiKey, DateToStringConverter.convert(date)));
    if (response.statusCode == 200) {
      return SpaceMediaModel.fromJson(jsonDecode(response.data));
    } else {
      return SpaceMediaModel(
          mediaType: 'mediaType',
          description: 'description',
          title: 'title',
          mediaUrl: 'mediaUrl');
    }
  }
}
