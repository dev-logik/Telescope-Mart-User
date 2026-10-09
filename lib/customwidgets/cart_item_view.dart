import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:telescope_mart/models/cart_model.dart';
import 'package:telescope_mart/providers/cart_provider.dart';
import 'package:telescope_mart/utils/constants.dart';

class CartItemView extends StatelessWidget {
  final CartModel cartModel;
  final CartProvider cartProvider;
  const CartItemView({
    super.key,
    required this.cartModel,
    required this.cartProvider,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: .all(8),
        child: Column(
          children: [
            ListTile(
              leading: CachedNetworkImage(
                imageUrl: cartModel.imageUrl,
                width: 70,
                height: 70,
                placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              title: Text(cartModel.telescopeModel),
              subtitle: Text("Unit Price: $currencySymbol${cartModel.price}"),
              trailing: IconButton(
                onPressed: () {
                  cartProvider.removeFromCart(cartModel.telescopeId);
                },
                icon: Icon(Icons.delete),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    cartProvider.decreaseQuantity(cartModel);
                  },
                  icon: Icon(Icons.remove_circle, size: 30),
                ),
                Text(
                  '${cartModel.quantity}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                IconButton(
                  onPressed: () {
                    cartProvider.increaseQuantity(cartModel);
                  },
                  icon: Icon(Icons.add_circle, size: 30),
                ),
                Spacer(),
                Text(
                  '$currencySymbol${cartProvider.priceWiithQuantity(cartModel)}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
