import 'package:assad_app/pages/finance/deposit_form.dart';
import 'package:flutter/material.dart';
import 'package:assad_app/widget/bank_option_button.dart';
import 'package:assad_app/widget/custom_app_bar.dart';

import 'package:assad_app/models/bank_model.dart';

class DepositMethod extends StatelessWidget {
  const DepositMethod({super.key});

  @override
  Widget build(BuildContext context) {

    Iterable<Padding> options = bankOptions.map((bank) => Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: BankOptionButton(
          bankName: 'Bank ${bank.name}',
          assetIconPath: bank.imagePath,
          minimumTransaction: bank.getMinimumRupiah(),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DepositForm(bank: bank)))
        )
    ));

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CustomAppBar(title: 'Setor Keuangan'),
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Transfer via Bank',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 16),
            ...options,
          ],
        ),
      ),
    );
  }
}
