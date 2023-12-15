import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/src/core/components/app_secure_text_form_field.dart';
import 'package:news_app/src/core/components/app_text_form_field.dart';
import 'package:news_app/src/core/utils/validators.dart';

import '../../../../../core/components/app_button.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../bloc/register_bloc.dart';
import '../components/logIn_component.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(context),
      child: const _LoginScreen(),
    );
  }
}

class _LoginScreen extends StatelessWidget {
  const _LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final registerBloc = BlocProvider.of<RegisterBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(builder: (_, state) {
      if (state is LoadingAuthState) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: registerBloc.registerFormKey,
              child: ListView(
                children: [
                  const SizedBox(
                    height: 68,
                  ),
                  SvgPicture.asset(
                    'assets/icons/login.svg',
                    height: 50,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    'Welcome to News App',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      letterSpacing: 0.5,
                      color: Color(0xFF223263),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Sign in to continue',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color(0xFF9098B1),
                          letterSpacing: 0.5,
                        ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  AppTextFormField(
                    hint: 'Your Email',
                    icon: 'assets/icons/email.svg',
                    validator: AppValidator.emailValidator,
                    onSaved: registerBloc.onSavedEmail,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  AppSecureTextFormField(
                    title: 'Password',
                    icon: 'assets/icons/passphrase.svg',
                    validator: AppValidator.passwordValidator,
                    onSaved: registerBloc.onSavedPassword,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  AppButton(
                    onTap: registerBloc.submitLoginForm,
                    labelText: 'Sign In',
                  ),
                  const SizedBox(
                    height: 21,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width / 3,
                        color: const Color(0xFFEBF0FF),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Text(
                          "OR",
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                color: const Color(0xFF9098B1),
                                letterSpacing: 0.7,
                              ),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width / 3,
                        color: const Color(0xFFEBF0FF),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  LogInButtonComponent(
                    icon: 'assets/icons/google.svg',
                    title: 'Continue with Google',
                    onTap: registerBloc.signInWithGoogle,
                  ),
                  // const SizedBox(
                  //   height: 8,
                  // ),
                  // LogInButtonComponent(
                  //   icon: 'assets/icons/facebook.svg',
                  //   title: 'Continue with facebook',
                  //   onTap: registerBloc.signInWithFacebook,
                  // ),
                  const SizedBox(
                    height: 16,
                  ),
                  InkWell(
                    onTap: registerBloc.goToForgetPassword,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: Colors.black,
                                letterSpacing: 0.5,
                              ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don’t have a account?',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: const Color(0xFF9098B1),
                              letterSpacing: 0.5,
                            ),
                      ),
                      InkWell(
                        onTap: registerBloc.goToSignUp,
                        child: Text(
                          ' Register',
                          style: Theme.of(context).textTheme.labelLarge!.copyWith(
                                color: Colors.black,
                                letterSpacing: 0.5,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      }
    });
  }
}
