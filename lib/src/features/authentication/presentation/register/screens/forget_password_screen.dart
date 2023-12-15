import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/src/core/components/app_text_form_field.dart';
import 'package:news_app/src/core/utils/validators.dart';

import '../../../../../core/components/app_button.dart';
import '../../bloc/auth/auth_bloc.dart';
import '../../bloc/auth/auth_state.dart';
import '../bloc/register_bloc.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  static const routeName = '/forget-password';

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc(context),
      child: const _ForgetPasswordScreen(),
    );
  }
}

class _ForgetPasswordScreen extends StatelessWidget {
  const _ForgetPasswordScreen({Key? key}) : super(key: key);

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
                    'Don\'t worry. It happens to best of us!',
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
                    'Enter your Email to get a recovery email',
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
                    height: 16,
                  ),
                  AppButton(
                    onTap: registerBloc.submitForgetPasswordForm,
                    labelText: 'Send Recovery Email',
                  ),
                  const SizedBox(
                    height: 16,
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
