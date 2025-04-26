import 'package:assad_app/pages/finance/deposit_detail.dart';
import 'package:assad_app/pages/finance/withdrawal_detail.dart';
import 'package:assad_app/widget/custom_app_bar.dart';
import 'package:assad_app/widget/primary_button.dart';
import 'package:assad_app/widget/transaction_item.dart';
import 'package:flutter/material.dart';

class FinancePage extends StatelessWidget {
  const FinancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Keuangan'),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('Tanggal', style: TextStyle(fontSize: 16)),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_month_outlined),
                    enableFeedback: true,
                    color: const Color(0xff050B79),
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.blue.shade50)),
                  )
                ],
              ),
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.shade200,
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          width: double.infinity,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('saldo'),
                              Text(
                                'Rp 9.775.000',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 1,
                          color: Colors.grey.shade400,
                        ),
                        Container(
                          padding: EdgeInsets.all(12),
                          width: double.infinity,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Setoran'),
                              Text(
                                'Rp 10.720.000',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 4),
                              Text('Penarikan'),
                              Text(
                                'Rp 945.000',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 40,
                      right: 24,
                      child: Container(
                        width: 150,
                        child: PrimaryButton(
                            onPressed: () => Navigator.pushNamed(context, 'deposit_method'), text: 'Setor Keuangan'),
                      ))
                ],
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                width: double.infinity,
                child: const Text(
                    'Histori Transaksi',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800
                    ),
                ),
              ),
              TransactionItem(status: 'Penarikan', date: '09 Maret 2022', amount: '-Rp 300.000', onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const WithdrawalDetail(nominal: '-Rp 300.000')))),
              TransactionItem(status: 'Setoran', date: '09 Maret 2022', amount: '+Rp 200.000', onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DepositDetail(nominal: '+Rp 200.000')))),
              TransactionItem(status: 'Setoran', date: '09 Maret 2022', amount: '+Rp 500.000', onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DepositDetail(nominal: '+Rp 500.000')))),
              TransactionItem(status: 'Penarikan', date: '09 Maret 2022', amount: '-Rp 100.000', onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const WithdrawalDetail(nominal: '-Rp 100.000')))),
              TransactionItem(status: 'Penarikan', date: '09 Maret 2022', amount: '-Rp 150.000', onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const WithdrawalDetail(nominal: '-Rp 150.000')))),
              TransactionItem(status: 'Setoran', date: '09 Maret 2022', amount: '+Rp 250.000', onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DepositDetail(nominal: '+Rp 250.000')))),
              const SizedBox(height: 24)
            ],
          ),
        ));
  }
}