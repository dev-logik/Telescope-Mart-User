import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telescope_mart/models/app_user.dart';
import 'package:telescope_mart/models/cart_model.dart';
import 'package:telescope_mart/models/image_model.dart';
import 'package:telescope_mart/models/order_model.dart';
import 'package:telescope_mart/models/rating_model.dart';

class DbHelper {
  static final FirebaseFirestore _db = FirebaseFirestore.instance;
  static const String collectionUsers = 'Users';
  static const String collectionTelescope = 'Telescopes';
  static const String collectionBrand = 'Brands';
  static const String collectionCart = 'MyCartItems';
  static const String collectionOrder = 'Orders';
  static const String collectionRating = 'Ratings';

  static Future<void> addUser(AppUser user) {
    return _db.collection(collectionUsers).doc(user.uid).set(user.toJson());
  }

  static Future<bool> doesUserExist(String uid) async {
    final snapshot = await _db.collection(collectionUsers).doc(uid).get();
    return snapshot.exists;
  }

  static Future<void> addToCart(CartModel cartModel, String uid) {
    return _db
        .collection(collectionUsers)
        .doc(uid)
        .collection(collectionCart)
        .doc(cartModel.telescopeId)
        .set(cartModel.toJson());
  }

  static Future<void> removeFromCart(String telescopeId, String uid) {
    return _db
        .collection(collectionUsers)
        .doc(uid)
        .collection(collectionCart)
        .doc(telescopeId)
        .delete();
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllBrands() =>
      _db.collection(collectionBrand).snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllTelescopes() =>
      _db.collection(collectionTelescope).snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllOrders(String uid) =>
      _db
          .collection(collectionOrder)
          .where('appUser.uid', isEqualTo: uid)
          .snapshots();

  static Future<QuerySnapshot<Map<String, dynamic>>> getAllRatings(
    String telescopeId,
  ) => _db
      .collection(collectionTelescope)
      .doc(telescopeId)
      .collection(collectionRating)
      .get();

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserInfo(
    String uid,
  ) => _db.collection(collectionUsers).doc(uid).snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllCartItems(
    String uid,
  ) => _db
      .collection(collectionUsers)
      .doc(uid)
      .collection(collectionCart)
      .snapshots();

  static Future<void> updateTelescopeField(
    String id,
    Map<String, dynamic> map,
  ) async {
    await _db.collection(collectionTelescope).doc(id).update(map);
  }

  static Future<void> updateCartQuantity(String uid, CartModel cartModel) {
    return _db
        .collection(collectionUsers)
        .doc(uid)
        .collection(collectionCart)
        .doc(cartModel.telescopeId)
        .set(cartModel.toJson());
  }

  static Future<void> setProfileImage(String uid, ImageModel imageModel) {
    return _db.collection(collectionUsers).doc(uid).update({
      'profileImage': imageModel.toJson(),
    });
  }

  static Future<void> saveOrder(OrderModel order) async {
    final wb = _db.batch();
    final orderDoc = _db.collection(collectionOrder).doc(order.orderId);
    wb.set(orderDoc, order.toJson());
    for (final cartModel in order.itemDetails) {
      final telescopeSnapshot = await _db
          .collection(collectionTelescope)
          .doc(cartModel.telescopeId)
          .get();
      final oldStock = telescopeSnapshot.data()!['stock'];
      final telescopeDoc = _db
          .collection(collectionTelescope)
          .doc(cartModel.telescopeId);
      wb.update(telescopeDoc, {'stock': oldStock - cartModel.quantity});
    }
    final userDoc = _db.collection(collectionUsers).doc(order.appUser.uid);
    wb.set(userDoc, order.appUser.toJson());
    return wb.commit();
  }

  static Future<void> clearCart(String uid, List<CartModel> cartList) {
    final wb = _db.batch();
    for (final model in cartList) {
      final doc = _db
          .collection(collectionUsers)
          .doc(uid)
          .collection(collectionCart)
          .doc(model.telescopeId);
      wb.delete(doc);
    }
    return wb.commit();
  }

  static Future<void> addRating(
    String telescopeId,
    RatingModel ratingModel,
  ) async {
    return _db
        .collection(collectionTelescope)
        .doc(telescopeId)
        .collection(collectionRating)
        .doc(ratingModel.appuser.uid)
        .set(ratingModel.toJson());
  }
}
