import 'package:fpdart/fpdart.dart';
import 'package:practice_clean_architecture/core/error/failure.dart';
import 'package:practice_clean_architecture/features/daily_news/domain/entiites/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> SingInWithEmailandPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<Either<Failure, User>> LogInInWithEmailandPassword({
    required String email,
    required String password,
  });
}
