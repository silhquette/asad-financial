import 'package:assad_app/widget/custom_app_bar.dart';
import 'package:assad_app/widget/dashed_separator.dart';
import 'package:assad_app/widget/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:assad_app/pages/finance/receipt_overlay.dart';

class WithdrawalDetail extends StatefulWidget {
  const WithdrawalDetail({super.key, required this.nominal});

  final String nominal;

  @override
  State<WithdrawalDetail> createState() => _WithdrawalDetailState();
}

class _WithdrawalDetailState extends State<WithdrawalDetail> {

  OverlayEntry? _overlayEntry;

  void _showReceiptOverlay() {
    _overlayEntry = OverlayEntry(
      builder: (context) => Material(
        type: MaterialType.transparency,
        child: ReceiptOverlay(
          imgPath: 'assets/images/bukti-transfer.png',
          onClose: () => _overlayEntry?.remove(),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const CustomAppBar(title: 'Detail Transaksi'),
      body: Column(
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.all(24),
                  padding: EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      )
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          color: Color(0xff050B79),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/upload-svgrepo-com.svg',
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Total Setor',
                        style: TextStyle(
                            fontSize: 16
                        ),
                      ),
                      Text(
                        widget.nominal,
                        style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(height: 60),
                      transactionInfo(
                          label: 'Waktu Transaksi',
                          value: const Text(
                            '09 Maret 2022, 12:30',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          )
                      ),
                      transactionInfo(
                          label: 'ID Transaksi',
                          value: const Text(
                            '#ASD76AS5DASOF0',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          )
                      ),
                      transactionInfo(
                          label: 'Status Transaksi',
                          value: transactionStatus(status: 'Berhasil')
                      ),
                    ],
                  ),
                ),
                Positioned (
                  top: 226,
                  left: 0,
                  right: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      cropCircle(),
                      SizedBox(
                        width: 320,
                        child: DashedSeparator(color: Colors.grey),
                      ),
                      cropCircle(),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 24),
            padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                )
            ),
            child: transactionInfo(
                label: 'Tujuan Penarikan',
                value: const Text(
                  'Biaya Asrama',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                )
            ),
          )
        ],
      ),
    );
  }
}

Widget transactionInfo({required String label, required Widget value}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
              color: Colors.grey
          ),
        ),
        value,
      ],
    ),
  );
}

Widget transactionStatus({required String status}) {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(99),
        color: Colors.blue.shade100
    ),
    child: Text(
      status,
      style: const TextStyle(
          color: Color(0xff050B79)
      ),
    ),
  );
}

Widget cropCircle() {
  return Container(
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.grey.shade200,
    ),
    height: 24,
    width: 24,
  );
}