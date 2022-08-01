import 'package:flutter/material.dart';

class ErrorButton extends StatelessWidget {
  const ErrorButton({
    Key? key,
    required this.item,
    required this.errorMessage,
    required this.onPressFunction,
  }) : super(key: key);

  final String item;
  final String errorMessage;
  final VoidCallback onPressFunction;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.warning_amber,
        color: Colors.red,
      ),
      onPressed: () => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Could not get $item list'),
          content: Text(
            errorMessage,
          ),
          actions: [
            TextButton(
              onPressed: onPressFunction,
              child: const Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}
