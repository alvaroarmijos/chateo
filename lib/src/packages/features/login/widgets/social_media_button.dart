import 'package:chateo/src/packages/core/ui/ui.dart';
import 'package:flutter/material.dart';

class SocialMediaButton extends StatelessWidget {
  const SocialMediaButton({
    super.key,
    required this.icon,
    this.borderColor,
    this.onTap,
  });

  final String icon;
  final Color? borderColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = borderColor ?? ChateoColors.grey;

    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: Container(
        clipBehavior: Clip.hardEdge,
        padding: const EdgeInsets.all(ChateoDimens.dimen_4),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: color,
            )),
        child: Image.asset(icon),
      ),
    );
  }
}
