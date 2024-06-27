import 'package:chateo/features/home/bloc/home_bloc.dart';
import 'package:chateo/features/home/widgets/user_chat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListChats extends StatelessWidget {
  const ListChats({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 0.7;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.users == null) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Chats',
                  style: textTheme.titleLarge,
                ),
              ),
              // Lista de usuarios
              Expanded(
                child: ListView.builder(
                  itemCount: state.users!.length,
                  itemBuilder: (context, index) {
                    final chatUser = state.users![index];
                    return UserChatItem(
                      chatUser: chatUser,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
