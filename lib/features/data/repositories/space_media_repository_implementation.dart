import 'package:clean_code_nasa/core/usecase/erros/exceptions.dart';
import 'package:clean_code_nasa/features/data/datasource/space_media_datasource.dart';
import 'package:dartz/dartz.dart';

import 'package:clean_code_nasa/features/domain/entities/space_media_entity.dart';

import 'package:clean_code_nasa/core/usecase/erros/failures.dart';

import '../../domain/repository/space_meida_repository.dart';

class SpaceMediaRepositoryImplementation implements ISpaceMediaRespository {
  final ISpaceMediaDatasource datasource;

  SpaceMediaRepositoryImplementation(this.datasource);

  @override
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(
      DateTime date) async {
    try {
      final result = await datasource.getSpaceMediaFromDate(date);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
