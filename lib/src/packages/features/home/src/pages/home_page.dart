import 'package:chateo/src/packages/features/home/src/bloc/home_bloc.dart';
import 'package:chateo/src/packages/features/home/src/widgets/home_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(const GetChatUsersEvent());
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return switch (state) {
            HomeLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
            HomeError() => const Center(
                child: Text('Algo salió mal. Vuelve a intentar'),
              ),
            HomeSucces(chats: final chats) => HomeContent(
                chats: chats,
              ),
          };
        },
      ),
    );
  }
}
