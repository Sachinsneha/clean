import 'package:fpdart/fpdart.dart';
import 'package:practice_clean_architecture/core/error/failure.dart';
import 'package:practice_clean_architecture/core/usecase/usecase.dart';
import 'package:practice_clean_architecture/features/daily_news/domain/entiites/user.dart';

import 'package:practice_clean_architecture/features/daily_news/domain/repository/auth_repository.dart';

class UserSingup implements UseCase<User, UserSingupParams> {
  final AuthRepository authRepository;

  UserSingup({required this.authRepository});

  @override
  Future<Either<Failure, User>> call(UserSingupParams params) async {
    return await authRepository.SingInWithEmailandPassword(
      name: params.name,
      email: params.email,
      password: params.password,
    );
  }
}

class UserSingupParams {
  final String name;
  final String email;
  final String password;

  UserSingupParams(
      {required this.name, required this.email, required this.password});
}
