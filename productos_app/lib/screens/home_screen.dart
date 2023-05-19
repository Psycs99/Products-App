import 'package:flutter/material.dart';
import 'package:productos_app/model/model_export.dart';
import 'package:productos_app/services/services_export.dart';
import 'package:productos_app/widgets/widgets_export.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsServices = Provider.of<ProductsServices>(context);
    final authService = Provider.of<AuthServices>(context, listen: false);

    //if (productsServices.isLoaading) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              authService.logout();
              Navigator.pushReplacementNamed(context, 'login');
            },
            icon: const Icon(
              Icons.login_outlined,
            )),
        title: const Center(
          child: Text(
            'Productos',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: productsServices.products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              productsServices.selectedProduct =
                  productsServices.products[index].copy();
              Navigator.pushNamed(context, 'product');
            },
            child: ProductCard(
              product: productsServices.products[index],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          productsServices.selectedProduct =
              new Product(available: false, name: '', price: 0.0);
          Navigator.pushNamed(context, 'product');
        },
      ),
    );
  }
}
