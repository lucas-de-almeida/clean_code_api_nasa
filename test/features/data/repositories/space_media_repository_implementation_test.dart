import 'package:clean_code_nasa/core/usecase/erros/exceptions.dart';
import 'package:clean_code_nasa/core/usecase/erros/failures.dart';
import 'package:clean_code_nasa/features/data/datasource/space_media_datasource.dart';
import 'package:clean_code_nasa/features/data/models/space_media_model.dart';
import 'package:clean_code_nasa/features/data/repositories/space_media_repository_implementation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpaceMediaDatasource extends Mock implements ISpaceMediaDatasource {}

void main() {
  late SpaceMediaRepositoryImplementation repository;
  late ISpaceMediaDatasource datasource;

  setUp(() {
    datasource = MockSpaceMediaDatasource();
    repository = SpaceMediaRepositoryImplementation(datasource);
  });
  final tSpaceMediaModel = SpaceMediaModel(
    description:
        'should get space media entity from a given from the repository',
    mediaType: 'image',
    title: 'A Colorful Quadrantid Meteor',
    mediaUrl: 'http://apod.gov/apod/image/2012/MeteorStreak_Kuszaj_1080.jpg',
  );
  final tDate = DateTime(2021, 02, 02);
  test('sould return space media when calls the datasource', () async {
    when(datasource)
        .calls(#getSpaceMediaFromDate)
        .thenAnswer((_) async => tSpaceMediaModel);
    final result = await repository.getSpaceMediaFromDate(tDate);

    expect(result, Right(tSpaceMediaModel));
    verify(datasource)
        .called(#getSpaceMediaFromDate)
        .withArgs(positional: [tDate]).once();
  });
  test(
      'should return a server failure when the call to datasource is unsucessful',
      () async {
    when(datasource).calls(#getSpaceMediaFromDate).thenThrow(ServerException());

    final result = await repository.getSpaceMediaFromDate(tDate);

    expect(result, Left(ServerFailure()));
    verify(datasource)
        .called(#getSpaceMediaFromDate)
        .withArgs(positional: [tDate]).once();
  });
}
