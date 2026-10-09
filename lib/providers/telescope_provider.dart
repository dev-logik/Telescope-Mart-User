import 'package:flutter/material.dart';
import 'package:telescope_mart/db/db_helper.dart';
import 'package:telescope_mart/models/app_user.dart';
import 'package:telescope_mart/models/brand.dart';
import 'package:telescope_mart/models/rating_model.dart';
import 'package:telescope_mart/models/telescope.dart';

class TelescopeProvider with ChangeNotifier {
  List<Brand> brandList = [];
  List<Telescope> telescopeList = [];

  void getAllBrand() {
    DbHelper.getAllBrands().listen((snapshot) {
      brandList = List.generate(
        snapshot.docs.length,
        (index) => Brand.fromJson(snapshot.docs[index].data()),
      );
      notifyListeners();
    });
  }

  Future<void> addRating(
    AppUser appUser,
    num rating,
    String telescopeId,
  ) async {
    final ratingModel = RatingModel(appuser: appUser, rating: rating);
    await DbHelper.addRating(telescopeId, ratingModel);
    final snapshot = await DbHelper.getAllRatings(telescopeId);
    final ratingList = List.generate(
      snapshot.docs.length,
      (index) => RatingModel.fromJson(snapshot.docs[index].data()),
    );
    num total = ratingList.fold(
      0,
      (prevVal, rating) => prevVal + rating.rating,
    );
    // for (final ratingItem in ratingList) {
    //   total += ratingItem.rating;
    // }
    final averageRating = total / ratingList.length;
    return DbHelper.updateTelescopeField(telescopeId, {
      'avgRating': averageRating,
    });
  }

  void getAllTelescopes() {
    DbHelper.getAllTelescopes().listen((snapshot) {
      telescopeList = List.generate(
        snapshot.docs.length,
        (index) => Telescope.fromJson(snapshot.docs[index].data()),
      );
      notifyListeners();
    });
  }

  Telescope getTelescopeById(String id) =>
      telescopeList.firstWhere((telescope) => telescope.id == id);
}
