import 'package:fpdart/fpdart.dart';
import 'package:practice_clean_architecture/core/error/failure.dart';
import 'package:practice_clean_architecture/core/error/server_expection.dart';
import 'package:practice_clean_architecture/features/daily_news/data/datasources/auth_remote_data_source.dart';
import 'package:practice_clean_architecture/features/daily_news/domain/entiites/user.dart';
import 'package:practice_clean_architecture/features/daily_news/domain/repository/auth_repository.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  const AuthRepositoryImp(this.authRemoteDataSource);
  @override
  Future<Either<Failure, User>> SingInWithEmailandPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.SingInWithEmailandPassword(
        name: name,
        email: email,
        password: password,
      );
      return right(user);
    } on ServerExpection catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, User>> LogInInWithEmailandPassword(
      {required String email, required String password}) {
    // TODO: implement LogInInWithEmailandPassword
    throw UnimplementedError();
  }
}
