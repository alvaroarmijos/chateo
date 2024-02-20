import 'package:chateo/src/packages/features/chat_detail/src/bloc/chat_bloc.dart';
import 'package:chateo/src/packages/features/chat_detail/src/widgets/app_bar_title.dart';
import 'package:chateo/src/packages/features/chat_detail/src/widgets/chat_content.dart';
import 'package:chateo/src/packages/features/chat_detail/src/widgets/chateo_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetailPage extends StatefulWidget {
  const ChatDetailPage({
    super.key,
    required this.userChatName,
    required this.userChatPhotoUrl,
    required this.userChatStatus,
    required this.myUid,
    required this.chatUserId,
  });

  final String userChatName;
  final String? userChatPhotoUrl;
  final bool userChatStatus;
  final String myUid;
  final String chatUserId;

  @override
  State<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  late final ChatBloc chatBloc;

  @override
  void initState() {
    chatBloc = context.read<ChatBloc>()
      ..add(GetChatEvent(widget.chatUserId, widget.myUid));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: AppBarTitle(
        userChatName: widget.userChatName,
        userChatPhotoUrl: widget.userChatPhotoUrl,
        userChatStatus: widget.userChatStatus,
      )),
      body: Stack(
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
                              'Envia un mensaje para inical una conversación.'))
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
            onSend: (msg) => chatBloc.add(
              SendMessageEvent(
                widget.chatUserId,
                widget.myUid,
                msg,
              ),
            ),
          )
        ],
      ),
    );
  }
}
