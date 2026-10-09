// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartModel _$CartModelFromJson(Map<String, dynamic> json) => _CartModel(
  telescopeId: json['telescopeId'] as String,
  telescopeModel: json['telescopeModel'] as String,
  price: json['price'] as num,
  imageUrl: json['imageUrl'] as String,
  quantity: json['quantity'] as num? ?? 1,
);

Map<String, dynamic> _$CartModelToJson(_CartModel instance) =>
    <String, dynamic>{
      'telescopeId': instance.telescopeId,
      'telescopeModel': instance.telescopeModel,
      'price': instance.price,
      'imageUrl': instance.imageUrl,
      'quantity': instance.quantity,
    };
