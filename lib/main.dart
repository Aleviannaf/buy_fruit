import 'package:buy_fruit/pages/auth_or_home_page.dart';
import 'package:buy_fruit/pages/cart_page.dart';
import 'package:buy_fruit/pages/ordes_pages.dart';
import 'package:buy_fruit/pages/product_detail_page.dart';
import 'package:buy_fruit/providers/auth.dart';
import 'package:buy_fruit/providers/cart.dart';
import 'package:buy_fruit/providers/order_list.dart';
import 'package:buy_fruit/providers/product_list.dart';
import 'package:buy_fruit/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductList()),
        ChangeNotifierProvider(create: (_)=> Cart()),
        ChangeNotifierProvider(create: (_)=> OrderList()),
         ChangeNotifierProvider(create: (_)=> Auth()),
      ],
      child: MaterialApp(
        title: 'BUY FRUIT',
        theme: ThemeData(
          colorScheme:  ColorScheme(
          primary: Colors.purple, 
          primaryVariant: Colors.purple, 
          secondary: Colors.purple, 
          secondaryVariant: Colors.purple, 
          surface: Colors.purple, 
          background: Colors.purple, 
          error: Colors.red.shade600, 
          onPrimary: Colors.white, 
          onSecondary: Colors.orangeAccent, 
          onSurface: Colors.black, 
          onBackground: Colors.purple, 
          onError: Colors.purple, 
          brightness: Brightness.light,
          ),
          fontFamily: 'Lato'
        ),
       
        //home:  ProductOverview(),
        debugShowCheckedModeBanner: false,
        routes: {
          AppRoutes.AUTH_OR_HOME: (cxt) => const AuthOrHomePage(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailPage(),
          AppRoutes.CART: (ctx) => const CartPage(),
          AppRoutes.ORDERS: (ctx) => const OrdersPage(),
        }
      ),
    );
  }
}

