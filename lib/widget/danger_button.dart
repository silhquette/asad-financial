import 'package:flutter/material.dart';

class DangerButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const DangerButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0.0),
          backgroundColor: const WidgetStatePropertyAll(Color(0xffD32F2F)), // Warna merah untuk tombol berbahaya
          foregroundColor: const WidgetStatePropertyAll(Colors.white),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}
