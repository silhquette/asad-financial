import 'package:assad_app/widget/article_card.dart';
import 'package:assad_app/widget/wallet_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            'assets/images/header.png',
                            width: double.infinity,
                          ),
                          Container(
                            height: 120,
                            margin: const EdgeInsets.symmetric(
                                vertical: 32, horizontal: 24),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Maghrib',
                                        style: TextStyle(color: Colors.white)),
                                    Text(
                                      '17:43',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('Jum\'at, 01 Oktober 2021',
                                        style: TextStyle(color: Colors.white)),
                                    Text('24 Safar 1443 H',
                                        style: TextStyle(color: Colors.white)),
                                    Spacer(),
                                    Row(
                                      children: [
                                        Icon(Icons.pin_drop_outlined,
                                            color: Colors.white),
                                        Text(
                                          '24 Safar 1443 H',
                                          style: TextStyle(
                                              fontSize: 16, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 16)
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Image.asset(
                        'assets/images/image.png',
                        width: double.infinity,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 12),
                        child: Text(
                          'Pentingnya Integrasi Tasawuf  dalam Kurikulum Pembelajaran',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    bottom: 45,
                    right: 0,
                    child: Center(child: WalletCard(balance: 'Rp 23.986,00', onPressed: () {}))
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Berita & Artikel',
                          style:
                              TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Lihat Semua',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff050B79),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ArticleCard(
                        imagePath: 'assets/images/thumbnail-1.png',
                        title: 'Program Pendidikan Standarisasi Da’i MUI Ke-36',
                        date: '18/12/2024'),
                    ArticleCard(
                        imagePath: 'assets/images/thumbnail-2.png',
                        title: 'Ayo Nyantri di Pondok Pesantren As’ad',
                        date: '03/12/2024'),
                    ArticleCard(
                        imagePath: 'assets/images/thumbnail-3.png',
                        title: 'Perayaan Hari Santri tampak berbeda',
                        date: '31/10/2024'),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}
