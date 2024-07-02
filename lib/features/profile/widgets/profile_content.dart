import 'package:chateo/core/ui/colors.dart';
import 'package:chateo/core/ui/widgets/chateo_avatar.dart';
import 'package:chateo/features/profile/cubit/profile_cubit.dart';
import 'package:chateo/features/profile/widgets/profile_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final height = MediaQuery.sizeOf(context).height * 0.7;

    return Column(
      children: [
        Hero(
          tag: user.uid,
          child: ChateoAvatar(
            name: user.displayName ?? '',
            photoUrl: user.photoURL,
            radius: 36,
          ),
        ),
        Text(
          user.displayName ?? '',
          style: textTheme.labelLarge?.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          user.email ?? '',
          style: textTheme.bodySmall?.copyWith(
            color: AppColors.darkGrey,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 12,
          ),
          height: height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ProfileItem(
                title: 'Display Name',
                subtitle: user.displayName,
              ),
              ProfileItem(
                title: 'Email Address',
                subtitle: user.email,
              ),
              ProfileItem(
                title: 'Phone Number',
                subtitle: user.phoneNumber,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    context.read<ProfileCubit>().logOut(user);
                  },
                  child: const Text('Log out'),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
