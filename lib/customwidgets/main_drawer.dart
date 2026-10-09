import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:telescope_mart/pages/cart_page.dart';
import 'package:telescope_mart/pages/order_page.dart';
import 'package:telescope_mart/pages/profile_page.dart';

import '../auth/auth_service.dart';
import '../pages/login_page.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(color: Theme.of(context).colorScheme.primary, height: 150),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("My Profile"),
            onTap: () {
              context.goNamed(ProfilePage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text("My Cart"),
            onTap: () {
              context.pop();
              context.goNamed(CartPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.monetization_on),
            title: const Text("My Orders"),
            onTap: () {
              context.goNamed(OrderPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Sign Out"),
            onTap: () {
              AuthService.logout().then((value) {
                if (context.mounted) {
                  context.goNamed(LoginPage.routeName);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
