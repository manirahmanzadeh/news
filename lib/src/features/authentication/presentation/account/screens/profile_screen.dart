import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_app/src/core/components/drawer.dart';
import 'package:news_app/src/features/authentication/presentation/account/bloc/profile_bloc.dart';

import '../../../../../core/components/bottom_nav_bar.dart';
import '../bloc/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    final profileBloc = BlocProvider.of<ProfileBloc>(context, listen: true);
    final staticProfileBloc = BlocProvider.of<ProfileBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF223263),
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ),
      ),
      drawer: const AppDrawer(),
      bottomNavigationBar: const BottomNavBar(index: 2),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (_, state) {
          if (state is LoadingProfileState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView(
              children: [
                const Divider(
                  color: Color(0xFFEBF0FF),
                ),
                ListTile(
                  leading: CircleAvatar(
                    radius: 36,
                    backgroundImage: profileBloc.hasPhoto(context) ? NetworkImage(profileBloc.getUserPhotoUrl(context)!) : null,
                    child: !profileBloc.hasPhoto(context) ? const Icon(Icons.person) : null,
                  ),
                  minVerticalPadding: 24,
                  title: Text(
                    profileBloc.getUserDisplayName(context) ?? 'Set a display name',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  subtitle: Text(
                    profileBloc.getUserEmail(context) ?? 'Set an Email',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xFF9098B1)),
                  ),
                  onTap: () => staticProfileBloc.goToChangeName(context),
                ),
                // ListTile(
                //   onTap: () => staticProfileBloc.goToChangeEmail(context),
                //   leading: SvgPicture.asset(
                //     'assets/icons/email.svg',
                //     height: 16,
                //   ),
                //   minVerticalPadding: 16,
                //   title: Row(
                //     children: <Widget>[
                //       Text(
                //         'Email',
                //         style: Theme.of(context).textTheme.labelLarge,
                //       ),
                //       Expanded(child: Container()),
                //       Text(
                //         profileBloc.getUserEmail(context) ?? 'Set an Email',
                //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: const Color(0xFF9098B1)),
                //       ),
                //       const SizedBox(
                //         width: 16,
                //       ),
                //       SvgPicture.asset(
                //         'assets/icons/arrow-right.svg',
                //         height: 16,
                //       )
                //     ],
                //   ),
                // ),
                ListTile(
                  onTap: () => staticProfileBloc.goToChangePassword(context),
                  leading: SvgPicture.asset(
                    'assets/icons/passphrase.svg',
                    height: 16,
                  ),
                  minVerticalPadding: 16,
                  title: Row(
                    children: <Widget>[
                      Text(
                        'Change Password',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Expanded(child: Container()),
                      Text(
                        '..........',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: const Color(0xFF9098B1),
                            ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SvgPicture.asset(
                        'assets/icons/arrow-right.svg',
                        height: 16,
                      )
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
