import 'package:assad_app/widget/danger_button.dart';
import 'package:flutter/material.dart';
import 'package:assad_app/widget/custom_app_bar.dart';
import 'package:assad_app/widget/primary_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Profil'),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade200,
                ),
                margin: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    const Padding(
                        padding: EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Text(
                              'Muhammad Fadhli',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                              ),
                            )
                          ],
                        )),
                    Container(
                      height: 1,
                      color: Colors.grey.shade400,
                    ),
                    infoTile('Tingkat', 'Madrasah Ibtidaiyah'),
                    infoTile('Kelas', '-'),
                    infoTile('NSM', '123456789001'),
                    infoTile('Tempat, Tanggal Lahir', 'Yogyakarta, 21 April 2008'),
                    infoTile('Jenis Kelamin', 'Laki-laki'),
                    infoTile('Alamat', 'Jl. Jalan No. 01'),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 24, left: 24, bottom: 24),
              child: Row(
                children: [
                  Expanded(
                    child: DangerButton(onPressed: () {}, text: 'Keluar'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: PrimaryButton(onPressed: () => Navigator.pushNamed(context, 'qr_code'), text: 'QR Code'),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

Widget infoTile(String label, String value) {
  return Container(
    width: double.infinity,
    margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}