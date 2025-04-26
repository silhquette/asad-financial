import 'package:accordion/accordion.dart';
import 'package:assad_app/models/bank_model.dart';
import 'package:assad_app/utils/currency_formatter.dart';
import 'package:assad_app/widget/action_button.dart';
import 'package:assad_app/widget/custom_app_bar.dart';
import 'package:assad_app/widget/primary_button.dart';
import 'package:assad_app/widget/selected_bank_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assad_app/services/image_service.dart';

class DepositConfirmation extends StatefulWidget {
  const DepositConfirmation(
      {super.key, required this.bank, required this.nominal});

  final Bank bank;
  final int nominal;

  @override
  State<DepositConfirmation> createState() => _DepositConfirmationState();
}

class _DepositConfirmationState extends State<DepositConfirmation> {
  String? fileName;

  Future<void> _pickImage() async {
    final image = await ImageService.pickImageFromGallery();
    if (image != null) {
      setState(() {
        fileName = image.name;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: const CustomAppBar(title: 'Setor Keuangan'),
        body: SingleChildScrollView(
          child: Container(
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
                    SelectedBankCard(bank: widget.bank),
                    const SizedBox(height: 24),
                    const Text(
                      'Detail Pembayaran',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      decoration: BoxDecoration(
                          color: Colors.blue.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.blue, width: 1)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Jumlah Transfer'),
                                Text(formatRupiah(widget.nominal)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 12.0, left: 12.0, right: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Biaya'),
                                Text(formatRupiah(1000)),
                              ],
                            ),
                          ),
                          Container(
                            height: 1,
                            color: Colors.blue,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Biaya',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Text(formatRupiah(widget.nominal + 1000),
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Informasi Bank',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Text(
                      'Transfer total setoran dengan tujuan akun berikut',
                      style: TextStyle(color: Colors.grey),
                    ),
                    bankInformation(context: context),
                    const SizedBox(height: 24),
                    const Text(
                      'Cara Pembayaran',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Text(
                      'Ikuti instruksi di bawah ini sesuai dengan metode transfer yang kamu gunakan',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Accordion(
                      paddingListHorizontal: 0,
                      openAndCloseAnimation: true,
                      headerBackgroundColor: Colors.white,
                      headerBorderRadius: 8,
                      headerPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      disableScrolling: true,
                      flipRightIconIfOpen: true,
                      rightIcon: Icon(Icons.expand_more_rounded),
                      contentBorderColor: Colors.transparent,
                      contentHorizontalPadding: 32,
                      maxOpenSections: 1,
                      scaleWhenAnimating: false,
                      children: [
                        AccordionSection(
                          header: Text('Melalui ATM ${widget.bank.name}',
                              style:
                              TextStyle(fontWeight: FontWeight.bold)),
                          content: const Text(
                            '''
1. Masukkan kartu ATM dan PIN Anda.
2. Pilih menu “Transaksi Lainnya”.
3. Pilih “Transfer”.
4. Pilih “Ke Rek Bank Lain” atau “Antar Bank”.
5. Masukkan kode bank tujuan dan nomor rekening penerima.
6. Masukkan nominal transfer sesuai jumlah yang diminta.
7. Konfirmasi data yang muncul di layar.
8. Selesai. Simpan bukti transfer sebagai bukti pembayaran.
''',
                            style: TextStyle(height: 1.5),
                          ),
                        ),
                        AccordionSection(
                          header: Text('Melalui Mobile Banking ${widget.bank.name}',
                              style:
                              TextStyle(fontWeight: FontWeight.bold)),
                          content: Text(
                            '''
1. Buka aplikasi Mobile Banking ${widget.bank.name} dan login.
2. Pilih menu “Transfer”.
3. Pilih “Transfer ke Bank Lain” jika beda bank.
4. Masukkan nomor rekening tujuan.
5. Masukkan nominal transfer sesuai jumlah yang diminta.
6. Tambahkan berita transfer jika diperlukan (misalnya: Pembayaran).
7. Konfirmasi detail transaksi yang muncul.
8. Masukkan PIN/OTP untuk menyelesaikan transaksi.
9. Simpan atau screenshot bukti transfer sebagai bukti pembayaran.
''',
                            style: TextStyle(height: 1.5),
                          ),
                        )
                      ],
                    ),
                    const Text(
                      'Bukti Pembayaran',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    const Text(
                      'Mohon untuk menyertakan bukti pembayaran. Langkah ini bersifat wajib.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 12),
                    ActionButton(
                        onPressed: _pickImage,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(width: 12),
                            const Icon(Icons.add, color: Color(0xff050B79)),
                            const SizedBox(width: 24),
                            Text(
                              fileName ?? 'Upload Bukti Transfer',
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                    ),
                    const SizedBox(height: 24),
                    PrimaryButton(
                        onPressed: fileName != null
                            ? () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        }
                            : null,
                        text: 'Saya Sudah Transfer'
                    )

                  ])),
        ));
  }
}

Widget bankInformation({required context}) {
  return Container(
    margin: EdgeInsets.only(top: 12),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 1)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nomor rekening bank'),
                  Text('098123486759020',
                      style: TextStyle(
                          fontWeight: FontWeight.bold)),
                ],
              ),
              IconButton(
                  onPressed: () {
                    Clipboard.setData(const ClipboardData(text: '098123486759020'));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Teks berhasil disalin')),
                    );
                  },
                  icon: const Icon(Icons.copy,
                      color: Color(0xff050B79)))
            ],
          ),
        ),
        Container(
          height: 1,
          color: Colors.grey,
        ),
        const Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama akun bank'),
              Text('PESANTREN AS\'AD',
                  style:
                  TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ],
    ),
  );
}