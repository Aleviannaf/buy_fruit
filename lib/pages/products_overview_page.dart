import 'package:buy_fruit/components/app_drawer.dart';
import 'package:buy_fruit/components/badge.dart';
import 'package:buy_fruit/components/product_grid.dart';
import 'package:buy_fruit/providers/cart.dart';
import 'package:buy_fruit/providers/product_list.dart';
import 'package:buy_fruit/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum FilterOpitons {
  Favorite,
  All,
}

class ProductOverview extends StatefulWidget {
  const ProductOverview({Key? key}) : super(key: key);

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductList>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Buy Fruit'),
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Somente favoritos'),
                value: FilterOpitons.Favorite,
              ),
              const PopupMenuItem(
                child: Text('Todos'),
                value: FilterOpitons.All,
              ),
            ],
            onSelected: (FilterOpitons selectedValue) {
              if (selectedValue == FilterOpitons.Favorite) {
                provider.showFAvoriteOnly();
              } else {
                provider.showAll();
              }
            },
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              },
              icon: const Icon(Icons.shopping_cart),
            ),
            builder: (context, cart, child) => Badge(
              value: cart.itemsCount.toString(),
              child: child!,
            ),
          )
        ],
      ),
      body: const ProductGrid(),
      drawer: const AppDrawer(),
    );
  }
}
