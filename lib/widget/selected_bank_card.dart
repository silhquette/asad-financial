import 'package:assad_app/models/bank_model.dart';
import 'package:flutter/material.dart';

class SelectedBankCard extends StatelessWidget {
  const SelectedBankCard({super.key, required this.bank});

  final Bank bank;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Image.asset(
            bank.imagePath,
            width: 32,
          ),
          const SizedBox(width: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                bank.name,
                style: const TextStyle(color: Colors.black),
              ),
              Text(
                'Minimal transaksi ${bank.getMinimumRupiah()}',
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
