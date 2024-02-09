import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.iconPath,
    this.onTap,
    this.color,
    this.borderColor = Colors.black,
  });

  final String iconPath;
  final VoidCallback? onTap;
  final Color? color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ChateoDimens.dimen_8),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        shape: BoxShape.circle,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Image.asset(
          iconPath,
          color: color,
        ),
      ),
    );
  }
}
