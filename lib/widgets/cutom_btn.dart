import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final Function onFcn;
  const CustomBtn({super.key, required this.onFcn});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        onFcn();
      },
      icon: const Icon(Icons.check_sharp, color: Colors.white),
      label: const Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),
    );
  }
}
