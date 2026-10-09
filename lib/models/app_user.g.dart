// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppUser _$AppUserFromJson(Map<String, dynamic> json) => _AppUser(
  uid: json['uid'] as String,
  email: json['email'] as String,
  userAddress: json['userAddress'] == null
      ? null
      : UserAddress.fromJson(json['userAddress'] as Map<String, dynamic>),
  profileImage: json['profileImage'] == null
      ? null
      : ImageModel.fromJson(json['profileImage'] as Map<String, dynamic>),
  userName: json['userName'] as String?,
  phone: json['phone'] as String?,
  userCreationTime: _$JsonConverterFromJson<Timestamp, Timestamp>(
    json['userCreationTime'],
    const TimestampConverter().fromJson,
  ),
);

Map<String, dynamic> _$AppUserToJson(_AppUser instance) => <String, dynamic>{
  'uid': instance.uid,
  'email': instance.email,
  'userAddress': instance.userAddress?.toJson(),
  'profileImage': instance.profileImage?.toJson(),
  'userName': instance.userName,
  'phone': instance.phone,
  'userCreationTime': _$JsonConverterToJson<Timestamp, Timestamp>(
    instance.userCreationTime,
    const TimestampConverter().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
