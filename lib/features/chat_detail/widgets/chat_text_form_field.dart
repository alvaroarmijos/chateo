import 'package:chateo/core/ui/colors.dart';
import 'package:flutter/material.dart';

class ChatTextFormField extends StatelessWidget {
  const ChatTextFormField({super.key});

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
                onPressed: () {},
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
