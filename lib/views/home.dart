import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/producto.dart';
import 'producto_view.dart';
import 'cart_view.dart';
import '../providers/cart_provider.dart';

class HomeView extends StatelessWidget {
  final List<Producto> products = [
    Producto(
      name: 'Anillos luna',
      price: 150,
      imageUrl: 'assets/anillosluna.jpg',
      description: 'Anillos chapa de oro luna y estrella',
    ),
    Producto(
      name: 'Collar mariposa Oro',
      price: 250,
      imageUrl: 'assets/collarmariposa.jpg',
      description: 'Collar con dije mariposa en color oro',
    ),
    Producto(
      name: 'Aretes estrella de mar',
      price: 100,
      imageUrl: 'assets/anillosestrella.jpg',
      description: 'Par de aretes estrella de mar con perlas en color oro',
    ),
    Producto(
      name: 'Set de anillos color oro',
      price: 270,
      imageUrl: 'assets/set7anillos.jpg',
      description: 'Set de 7 anillos distintos tamaños color oro',
    ),
    Producto(
      name: 'Pulsera Margarita',
      price: 350,
      imageUrl: 'assets/pulseramargarita.jpg',
      description: 'Pulsera de oro con dije de margarita en pedreria',
    ),
    Producto(
      name: 'Aretes hoop',
      price: 285,
      imageUrl: 'assets/areteshoop.jpg',
      description: 'Par de aretes de oro',
    ),
    Producto(
      name: 'combo collar + pulsera',
      price: 235,
      imageUrl: 'assets/collarpulsera.jpg',
      description: 'Set de collar mas pulsera de oro',
    ),
    Producto(
      name: 'Set 5 pulseras',
      price: 450,
      imageUrl: 'assets/setpulseras.jpg',
      description: 'Set 5 pulseras de oro',
    ),
    Producto(
      name: 'Set anillos Marina',
      price: 250,
      imageUrl: 'assets/anillosmarina.jpg',
      description:
          'Set 6 anillos estrella de mar, conchas, pedreria, aquamarina, color oro',
    ),
    // Añade más productos según sea necesario
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joyas y un poco más'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartView()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            color: Color.fromARGB(255, 190, 154, 107),
            child: Center(
              child: Text(
                'Joyas que deslumbran, momentos que perduran.',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child:
                            Image.asset(product.imageUrl, fit: BoxFit.cover),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('\$${product.price}',
                                style: TextStyle(color: Colors.grey[600])),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ProductView(producto: product),
                            ),
                          );
                        },
                        child: Text('Ver Producto'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
