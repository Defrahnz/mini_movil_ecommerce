import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart'; // Asegúrate de tener la importación correcta de CartProvider

class CartView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrito'),
      ),
      body: cart.cartItems.isEmpty
          ? Center(child: Text('El carrito está vacío'))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.cartItems.length,
                    itemBuilder: (context, index) {
                      final product = cart.cartItems[index];
                      return ListTile(
                        leading: Image.asset(product.imageUrl, width: 50, fit: BoxFit.cover),
                        title: Text(product.name),
                        subtitle: Text('\$${product.price}'),
                        trailing: IconButton(
                          icon: Icon(Icons.remove_shopping_cart),
                          onPressed: () {
                            cart.removeFromCart(product);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: cart.cartItems.isEmpty ? null : () {
                      // Aquí puedes agregar la lógica para confirmar la compra, si es necesario
                      cart.clearCart(); // Limpiar el carrito después de confirmar la compra
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Compra confirmada')),
                      );
                      Navigator.pop(context); // Regresar a la página principal
                    },
                    child: Text('Confirmar compra'),
                  ),
                ),
              ],
            ),
    );
  }
}
