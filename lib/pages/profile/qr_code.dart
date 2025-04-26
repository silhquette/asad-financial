import 'package:assad_app/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QrCode extends StatelessWidget {
  const QrCode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Qr Code'),
      backgroundColor: const Color(0xff050B79),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white
                  ),
                  padding: const EdgeInsets.all(40),
                  width: 340,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 16),
                      const Text('Tunjukkan QR untuk pembayaran', style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 16),
                      Image.asset('assets/images/qr_code.png'),
                      const SizedBox(height: 24),
                      Container(
                        padding: EdgeInsets.symmetric(vertical:8, horizontal:16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(99),
                            color: Colors.red.shade50
                        ),
                        child: Text('Kode berlaku 00:21', style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.w500)),
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: -40,
                  left: MediaQuery.of(context).size.width / 2 - 70,
                  child: Container(
                    height: 80,
                    width: 80,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(99),
                      color: Colors.blue.shade50,
                      border: Border.all(
                        color: Color(0xff050B79),
                        width: 8,
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/scan-svgrepo-com.svg',
                      colorFilter: const ColorFilter.mode(
                        Color(0xff050B79),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                )
              ],
            ),
            
            const SizedBox(height: 32),
            const Text(
                'Pastikan nominal transaksi sudah sesuai!',
                style: TextStyle(
                  color: Colors.white
                ),
            ),
          ],
        ),
      ),
    );
  }
}
