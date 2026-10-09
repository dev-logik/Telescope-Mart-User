import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:telescope_mart/models/image_model.dart';
import 'package:telescope_mart/models/user_address.dart';

import '../model_converters/timestamp_converters.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

@unfreezed
//@JsonSerializable(explicitToJson: true)
abstract class AppUser with _$AppUser {
  factory AppUser({
    required String uid,
    required String email,
    UserAddress? userAddress,
    ImageModel? profileImage,
    String? userName,
    String? phone,
    @TimestampConverter() Timestamp? userCreationTime,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}
