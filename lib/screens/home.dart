import 'package:e_commerceapp/screens/fav_page.dart';
import 'package:e_commerceapp/screens/store_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  Widget _buildCurrentPage() {
    if (_currentIndex == 0) return StorePage();
    if (_currentIndex == 1) {
      return FavPage();
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 8,
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search product",
              prefixIcon: const Icon(Icons.search),
              isDense: true,
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        actions: [
          _appBarIcon("assets/icons/Cart Icon.svg", () {}),
          SizedBox(width: 8),
          _appBarIcon("assets/icons/Bell.svg", () {}),
          SizedBox(width: 8),
        ],
      ),

      body: SafeArea(child: _buildCurrentPage()),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFFFF7643),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Shop Icon.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(Color(0xFFFF7643), BlendMode.srcIn),
            ),
            label: "Store",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Heart Icon.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Heart Icon.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(Color(0xFFFF7643), BlendMode.srcIn),
            ),
            label: "Fav",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/Chat bubble Icon.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/Chat bubble Icon.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(Color(0xFFFF7643), BlendMode.srcIn),
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(Colors.grey, BlendMode.srcIn),
            ),
            activeIcon: SvgPicture.asset(
              "assets/icons/User Icon.svg",
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(Color(0xFFFF7643), BlendMode.srcIn),
            ),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _appBarIcon(String iconPath, VoidCallback onTap) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
      child: IconButton(onPressed: onTap, icon: SvgPicture.asset(iconPath)),
    );
  }
}
