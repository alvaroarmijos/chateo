import 'package:chateo/src/packages/features/profile/src/widgets/profile_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../profile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(const GetUserEvent());

    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return switch (state) {
              ProfileLoading() => const Center(
                  child: CircularProgressIndicator(),
                ),
              ProfileError() => const Center(
                  child: Text('Algo salió mal. Intenta nuevamente'),
                ),
              ProfileSuccess(user: final user) => ProfileContent(user: user),
            };
          },
        ));
  }
}
