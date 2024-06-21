import 'package:flutter/material.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    const dividerColor = Color(0xFFCDD1D0);
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: dividerColor.withOpacity(0.2),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'OR',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: dividerColor.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
