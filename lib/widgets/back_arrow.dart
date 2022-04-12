import 'package:flutter/material.dart';

class BackIconData extends StatelessWidget {
  const BackIconData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => Navigator.pop(context, false),
      icon: const Icon(
        Icons.arrow_back_ios,
        size: 35,
        color: Colors.deepOrange,
      ),
    );
  }
}
