import 'package:assad_app/models/bank_model.dart';
import 'package:assad_app/pages/finance/deposit_confirmation.dart';
import 'package:assad_app/widget/custom_text_form_field.dart';
import 'package:assad_app/widget/primary_button.dart';
import 'package:flutter/material.dart';

import 'package:assad_app/widget/custom_app_bar.dart';
import 'package:assad_app/widget/selected_bank_card.dart';

class DepositForm extends StatelessWidget {
  DepositForm({super.key, required this.bank, });

  final Bank bank;

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nominalController = TextEditingController();

  // Simple valiadtion
  String? nominalValidator(int? value) {
    if (value == null) {
      return 'Nominal tidak boleh kosong';
    }

    if (value < bank.minimumTransaction) {
      return 'Nominal minimal adalah Rp${bank.minimumTransaction}';
    }

    if (value > 20000000) {
      return 'Nominal maksimal adalah Rp20.000.000';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: const CustomAppBar(title: 'Setor Keuangan'),
        body: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bank yang dipilih',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SelectedBankCard(bank: bank),
                  const SizedBox(height: 24),
                  const Text(
                    'Jumlah Transfer',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: CustomTextFormField(
                        controller: _nominalController,
                        hintText: '0',
                        inputType: TextInputType.number,
                        prefixText: 'Rp ',
                        autofocus: true,
                        validator: (value) => nominalValidator(int.tryParse(value ?? '')) ,
                    ),
                  ),
                  const Spacer(),
                  PrimaryButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DepositConfirmation(
                                bank: bank,
                                nominal: int.tryParse(_nominalController.text) ?? 0,
                              ),
                            ),
                          );
                        }
                      },
                      text: 'Lanjutkan'
                  )
                ]
            )
        )
    );
  }
}
