import 'package:clean_code_nasa/features/data/datasource/space_media_datasource.dart';
import 'package:clean_code_nasa/features/data/repositories/space_media_repository_implementation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpaceMediaDatasource extends Mock implements ISpaceMediaDatasource{}

void main(){
  late SpaceMediaRepositoryImplementation repository;
  late ISpaceMediaDatasource datasource;


  setUp((){
    datasource = MockSpaceMediaDatasource();
    repository = SpaceMediaRepositoryImplementation(datasource);
  });
final tSpaceMediaModel = SpaceMediaModel();

  test('sould return space media when calls the datasource', (){
    when(datasource).calls(#getSpaceMediaFromDate).thenAnswer((_) async => tSpaceMediaModel);
  });
}