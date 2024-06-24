import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/producto.dart';
import '../providers/cart_provider.dart';

class ProductView extends StatelessWidget {
  final Producto producto;

  ProductView({required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(producto.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(producto.imageUrl), // Cambiado a Image.asset
            SizedBox(height: 10),
            Text(producto.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('\$${producto.price}',
                style: TextStyle(fontSize: 20, color: Colors.green)),
            SizedBox(height: 10),
            Text(producto.description),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Provider.of<CartProvider>(context, listen: false)
                    .addToCart(producto);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Producto añadido al carrito')));
              },
              child: Text('Añadir al Carrito'),
            ),
          ],
        ),
      ),
    );
  }
}
