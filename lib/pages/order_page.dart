import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telescope_mart/providers/order_provider.dart';
import 'package:telescope_mart/providers/user_provider.dart';

class OrderPage extends StatefulWidget {
  static const String routeName = 'orders';
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  late final UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
    Provider.of<OrderProvider>(
      context,
      listen: false,
    ).getAllOrders(userProvider.appUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Orders")),
      body: Consumer<OrderProvider>(
        builder: (context, provider, child) => ListView.builder(
          itemCount: provider.orderList.length,
          itemBuilder: (context, index) {
            final order = provider.orderList[index];
            return ListTile(
              title: Text("Order ID: ${order.orderId}"),
              subtitle: Text("Total Amount: \$${order.totalAmount}"),
              trailing: Text(order.orderStatus),
            );
          },
        ),
      ),
    );
  }
}
