import 'package:chateo/core/ui/colors.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    if ((subtitle ?? '').isEmpty) {
      return const SizedBox();
    }

    return ListTile(
      title: Text(
        title,
        style: textTheme.bodySmall?.copyWith(color: AppColors.darkGrey),
      ),
      subtitle: Text(
        subtitle!,
        style: textTheme.titleMedium,
      ),
    );
  }
}
