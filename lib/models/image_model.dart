import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'image_model.freezed.dart';
part 'image_model.g.dart';

@unfreezed
abstract class ImageModel with _$ImageModel {
  factory ImageModel({
    required String imageName,
    required String directoryName,
    required String downloadUrl,
  }) = _ImageModel;

  factory ImageModel.fromJson(Map<String, dynamic> json) =>
      _$ImageModelFromJson(json);
}
