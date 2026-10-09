// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserAddress {

 String get streetAddress; set streetAddress(String value); String get city; set city(String value); String get postCode; set postCode(String value);
/// Create a copy of UserAddress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserAddressCopyWith<UserAddress> get copyWith => _$UserAddressCopyWithImpl<UserAddress>(this as UserAddress, _$identity);

  /// Serializes this UserAddress to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'UserAddress(streetAddress: $streetAddress, city: $city, postCode: $postCode)';
}


}

/// @nodoc
abstract mixin class $UserAddressCopyWith<$Res>  {
  factory $UserAddressCopyWith(UserAddress value, $Res Function(UserAddress) _then) = _$UserAddressCopyWithImpl;
@useResult
$Res call({
 String streetAddress, String city, String postCode
});




}
/// @nodoc
class _$UserAddressCopyWithImpl<$Res>
    implements $UserAddressCopyWith<$Res> {
  _$UserAddressCopyWithImpl(this._self, this._then);

  final UserAddress _self;
  final $Res Function(UserAddress) _then;

/// Create a copy of UserAddress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? streetAddress = null,Object? city = null,Object? postCode = null,}) {
  return _then(_self.copyWith(
streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,postCode: null == postCode ? _self.postCode : postCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UserAddress].
extension UserAddressPatterns on UserAddress {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserAddress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserAddress() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserAddress value)  $default,){
final _that = this;
switch (_that) {
case _UserAddress():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserAddress value)?  $default,){
final _that = this;
switch (_that) {
case _UserAddress() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String streetAddress,  String city,  String postCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserAddress() when $default != null:
return $default(_that.streetAddress,_that.city,_that.postCode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String streetAddress,  String city,  String postCode)  $default,) {final _that = this;
switch (_that) {
case _UserAddress():
return $default(_that.streetAddress,_that.city,_that.postCode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String streetAddress,  String city,  String postCode)?  $default,) {final _that = this;
switch (_that) {
case _UserAddress() when $default != null:
return $default(_that.streetAddress,_that.city,_that.postCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserAddress implements UserAddress {
   _UserAddress({required this.streetAddress, required this.city, required this.postCode});
  factory _UserAddress.fromJson(Map<String, dynamic> json) => _$UserAddressFromJson(json);

@override  String streetAddress;
@override  String city;
@override  String postCode;

/// Create a copy of UserAddress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserAddressCopyWith<_UserAddress> get copyWith => __$UserAddressCopyWithImpl<_UserAddress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserAddressToJson(this, );
}



@override
String toString() {
  return 'UserAddress(streetAddress: $streetAddress, city: $city, postCode: $postCode)';
}


}

/// @nodoc
abstract mixin class _$UserAddressCopyWith<$Res> implements $UserAddressCopyWith<$Res> {
  factory _$UserAddressCopyWith(_UserAddress value, $Res Function(_UserAddress) _then) = __$UserAddressCopyWithImpl;
@override @useResult
$Res call({
 String streetAddress, String city, String postCode
});




}
/// @nodoc
class __$UserAddressCopyWithImpl<$Res>
    implements _$UserAddressCopyWith<$Res> {
  __$UserAddressCopyWithImpl(this._self, this._then);

  final _UserAddress _self;
  final $Res Function(_UserAddress) _then;

/// Create a copy of UserAddress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? streetAddress = null,Object? city = null,Object? postCode = null,}) {
  return _then(_UserAddress(
streetAddress: null == streetAddress ? _self.streetAddress : streetAddress // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,postCode: null == postCode ? _self.postCode : postCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
