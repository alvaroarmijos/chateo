import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:chateo/src/packages/features/chat_detail/src/bloc/chat_bloc.dart';
import 'package:chateo/src/packages/features/chat_detail/src/widgets/chateo_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/app_bar_title.dart';
import '../widgets/chat_content.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({
    super.key,
    required this.userChatUid,
    required this.myUid,
    required this.userChatName,
    this.userChatPhotoUrl,
    required this.userChatStatus,
  });

  final String userChatUid;
  final String myUid;
  final String userChatName;
  final String? userChatPhotoUrl;
  final bool userChatStatus;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  void initState() {
    context
        .read<ChatBloc>()
        .add(GetChatsEvent(widget.userChatUid, widget.myUid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: AppBarTitle(
          userChatName: widget.userChatName,
          userChatPhotoUrl: widget.userChatPhotoUrl,
          userChatStatus: widget.userChatStatus,
          textTheme: textTheme,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: ChateoDimens.dimen_12),
        child: Stack(
          children: [
            BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                return switch (state) {
                  ChatLoading() => const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ChatError() => const Center(
                      child: Text('Algo salió mal. Intenta nuevamente'),
                    ),
                  ChatSuccess(messages: final messages, myUid: final myUid) =>
                    messages.isEmpty
                        ? const Center(
                            child: Text(
                                "Envía un mensaje para iniciar una conversación."),
                          )
                        : ChatContent(
                            messages: messages,
                            myUid: myUid,
                            name: widget.userChatName,
                            photoUrl: widget.userChatPhotoUrl,
                          ),
                };
              },
            ),
            ChateoTextFormField(
              onSend: (msg) => context.read<ChatBloc>().add(
                    SendMessageEvent(
                      widget.userChatUid,
                      widget.myUid,
                      msg,
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
