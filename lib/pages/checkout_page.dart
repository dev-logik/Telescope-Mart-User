import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:telescope_mart/models/order_model.dart';
import 'package:telescope_mart/models/user_address.dart';
import 'package:telescope_mart/pages/view_telescope_page.dart';
import 'package:telescope_mart/providers/cart_provider.dart';
import 'package:telescope_mart/providers/order_provider.dart';
import 'package:telescope_mart/providers/user_provider.dart';
import 'package:telescope_mart/utils/colors.dart';
import 'package:telescope_mart/utils/constants.dart';
import 'package:telescope_mart/utils/helper_functions.dart';

class CheckoutPage extends StatefulWidget {
  static const String routeName = 'checkout';
  const CheckoutPage({super.key});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  late final TextEditingController _addressController;
  late final TextEditingController _postalCodeController;
  String paymentMethodGroupValue = PaymentMethod.cod;
  String? city;

  @override
  void initState() {
    _addressController = TextEditingController();
    _postalCodeController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _setAddress();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirm Order")),
      body: Column(
        crossAxisAlignment: .stretch,
        children: [
          Expanded(
            child: ListView(
              padding: const .all(8),
              children: [
                buildHeaderSection("Product Information"),
                _buildProductInfoSection(),
                _buidlTotalAmountSection(),
                buildHeaderSection("Delivery Address"),
                _buildDeliveryAddressSection(),
                buildHeaderSection("Payment Method"),
                _buidlPaymentMethodSection(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ElevatedButton(
              onPressed: _saveOrder,
              style: ElevatedButton.styleFrom(
                backgroundColor: kShrineBrown900,
                shape: RoundedRectangleBorder(borderRadius: .circular(8.0)),
                //minimumSize: Size(400, 40),
              ),
              child: Text("PLACE ORDER"),
            ),
          ),
        ],
      ),
    );
  }

  Card _buildDeliveryAddressSection() {
    return Card(
      child: Padding(
        padding: .all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _addressController,
              decoration: InputDecoration(hintText: "Street Address"),
            ),
            TextField(
              controller: _postalCodeController,
              decoration: InputDecoration(hintText: "Postal Code"),
            ),
            DropdownButton<String>(
              value: city,
              hint: Text('Select your city'),
              isExpanded: true,
              items: cities
                  .map(
                    (city) => DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  city = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Card _buildProductInfoSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<CartProvider>(
          builder: (context, provider, child) => Column(
            children: provider.cartList
                .map(
                  (cartModel) => ListTile(
                    title: Text(cartModel.telescopeModel),
                    trailing: Text(
                      "${cartModel.quantity}x$currencySymbol${cartModel.price}",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }

  Widget buildHeaderSection(String title) {
    return Padding(
      padding: const .all(4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: .bold,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget _buidlTotalAmountSection() {
    return Card(
      child: Padding(
        padding: .all(8),
        child: ListTile(
          title: Text("Total Amount"),
          trailing: Consumer<CartProvider>(
            builder: (context, provider, child) => Text(
              "\$${provider.getCartSubTotal()}",
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buidlPaymentMethodSection() {
    return Card(
      child: Padding(
        padding: .all(8),
        child: RadioGroup<String>(
          groupValue: paymentMethodGroupValue,
          onChanged: (value) {
            setState(() {
              paymentMethodGroupValue = value!;
            });
          },
          child: Row(
            children: [
              Radio<String>(value: PaymentMethod.cod),
              const Text(PaymentMethod.cod),
              Radio<String>(value: PaymentMethod.online),
              const Text(PaymentMethod.online),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _addressController.dispose();
    _postalCodeController.dispose();
    super.dispose();
  }

  void _saveOrder() async {
    if (_addressController.text.isEmpty) {
      showMessage(context, "Please provide your address");
      return;
    }
    if (_postalCodeController.text.isEmpty) {
      showMessage(context, "Please provide your zip code");
      return;
    }
    if (city == null) {
      showMessage(context, "Please provide your zip code");
      return;
    }

    EasyLoading.show(status: "Please wait");

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final appUser = userProvider.appUser;

    if (appUser == null) {
      EasyLoading.dismiss();
      showMessage(context, "User session error. Please log in again");
      return;
    }
    final userAddress = UserAddress(
      streetAddress: _addressController.text.trim(),
      city: city!,
      postCode: _postalCodeController.text.trim(),
    );

    appUser.userAddress = userAddress;

    final order = OrderModel(
      orderId: generateOrderId,
      appUser: appUser,
      orderStatus: OrderStatus.pending,
      paymentMethod: paymentMethodGroupValue,
      totalAmount: Provider.of<CartProvider>(
        context,
        listen: false,
      ).getCartSubTotal(),
      orderDate: Timestamp.fromDate(DateTime.now()),
      itemDetails: Provider.of<CartProvider>(context, listen: false).cartList,
    );

    try {
      await Provider.of<OrderProvider>(
        context,
        listen: false,
      ).saveOrder(order: order);

      await Provider.of<CartProvider>(context, listen: false).clearCart();
      EasyLoading.dismiss();
      showMessage(context, "Order Placed");
      context.goNamed(ViewTelescopePage.routeName);
    } catch (error) {
      log(error.toString());
      EasyLoading.dismiss();
    }
  }

  void _setAddress() {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    final appUser = userProvider.appUser;
    if (appUser != null && appUser.userAddress != null) {
      final address = appUser.userAddress!;
      _addressController.text = address.streetAddress;
      _postalCodeController.text = address.postCode;
      city = address.city;
    }
  }
}
