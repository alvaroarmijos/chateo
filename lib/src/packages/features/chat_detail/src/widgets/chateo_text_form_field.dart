import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:flutter/material.dart';

class ChateoTextFormField extends StatefulWidget {
  const ChateoTextFormField({
    super.key,
    required this.onSend,
  });

  final Function(String msg) onSend;

  @override
  State<ChateoTextFormField> createState() => _ChateoTextFormFieldState();
}

class _ChateoTextFormFieldState extends State<ChateoTextFormField> {
  late final TextEditingController _msgController;

  @override
  void initState() {
    _msgController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(ChateoDimens.dimen_12),
          child: Row(
            children: [
              Flexible(
                child: TextFormField(
                  textInputAction: TextInputAction.newline,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  controller: _msgController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: ChateoDimens.dimen_8,
                      horizontal: ChateoDimens.dimen_16,
                    ),
                    hintText: 'Write your message',
                    hintStyle: TextStyle(
                      fontSize: 12,
                      color: ChateoColors.darkGrey,
                    ),
                    fillColor: ChateoColors.greyForm,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ChateoColors.greyForm,
                      ),
                      borderRadius: BorderRadius.circular(
                        ChateoDimens.dimen_20,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: ChateoColors.greyForm,
                      ),
                      borderRadius: BorderRadius.circular(
                        ChateoDimens.dimen_20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: ChateoDimens.dimen_12,
              ),
              FloatingActionButton.small(
                onPressed: () {
                  final msg = _msgController.text.trim();
                  if (msg.isNotEmpty) {
                    widget.onSend(msg);
                    _msgController.clear();
                  }
                },
                shape: const CircleBorder(),
                backgroundColor: ChateoColors.primaryChat,
                elevation: 0,
                child: const Icon(
                  Icons.send,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
