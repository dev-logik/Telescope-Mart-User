import 'package:flutter/widgets.dart';
import 'package:telescope_mart/auth/auth_service.dart';
import 'package:telescope_mart/db/db_helper.dart';
import 'package:telescope_mart/models/cart_model.dart';
import 'package:telescope_mart/models/telescope.dart';
import 'package:telescope_mart/utils/helper_functions.dart';

class CartProvider extends ChangeNotifier {
  List<CartModel> cartList = [];

  int get totalItemInCart => cartList.length;

  bool isTelescopeInCart(String id) {
    bool tag = false;
    for (final cartModel in cartList) {
      if (cartModel.telescopeId == id) {
        tag = true;
        break;
      }
    }
    return tag;
  }

  Future<void> addToCart(Telescope telescope) {
    final cartModel = CartModel(
      telescopeId: telescope.id!,
      telescopeModel: telescope.model,
      price: priceAfterDiscount(telescope.price, telescope.discount),
      imageUrl: telescope.thumbnail.downloadUrl,
    );

    return DbHelper.addToCart(cartModel, AuthService.currentUser!.uid);
  }

  Future<void> removeFromCart(String id) {
    return DbHelper.removeFromCart(id, AuthService.currentUser!.uid);
  }

  void getAllCartItems() {
    DbHelper.getAllCartItems(AuthService.currentUser!.uid).listen((snapshot) {
      cartList = List.generate(
        snapshot.docs.length,
        (index) => CartModel.fromJson(snapshot.docs[index].data()),
      );
      notifyListeners();
    });
  }

  void increaseQuantity(CartModel cartModel) {
    cartModel.quantity += 1;
    DbHelper.updateCartQuantity(AuthService.currentUser!.uid, cartModel);
  }

  void decreaseQuantity(CartModel cartModel) {
    if (cartModel.quantity > 1) {
      cartModel.quantity -= 1;
      DbHelper.updateCartQuantity(AuthService.currentUser!.uid, cartModel);
    }
  }

  num priceWiithQuantity(CartModel model) => model.price * model.quantity;

  num getCartSubTotal() {
    num total = 0;
    for (final model in cartList) {
      total += priceWiithQuantity(model);
    }
    return total;
  }

  Future<void> clearCart() =>
      DbHelper.clearCart(AuthService.currentUser!.uid, cartList);
}
