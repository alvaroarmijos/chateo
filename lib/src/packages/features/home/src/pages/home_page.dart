import 'package:chateo/src/packages/features/home/src/bloc/home_bloc.dart';
import 'package:chateo/src/packages/features/home/src/widgets/home_content.dart';
import 'package:chateo/src/packages/features/home/src/widgets/home_error.dart';
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
    context.read<HomeBloc>().add(const GetChatUsersEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return switch (state) {
            HomeLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            HomeError() => const HomeErrorWidget(),
            HomeSucces(chats: final chats, user: final user) => (user == null)
                ? const HomeErrorWidget()
                : HomeContent(
                    chats: chats,
                    user: user,
                  ),
          };
        },
      ),
    );
  }
}
