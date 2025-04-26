import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:assad_app/pages/home.dart';
import 'package:assad_app/pages/finance/finance.dart';
import 'package:assad_app/pages/profile/profile.dart';

class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key, required this.pageIndex});

  final int pageIndex;

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const FinancePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Set tab yang dipilih
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: Colors.white,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home-angle-svgrepo-com.svg',
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/home-smile-angle-svgrepo-com.svg',
              colorFilter: const ColorFilter.mode(
                Color(0xff050B79),
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/wallet-money-outline-svgrepo-com.svg',
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/wallet-money-fill-svgrepo-com.svg',
              colorFilter: const ColorFilter.mode(
                Color(0xff050B79),
                BlendMode.srcIn,
              ),
            ),
            label: 'Keuangan',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user-circle-svgrepo-com.svg',
              colorFilter: const ColorFilter.mode(
                Colors.grey,
                BlendMode.srcIn,
              ),
            ),
            activeIcon: SvgPicture.asset(
              'assets/icons/user-fill-svgrepo-com.svg',
              colorFilter: const ColorFilter.mode(
                Color(0xff050B79),
                BlendMode.srcIn,
              ),
            ),
            label: 'Home',
          ),
        ],
      ),
    );
  }
}
