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
  late final TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ColoredBox(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(ChateoDimens.dimen_12),
            child: Row(
              children: [
                Flexible(
                  child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    minLines: 1,
                    maxLines: 5,
                    decoration: InputDecoration(
                      hintText: 'Write your message',
                      fillColor: ChateoColors.greyForm,
                      filled: true,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: ChateoDimens.dimen_8,
                        horizontal: ChateoDimens.dimen_16,
                      ),
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
                FloatingActionButton.small(
                  onPressed: () {
                    final msg = _controller.text;

                    if (msg.isNotEmpty) {
                      widget.onSend(msg);
                      _controller.clear();
                    }
                  },
                  child: const Icon(
                    Icons.send,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
