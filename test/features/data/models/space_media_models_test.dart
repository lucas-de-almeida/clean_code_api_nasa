import 'dart:convert';

import 'package:clean_code_nasa/features/data/models/space_media_model.dart';
import 'package:clean_code_nasa/features/domain/entities/space_media_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../Mock/space_media_mock.dart';

void main() {
  final tSpaceMediaModel = SpaceMediaModel(
    description:
        'Meteors can be colorful. while the human yey usually cannotdiffers',
    mediaType: 'image',
    title: 'A Colorful Quadrantid Meteor',
    mediaUrl: 'http://apod.gov/apod/image/2012/MeteorStreak_Kuszaj_1080.jpg',
  );
  test('should be a subclass of SpaceMediaEntity', () {
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  test('should return a valid model', () {
    final Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);
    final result = SpaceMediaModel.fromJson(jsonMap);
    expect(result, tSpaceMediaModel);
  });

  test('should return a json map containing the proper data', () {
    final expecterMap = {
      "explanation":
          "Meteors can be colorful. while the human yey usually cannotdiffers",
      "media_type": "image",
      "title": "A Colorful Quadrantid Meteor",
      "url": "http://apod.gov/apod/image/2012/MeteorStreak_Kuszaj_1080.jpg"
    };

    final result = tSpaceMediaModel.toJson();
    expect(result, expecterMap);
  });
}
