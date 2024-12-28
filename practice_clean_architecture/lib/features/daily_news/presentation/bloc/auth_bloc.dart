import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_clean_architecture/features/daily_news/domain/entiites/user.dart';
import 'package:practice_clean_architecture/features/daily_news/domain/usecases/user_singup.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSingup _userSingup;
  AuthBloc({required UserSingup userSingup})
      : _userSingup = userSingup,
        super(AuthInitial()) {
    on<AuthSingUp>((event, emit) async {
      emit(AuthLoading());
      final res = await _userSingup(UserSingupParams(
        name: event.name,
        email: event.email,
        password: event.password,
      ));
      res.fold(
        (l) => emit(AuthFailure(l.message)),
        (user) {
          emit(AuthSuccess(user));
        },
      );
    });
  }
}
