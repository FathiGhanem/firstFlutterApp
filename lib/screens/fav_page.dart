import 'package:e_commerceapp/data/products.dart';
import 'package:e_commerceapp/models/product.dart';
import 'package:flutter/material.dart';

class FavPage extends StatefulWidget {
  const FavPage({super.key});

  @override
  State<FavPage> createState() => _FavPageState();
}

class _FavPageState extends State<FavPage> {
  void _remove(Product p) {
    setState(() {
      favProducts.removeWhere((e) => e.id == p.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (favProducts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border_outlined,color: Colors.grey,),
            Text("Favorate is Empty.", style: TextStyle(color: Colors.grey),),
          ],
        ),
      );
    }

    return ListView(children: [for (var p in favProducts) (productCard(p))]);
  }

  Widget productCard(Product p) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: ListTile(
        leading: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xFFFF7643)),
            image: DecorationImage(
              image: AssetImage(p.img),
              fit: BoxFit.contain,
            ),
            color: Colors.grey.shade200,
          ),
        ),
        title: Text(p.name),
        subtitle: Text(
          '\$${p.price.toStringAsFixed(2)}',
          style: TextStyle(
            color: Color(0xFFFF7643),
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: IconButton(
          onPressed: () => _remove(p),
          icon: Icon(Icons.delete_outlined, color: Colors.red),
        ),
      ),
    );
  }
}
