// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserAddress _$UserAddressFromJson(Map<String, dynamic> json) => _UserAddress(
  streetAddress: json['streetAddress'] as String,
  city: json['city'] as String,
  postCode: json['postCode'] as String,
);

Map<String, dynamic> _$UserAddressToJson(_UserAddress instance) =>
    <String, dynamic>{
      'streetAddress': instance.streetAddress,
      'city': instance.city,
      'postCode': instance.postCode,
    };
