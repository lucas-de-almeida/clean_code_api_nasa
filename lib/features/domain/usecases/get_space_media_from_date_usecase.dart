import 'package:clean_code_nasa/core/usecase/erros/failures.dart';
import 'package:clean_code_nasa/core/usecase/usecase.dart';
import 'package:clean_code_nasa/features/domain/entities/space_media_entity.dart';
import 'package:clean_code_nasa/features/domain/repository/space_meida_repository.dart';
import 'package:dartz/dartz.dart';

class GetSpaceMediaFromDateUsecase
    implements Usecase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRespository repository;

  GetSpaceMediaFromDateUsecase(this.repository);

  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime date) async {
    return await repository.getSpaceMediaFromDate(date);
  }
}
