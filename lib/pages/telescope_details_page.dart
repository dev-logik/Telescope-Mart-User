import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:telescope_mart/models/telescope.dart';
import 'package:telescope_mart/providers/cart_provider.dart';
import 'package:telescope_mart/providers/telescope_provider.dart';
import 'package:telescope_mart/providers/user_provider.dart';
import 'package:telescope_mart/utils/colors.dart';
import 'package:telescope_mart/utils/constants.dart';
import 'package:telescope_mart/utils/helper_functions.dart';

class TelescopeDetailsPage extends StatefulWidget {
  static const String routeName = "productdetails";
  final String id;
  const TelescopeDetailsPage({super.key, required this.id});

  @override
  State<TelescopeDetailsPage> createState() => _TelescopeDetailsPageState();
}

class _TelescopeDetailsPageState extends State<TelescopeDetailsPage> {
  late Telescope telescope;
  late TelescopeProvider provider;
  double userRating = 0.0;

  @override
  void didChangeDependencies() {
    provider = Provider.of<TelescopeProvider>(context);
    telescope = provider.getTelescopeById(widget.id);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          telescope.model,
          style: const TextStyle(overflow: .ellipsis),
        ),
      ),
      body: ListView(
        children: [
          CachedNetworkImage(
            imageUrl: telescope.thumbnail.downloadUrl,
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Padding(
            padding: .symmetric(horizontal: 30),
            child: Consumer<CartProvider>(
              builder: (context, provider, child) {
                final isInCart = provider.isTelescopeInCart(telescope.id!);
                return ElevatedButton.icon(
                  onPressed: () {
                    if (isInCart) {
                      provider.removeFromCart(telescope.id!);
                    } else {
                      provider.addToCart(telescope);
                    }
                  },
                  label: Text(isInCart ? "Remove from Cart" : "Add to Cart"),
                  icon: Icon(
                    isInCart ? Icons.remove_shopping_cart : Icons.shopping_cart,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isInCart
                        ? kShrineBrown900
                        : kShrinePink400,
                    foregroundColor: isInCart ? kShrinePink100 : kShrinePink50,
                  ),
                );
              },
            ),
          ),
          ListTile(
            title: Text(
              'Sale Price: $currencySymbol ${priceAfterDiscount(telescope.price, telescope.discount)}',
            ),
            subtitle: Text('Stock: ${telescope.stock}'),
          ),
          Card(
            child: Padding(
              padding: .all(8),
              child: Column(
                children: [
                  RatingBar.builder(
                    itemBuilder: (context, index) =>
                        Icon(Icons.star, color: Colors.amber),
                    onRatingUpdate: (value) {
                      userRating = value;
                    },
                    initialRating: 0.0,
                    minRating: 0.0,
                    direction: .horizontal,
                    itemCount: 5,
                    allowHalfRating: true,
                  ),
                  OutlinedButton(
                    onPressed: _rateThisProduct,
                    child: Text("SUBMIT"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _rateThisProduct() async {
    EasyLoading.show(status: "Please wait");
    final appUser = Provider.of<UserProvider>(context, listen: false).appUser;
    await provider.addRating(appUser!, userRating, telescope.id!);
    EasyLoading.dismiss();
    showMessage(context, "Thanks for your rating");
  }
}
