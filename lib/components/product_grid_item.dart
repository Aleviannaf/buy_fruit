import 'package:buy_fruit/models/product.dart';
import 'package:buy_fruit/providers/cart.dart';
import 'package:buy_fruit/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.PRODUCT_DETAIL,
                arguments: product,
              );
            }),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            onPressed: () {
              product.toggleFavorite();
            },
            icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border),
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          title: Text(
            product.name,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.onSecondary,
            onPressed: () {
              cart.addItem(product);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('Produto adicionado com sucesso!'),
                  duration: const Duration(seconds: 2),
                  action: SnackBarAction(
                      label: 'DESFAZER',
                      onPressed: () {
                        cart.removeSingleItem(product.id);
                      }),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
