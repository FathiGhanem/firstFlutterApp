import 'package:e_commerceapp/screens/fav_page.dart';
import 'package:e_commerceapp/screens/store_page.dart';
import 'package:flutter/material.dart';

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
          _appBarIcon(Icons.shopping_cart_outlined, () {}),
          SizedBox(width: 8),
          _appBarIcon(Icons.notifications_none, () {}),
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
          BottomNavigationBarItem(icon: Icon(Icons.storefront), label: "Store"),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: "Fav",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  Widget _appBarIcon(IconData icon, VoidCallback onTap) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(icon, size: 20, color: Colors.grey),
      ),
    );
  }
}
