import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice_clean_architecture/config/theme/color_pallet.dart';
import 'package:practice_clean_architecture/core/common/widgets/loader.dart';
import 'package:practice_clean_architecture/core/util/show_snackbar.dart';
import 'package:practice_clean_architecture/features/daily_news/presentation/bloc/auth_bloc.dart';
import 'package:practice_clean_architecture/features/daily_news/presentation/pages/login_page.dart';
import 'package:practice_clean_architecture/features/daily_news/presentation/widgets/auth_field.dart';
import 'package:practice_clean_architecture/features/daily_news/presentation/widgets/auth_gradient_button.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});
  @override
  State<SingUpPage> createState() {
    return _SingUpPageState();
  }
}

class _SingUpPageState extends State<SingUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              showSnackBar(context, state.message);
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }
            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Sing Up',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  AuthField(hinttext: 'Name', controller: nameController),
                  const SizedBox(
                    height: 12,
                  ),
                  AuthField(
                    hinttext: 'Email',
                    controller: emailController,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  AuthField(
                    hinttext: 'Password',
                    controller: passwordController,
                    isObsecureText: true,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AuthGradientButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(AuthSingUp(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                              ));
                        }
                      },
                      text: "Sing Up"),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LoginPage();
                      }));
                    },
                    child: RichText(
                      text: TextSpan(
                          text: 'Already have an account? ',
                          style: Theme.of(context).textTheme.titleMedium,
                          children: [
                            TextSpan(
                                text: 'Sing in',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        color: AppPallete.gradient2,
                                        fontWeight: FontWeight.bold))
                          ]),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
