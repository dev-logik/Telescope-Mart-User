import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:telescope_mart/models/brand.dart';
import 'package:telescope_mart/models/image_model.dart';

part 'telescope.freezed.dart';
part 'telescope.g.dart';

@unfreezed
abstract class Telescope with _$Telescope {
  factory Telescope({
    String? id,
    required String model,
    required Brand brand,
    required String type,
    required String dimension,
    required num weightInPound,
    required String focusType,
    required num lensDiameterInMM,
    required String mountDescription,
    required num stock,
    @Default(0.0) num avgRating,
    @Default(0) num discount,
    required num price,
    required ImageModel thumbnail,
    required List<ImageModel> additionalImage,
    String? description,
  }) = _Telescope;

  factory Telescope.fromJson(Map<String, dynamic> json) =>
      _$TelescopeFromJson(json);
}
