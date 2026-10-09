import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:telescope_mart/models/app_user.dart';

part 'rating_model.freezed.dart';
part 'rating_model.g.dart';

@unfreezed
abstract class RatingModel with _$RatingModel {
  factory RatingModel({required AppUser appuser, required num rating}) =
      _RatingModel;

  factory RatingModel.fromJson(Map<String, dynamic> json) =>
      _$RatingModelFromJson(json);
}
