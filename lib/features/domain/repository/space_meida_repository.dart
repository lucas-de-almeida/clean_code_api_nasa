import 'package:clean_code_nasa/core/usecase/erros/failures.dart';
import 'package:clean_code_nasa/features/domain/entities/space_media_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ISpaceMediaRespository {
  Future<Either<Failure, SpaceMediaEntity>> getSpaceMediaFromDate(date);
}
