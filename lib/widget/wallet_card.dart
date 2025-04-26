import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  final String balance;
  final VoidCallback onPressed;

  const WalletCard({
    super.key,
    required this.balance,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 64,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(8)),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Image.asset('assets/icons/wallet.png'),
              const SizedBox(width: 12),
              Text(
                balance,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 64,
          width: 1,
          color: Colors.grey,
        ),
        Container(
          height: 64,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(8)),
            color: Colors.white,
          ),
          child: TextButton(
            onPressed: onPressed,
            child: const Row(
              children: [
                Text(
                  'Lihat Keuangan',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: Color(0xff050B79),
                  ),
                ),
                Icon(Icons.chevron_right, color: Color(0xff050B79)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
