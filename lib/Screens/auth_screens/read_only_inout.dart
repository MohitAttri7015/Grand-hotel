import 'package:flutter/material.dart';

class ReadOnlyField extends StatelessWidget {
  final String text;

  const ReadOnlyField({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
      decoration: BoxDecoration(
        color:  Color.fromRGBO(246, 246, 246, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 13,
          fontFamily: 'Inter_Medium',
          color: Color.fromARGB(255, 115, 115, 115)
        ),
      ),
    );
  }
}
