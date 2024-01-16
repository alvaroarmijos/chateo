import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:chateo/src/packages/data/account/account.dart';
import 'package:chateo/src/packages/features/profile/profile.dart';
import 'package:chateo/src/packages/features/profile/src/widgets/profile_item.dart';
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
            name: user.name ?? '',
            photoUrl: user.photoUrl,
            radius: ChateoDimens.dimen_36,
          ),
        ),
        Text(
          user.name ?? '',
          style: textTheme.labelLarge?.copyWith(
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: ChateoDimens.dimen_4,
        ),
        Text(
          user.email ?? '',
          style: textTheme.bodySmall?.copyWith(
            color: ChateoColors.darkGrey,
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: ChateoDimens.dimen_40,
            horizontal: ChateoDimens.dimen_12,
          ),
          height: height,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(ChateoDimens.dimen_40),
              topRight: Radius.circular(ChateoDimens.dimen_40),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ProfileItem(
                title: 'Display Name',
                subtitle: user.name,
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
                  onPressed: () =>
                      context.read<ProfileBloc>().add(LogOutEvent(user)),
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
