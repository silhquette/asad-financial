import 'package:flutter/material.dart';

class ReceiptOverlay extends StatelessWidget {
  const ReceiptOverlay({super.key, required this.imgPath, required this.onClose});

  final String imgPath;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onClose,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Spacer(),
                IconButton(onPressed: onClose, icon: const Icon(Icons.close, color: Colors.white))
              ],
            ),
            Image.asset(imgPath),
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Ketuk di mana saja untuk menutup',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
