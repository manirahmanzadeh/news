import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/components/app_button.dart';
import 'package:news_app/src/core/components/app_secure_text_form_field.dart';
import 'package:news_app/src/core/utils/validators.dart';
import 'package:news_app/src/features/authentication/presentation/account/bloc/profile_state.dart';

import '../bloc/profile_bloc.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  static const routeName = '/change-password';

  @override
  Widget build(BuildContext context) {
    // final profileBloc = BlocProvider.of<ProfileBloc>(context, listen: true);
    final staticProfileBloc = BlocProvider.of<ProfileBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        title: const Text(
          'Password',
        ),
      ),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (_, state) {
          if (state is LoadingProfileState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: staticProfileBloc.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Password',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppSecureTextFormField(
                            validator: AppValidator.passwordValidator,
                            onSaved: staticProfileBloc.onPasswordSaved,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                    AppButton(
                      onTap: () => staticProfileBloc.submitChangePasswordForm(context),
                      labelText: 'Save',
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
