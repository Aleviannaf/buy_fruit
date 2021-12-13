import 'package:buy_fruit/pages/auth_pages.dart';
import 'package:buy_fruit/pages/products_overview_page.dart';
import 'package:buy_fruit/providers/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AuthOrHomePage extends StatelessWidget {
  const AuthOrHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? const ProductOverview() : const AuthPage();
  }
}