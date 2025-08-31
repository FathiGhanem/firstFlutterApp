import 'package:e_commerceapp/data/products.dart';
import 'package:e_commerceapp/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  void addToFav(Product p) {
    setState(() {
      if (favProducts.any((e) => e.id == p.id)) {
        favProducts.removeWhere((e) => e.id == p.id);
      } else {
        favProducts.add(p);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
              children: [
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
              _iconsCateg("assets/icons/Flash Icon.svg", () {}, "Flash Deal"),
              _iconsCateg("assets/icons/Bill Icon.svg", () {}, "Bill"),
              _iconsCateg("assets/icons/Game Icon.svg", () {}, "Game"),
              _iconsCateg("assets/icons/Gift Icon.svg", () {}, "Daily Gift"),
              _iconsCateg("assets/icons/Discover.svg", () {}, "More"),
            ],
          ),
          SizedBox(height: 23),
          _section("Special for you", _specialItems),
          SizedBox(height: 23),
          _section("Popular Products", _popularItems),
        ],
      ),
    );
  }

  Widget _iconsCateg(String iconPath, VoidCallback onTap, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFFFFE8DE),
            borderRadius: BorderRadius.circular(16),
          ),
          child: IconButton(onPressed: onTap, icon: SvgPicture.asset(iconPath)),
        ),
        SizedBox(height: 6),
        SizedBox(
          width: 60,
          child: Text(
            label,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 12, height: 1.2),
          ),
        ),
      ],
    );
  }

  Widget _section(String name, List<Widget> items) {
    return Column(
      children: [
        SizedBox(height: 4),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: TextButton(
            onPressed: () {},
            child: Text("See More", style: TextStyle(color: Colors.grey)),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              for (final w in items)
                Padding(padding: EdgeInsets.only(right: 12), child: w),
            ],
          ),
        ),
      ],
    );
  }

  Widget _specialSectionItem(String img, String title, String hint) {
    return Container(
      width: 260,
      height: 120,
      padding: EdgeInsets.all(16),
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
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 4),
          Text(
            hint,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _popularItem(Product p) {
    bool isFav = favProducts.any((e) => e.id == p.id);
    return SizedBox(
      width: 150,
      child: Column(
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F4),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Image.asset(p.img),
          ),
          SizedBox(height: 8),
          SizedBox(
            width: double.infinity, 
            child: Text(
              p.name,
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${p.price.toStringAsFixed(2)}",
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
                  color: isFav ? Color(0xFFFDEAE2) : Color(0xFFF4F4F4),
                ),
                child: IconButton(
                  onPressed: () => addToFav(p),
                  icon: Icon(
                    Icons.favorite,
                    size: 15,
                    color: isFav ? Colors.red : Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<Widget> get _popularItems => [for (final p in products) _popularItem(p)];

  List<Widget> get _specialItems => [
    _specialSectionItem(
      'assets/images/ImageBanner2.png',
      'Smartphone',
      '18 Brands',
    ),
    _specialSectionItem(
      'assets/images/ImageBanner3.png',
      'Fashion',
      '24 Brands',
    ),
  ];
}
