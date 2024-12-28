import 'package:practice_clean_architecture/core/error/server_expection.dart';
import 'package:practice_clean_architecture/features/daily_news/data/models/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> SingInWithEmailandPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel> LoginInWithEmailandPassword({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final SupabaseClient supabaseClient;
  AuthRemoteDataSourceImpl(this.supabaseClient);
  @override
  Future<UserModel> SingInWithEmailandPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final response = await supabaseClient.auth
          .signUp(password: password, email: email, data: {
        'name': name,
      });
      if (response.user == null) {
        throw ServerExpection(message: 'User is null');
      }
      return UserModel.fromJson(response.user!.toJson());
    } catch (e) {
      throw ServerExpection(message: e.toString());
    }
  }

  @override
  Future<UserModel> LoginInWithEmailandPassword({
    required String email,
    required String password,
  }) {
    // TODO: implement LoginInWithEmailandPassword
    throw UnimplementedError();
  }
}
