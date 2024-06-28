import 'package:chateo/app/bloc/auth_bloc.dart';
import 'package:chateo/core/ui/colors.dart';
import 'package:chateo/features/chat_detail/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatTextFormField extends StatefulWidget {
  const ChatTextFormField({
    super.key,
    required this.chatUserId,
  });

  final String chatUserId;

  @override
  State<ChatTextFormField> createState() => _ChatTextFormFieldState();
}

class _ChatTextFormFieldState extends State<ChatTextFormField> {
  final TextEditingController _chatController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12).copyWith(
            bottom: 20,
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _chatController,
                  minLines: 1,
                  maxLines: 5,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    filled: true,
                    fillColor: AppColors.greyForm,
                    hintText: 'Write your message',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: AppColors.darkGrey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.greyForm),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: AppColors.greyForm),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              FloatingActionButton.small(
                onPressed: () {
                  final msg = _chatController.text;
                  final uid = context.read<AuthBloc>().state.user?.uid ?? '';

                  if (msg.isNotEmpty) {
                    context.read<ChatBloc>().add(SendMessageEvent(
                          chatUserId: widget.chatUserId,
                          msg: msg,
                          uid: uid,
                        ));

                    _chatController.clear();
                  }
                },
                shape: const CircleBorder(),
                elevation: 0,
                child: const Icon(Icons.send),
              )
            ],
          ),
        ),
      ),
    );
  }
}
