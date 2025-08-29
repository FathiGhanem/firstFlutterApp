import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFFFF7643),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "A Summer Surprise",
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Cashback 20%",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 23),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _iconsCateg(Icons.flash_on, () {}, "Flash Deal"),
                  _iconsCateg(Icons.receipt_long, () {}, "Bill"),
                  _iconsCateg(Icons.sports_esports, () {}, "Game"),
                  _iconsCateg(Icons.card_giftcard, () {}, "Daily Gift"),
                  _iconsCateg(Icons.explore, () {}, "More"),
                ],
              ),
              SizedBox(height: 23),
              _section("Special for you", specialItems),
              SizedBox(height: 23),
              _section("Popular Products", popularItems),
            ],
          ),
        ),
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

  Widget _iconsCateg(IconData icon, VoidCallback onTap, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(0xFFFFE8DE),
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(
            onPressed: onTap,
            icon: Icon(icon, color: Colors.orange, size: 28),
          ),
        ),
        SizedBox(height: 6),
        SizedBox(
          width: 60,
          child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, height: 1.2),
          ),
        ),
      ],
    );
  }

  Widget _section(String name, List items) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16),

          title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: TextButton(
            onPressed: () {},
            child: Text("See More", style: TextStyle(color: Colors.grey)),
          ),
        ),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              for (final w in items)
                Padding(padding: const EdgeInsets.only(right: 12), child: w),
            ],
          ),
        ),
      ],
    );
  }

  static Widget specialSectionItem(String img, String title, String hint) {
    return Container(
      width: 260,
      height: 120,
      padding: const EdgeInsets.all(16),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4),
          Text(hint, style: TextStyle(color: Colors.white70, fontSize: 14)),
        ],
      ),
    );
  }

  static Widget popularItem(String img, String title, double price) {
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Container(
            height: 150,
            width: 150,

            decoration: BoxDecoration(
              color: Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Image.asset(img),
          ),

          Text(
            title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${price.toStringAsFixed(2)}",
                style: TextStyle(
                  color: Color(0xFFFF7643),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF4F4F4),
                ),
                child: Center(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite),
                    iconSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  static List specialItems = [
    specialSectionItem(
      'assets/images/ImageBanner2.png',
      'Smartphone',
      '18 Brands',
    ),
    specialSectionItem(
      'assets/images/ImageBanner3.png',
      'Fashion',
      '24 Brands',
    ),
  ];

  static List popularItems = [
    popularItem(
      "assets/images/ImagePopularProduct1.png",
      "Wireless Conroller for PS4",
      64.99,
    ),

    popularItem(
      "assets/images/ImagePopularProduct2.png",
      "Nike Sport White - Man Pant",
      50.5,
    ),
    popularItem(
      "assets/images/ImagePopularProduct 3.png",
      "Bicycle Helmet - Red/Yellow Gradien",
      36.1,
    ),
  ];
}
