// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RatingModel _$RatingModelFromJson(Map<String, dynamic> json) => _RatingModel(
  appuser: AppUser.fromJson(json['appuser'] as Map<String, dynamic>),
  rating: json['rating'] as num,
);

Map<String, dynamic> _$RatingModelToJson(_RatingModel instance) =>
    <String, dynamic>{
      'appuser': instance.appuser.toJson(),
      'rating': instance.rating,
    };
