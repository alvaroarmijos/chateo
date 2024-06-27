import 'package:chateo/app/bloc/auth_bloc.dart';
import 'package:chateo/core/ui/widgets/chateo_avatar.dart';
import 'package:chateo/features/home/bloc/home_bloc.dart';
import 'package:chateo/features/home/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    final userState = context.read<AuthBloc>().state;
    final homeBloc = context.read<HomeBloc>();

    if (userState.existUser) {
      homeBloc
        ..add(GetChatUsersEvent(uid: userState.user!.uid))
        ..add(UpdateUserStatusEvent(status: true, user: userState.user!));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = context.read<AuthBloc>().state.user;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Home',
                  style: textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                  ),
                ),
                ChateoAvatar(
                  name: user?.displayName ?? '',
                  photoUrl: user?.photoURL,
                ),
              ],
            ),
          ),
          const ListChats(),
        ],
      ),
    );
  }
}
