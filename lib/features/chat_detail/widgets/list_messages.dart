import 'package:chateo/app/bloc/auth_bloc.dart';
import 'package:chateo/data/chat/domain/chat_user.dart';
import 'package:chateo/features/chat_detail/bloc/chat_bloc.dart';
import 'package:chateo/features/chat_detail/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListMessages extends StatefulWidget {
  const ListMessages({
    super.key,
    required this.chatUser,
  });

  final ChatUser chatUser;

  @override
  State<ListMessages> createState() => _ListMessagesState();
}

class _ListMessagesState extends State<ListMessages> {
  late final myUid;

  @override
  void initState() {
    super.initState();
    myUid = context.read<AuthBloc>().state.user?.uid;

    context.read<ChatBloc>().add(
          GetChatEvent(
            chatUserId: widget.chatUser.uid,
            uid: myUid,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    final scrollController = ScrollController();

    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        scrollLastMessage(scrollController);
      },
      builder: (context, state) {
        if (state.messages == null) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }

        return Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
              controller: scrollController,
              itemCount: state.messages!.length,
              itemBuilder: (context, index) {
                final message = state.messages![index];

                return MessageWidget(
                  mySelf: message.sentBy == myUid,
                  userName: widget.chatUser.name,
                  photoUrl: widget.chatUser.photoUrl,
                  msg: message.msg,
                  date: message.date,
                );
              }),
        );
      },
    );
  }

  void scrollLastMessage(ScrollController scrollController) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    });
  }
}
