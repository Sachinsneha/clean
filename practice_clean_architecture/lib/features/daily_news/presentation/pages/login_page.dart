import 'package:flutter/material.dart';
import 'package:practice_clean_architecture/config/theme/color_pallet.dart';
import 'package:practice_clean_architecture/features/daily_news/presentation/pages/singup_page.dart';
import 'package:practice_clean_architecture/features/daily_news/presentation/widgets/auth_field.dart';
import 'package:practice_clean_architecture/features/daily_news/presentation/widgets/auth_gradient_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Sing In',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
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
              AuthGradientButton(onPressed: () {}, text: "Sing In"),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SingUpPage();
                  }));
                },
                child: RichText(
                  text: TextSpan(
                      text: 'Don\'t have an account? ',
                      style: Theme.of(context).textTheme.titleMedium,
                      children: [
                        TextSpan(
                            text: 'Sing Up',
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
        ),
      ),
    );
  }
}
