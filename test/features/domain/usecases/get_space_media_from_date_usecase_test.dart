import 'package:clean_code_nasa/core/usecase/erros/failures.dart';
import 'package:clean_code_nasa/features/domain/entities/space_media_entity.dart';
import 'package:clean_code_nasa/features/domain/repository/space_meida_repository.dart';
import 'package:clean_code_nasa/features/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSpaceMediaRespository extends Mock implements ISpaceMediaRespository {
}

void main() {
  late GetSpaceMediaFromDateUsecase usecase;
  late ISpaceMediaRespository repository;

  setUp(() {
    repository = MockSpaceMediaRespository();
    usecase = GetSpaceMediaFromDateUsecase(repository);
  });

  final tSpaceMedia = SpaceMediaEntity(
    description:
        'should get space media entity from a given from the repository',
    mediaType: 'image',
    title: 'titulo',
    mediaUrl: 'mediaUrl',
  );

  final tDate = DateTime(2021, 02, 02);

  test('should get space media entity from a given from the repository',
      () async {
    when(repository)
        .calls(#getSpaceMediaFromDate)
        .thenAnswer((_) async => Right<Failure, SpaceMediaEntity>(tSpaceMedia));
    final result = await usecase(tDate);
    expect(result, Right(tSpaceMedia));
    verify(repository)
        .called(#getSpaceMediaFromDate)
        .withArgs(positional: [tDate]).once();
  });

  test('should return a Failure when don\'t succeed', () async {
    when(repository).calls(#getSpaceMediaFromDate).thenAnswer(
        (_) async => Left<Failure, SpaceMediaEntity>(ServerFailure()));
    final result = await usecase(tDate);
    expect(result, Left(ServerFailure()));
    verify(repository)
        .called(#getSpaceMediaFromDate)
        .withArgs(positional: [tDate]).once();
  });
}
