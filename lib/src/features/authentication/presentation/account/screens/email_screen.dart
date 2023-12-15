import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/components/app_button.dart';
import 'package:news_app/src/core/components/app_text_form_field.dart';
import 'package:news_app/src/core/utils/validators.dart';
import 'package:news_app/src/features/authentication/presentation/account/bloc/profile_state.dart';

import '../bloc/profile_bloc.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({Key? key}) : super(key: key);

  static const routeName = '/email';

  @override
  Widget build(BuildContext context) {
    final profileBloc = BlocProvider.of<ProfileBloc>(context, listen: true);
    final staticProfileBloc = BlocProvider.of<ProfileBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        elevation: 0,
        title: const Text(
          'Name',
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
                            'Email',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppTextFormField(
                            hint: staticProfileBloc.getUserEmail(context),
                            validator: AppValidator.emailValidator,
                            onSaved: staticProfileBloc.onEmailSaved,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          if (profileBloc.verifyNeed(context))
                            InkWell(
                              onTap: () => staticProfileBloc.verifyEmail(context),
                              child: Text(
                                'Verify Email',
                                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xFF9098B1)),
                              ),
                            ),
                        ],
                      ),
                    ),
                    AppButton(
                      onTap: () => staticProfileBloc.submitChangeEmailForm(context),
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
