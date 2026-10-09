import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telescope_mart/customwidgets/main_drawer.dart';
import 'package:telescope_mart/providers/cart_provider.dart';
import 'package:telescope_mart/providers/order_provider.dart';
import 'package:telescope_mart/providers/telescope_provider.dart';
import 'package:telescope_mart/providers/user_provider.dart';

import '../customwidgets/telescope_grid_item_view.dart';

class ViewTelescopePage extends StatefulWidget {
  static const String routeName = '/';
  const ViewTelescopePage({super.key});

  @override
  State<ViewTelescopePage> createState() => _ViewTelescopePageState();
}

class _ViewTelescopePageState extends State<ViewTelescopePage> {
  @override
  void didChangeDependencies() {
    Provider.of<TelescopeProvider>(context, listen: false).getAllBrand();
    Provider.of<TelescopeProvider>(context, listen: false).getAllTelescopes();
    Provider.of<CartProvider>(context, listen: false).getAllCartItems();
    Provider.of<UserProvider>(context, listen: false).getUserInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(title: Text("Telescope List"), actions: []),
      body: Consumer<TelescopeProvider>(
        builder: (context, provider, child) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: provider.telescopeList.length,
          itemBuilder: (context, index) {
            final telescope = provider.telescopeList[index];
            return TelescopeGridItemView(telescope: telescope);
          },
        ),
      ),
    );
  }
}
