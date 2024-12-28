import 'package:fpdart/fpdart.dart';
import 'package:practice_clean_architecture/core/error/failure.dart';

abstract interface class UseCase<SucessType, Params> {
  Future<Either<Failure, SucessType>> call(Params params);
}
