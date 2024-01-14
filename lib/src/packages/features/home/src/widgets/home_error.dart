import 'package:flutter/material.dart';

class HomeErrorWidget extends StatelessWidget {
  const HomeErrorWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Algo salió mal. Vuelve a intentar'),
    );
  }
}
