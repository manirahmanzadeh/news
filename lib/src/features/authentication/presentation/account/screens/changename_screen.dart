import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/src/core/components/app_button.dart';
import 'package:news_app/src/core/components/app_text_form_field.dart';
import 'package:news_app/src/core/utils/validators.dart';
import 'package:news_app/src/features/authentication/presentation/account/bloc/profile_state.dart';

import '../bloc/profile_bloc.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({Key? key}) : super(key: key);

  static const routeName = '/change-name';

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
                          InkWell(
                            onTap: () => staticProfileBloc.showImagePicker(context),
                            child: CircleAvatar(
                              radius: 50.0,
                              backgroundColor: Colors.grey[300],
                              child: profileBloc.getUserPhotoUrl(context) != null
                                  ? ClipOval(
                                      child: Image.network(
                                        profileBloc.getUserPhotoUrl(context)!,
                                        width: 100.0,
                                        height: 100.0,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : const Icon(
                                      Icons.person,
                                      size: 50.0,
                                      color: Colors.grey,
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Display Name',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          AppTextFormField(
                            hint: staticProfileBloc.getUserDisplayName(context),
                            validator: AppValidator.emptyValidator,
                            onSaved: staticProfileBloc.onNameSaved,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                    AppButton(
                      onTap: () => staticProfileBloc.submitChangeDisplayNameForm(context),
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
