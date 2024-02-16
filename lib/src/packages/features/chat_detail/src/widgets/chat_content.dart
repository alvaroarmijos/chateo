import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:chateo/src/packages/data/chat/chat.dart';
import 'package:chateo/src/packages/features/chat_detail/src/widgets/message_widget.dart';
import 'package:flutter/material.dart';

class ChatContent extends StatelessWidget {
  const ChatContent({
    super.key,
    required this.messages,
    required this.myUid,
    required this.name,
    required this.photoUrl,
  });

  final List<Message> messages;
  final String myUid;
  final String name;
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    final listController = ScrollController();
    // scroll(listController);

    return SafeArea(
      child: ListView.builder(
        controller: listController,
        padding: const EdgeInsets.only(bottom: ChateoDimens.dimen_60),
        itemCount: messages.length,
        itemBuilder: (context, index) => MessageWidget(
          msg: messages[index].msg,
          // date: messages[index].date,
          // mySelf: messages[index].sentBy == myUid,
          mySelf: false,
          name: name,
          photoUrl: photoUrl,
        ),
      ),
    );
  }

  // void scroll(ScrollController listController) {
  //   SchedulerBinding.instance.addPostFrameCallback((_) {
  //     listController.animateTo(
  //       listController.position.maxScrollExtent,
  //       duration: const Duration(seconds: 1),
  //       curve: Curves.fastOutSlowIn,
  //     );
  //   });
  // }
}
