// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderModel {

 String get orderId; set orderId(String value); AppUser get appUser; set appUser(AppUser value); String get orderStatus; set orderStatus(String value); String get paymentMethod; set paymentMethod(String value); num get totalAmount; set totalAmount(num value);@TimestampConverter() Timestamp get orderDate;@TimestampConverter() set orderDate(Timestamp value); List<CartModel> get itemDetails; set itemDetails(List<CartModel> value);
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderModelCopyWith<OrderModel> get copyWith => _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'OrderModel(orderId: $orderId, appUser: $appUser, orderStatus: $orderStatus, paymentMethod: $paymentMethod, totalAmount: $totalAmount, orderDate: $orderDate, itemDetails: $itemDetails)';
}


}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res>  {
  factory $OrderModelCopyWith(OrderModel value, $Res Function(OrderModel) _then) = _$OrderModelCopyWithImpl;
@useResult
$Res call({
 String orderId, AppUser appUser, String orderStatus, String paymentMethod, num totalAmount,@TimestampConverter() Timestamp orderDate, List<CartModel> itemDetails
});


$AppUserCopyWith<$Res> get appUser;

}
/// @nodoc
class _$OrderModelCopyWithImpl<$Res>
    implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? appUser = null,Object? orderStatus = null,Object? paymentMethod = null,Object? totalAmount = null,Object? orderDate = null,Object? itemDetails = null,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,appUser: null == appUser ? _self.appUser : appUser // ignore: cast_nullable_to_non_nullable
as AppUser,orderStatus: null == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as num,orderDate: null == orderDate ? _self.orderDate : orderDate // ignore: cast_nullable_to_non_nullable
as Timestamp,itemDetails: null == itemDetails ? _self.itemDetails : itemDetails // ignore: cast_nullable_to_non_nullable
as List<CartModel>,
  ));
}
/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppUserCopyWith<$Res> get appUser {
  
  return $AppUserCopyWith<$Res>(_self.appUser, (value) {
    return _then(_self.copyWith(appUser: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderModel].
extension OrderModelPatterns on OrderModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderModel value)  $default,){
final _that = this;
switch (_that) {
case _OrderModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderModel value)?  $default,){
final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String orderId,  AppUser appUser,  String orderStatus,  String paymentMethod,  num totalAmount, @TimestampConverter()  Timestamp orderDate,  List<CartModel> itemDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.orderId,_that.appUser,_that.orderStatus,_that.paymentMethod,_that.totalAmount,_that.orderDate,_that.itemDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String orderId,  AppUser appUser,  String orderStatus,  String paymentMethod,  num totalAmount, @TimestampConverter()  Timestamp orderDate,  List<CartModel> itemDetails)  $default,) {final _that = this;
switch (_that) {
case _OrderModel():
return $default(_that.orderId,_that.appUser,_that.orderStatus,_that.paymentMethod,_that.totalAmount,_that.orderDate,_that.itemDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String orderId,  AppUser appUser,  String orderStatus,  String paymentMethod,  num totalAmount, @TimestampConverter()  Timestamp orderDate,  List<CartModel> itemDetails)?  $default,) {final _that = this;
switch (_that) {
case _OrderModel() when $default != null:
return $default(_that.orderId,_that.appUser,_that.orderStatus,_that.paymentMethod,_that.totalAmount,_that.orderDate,_that.itemDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderModel implements OrderModel {
   _OrderModel({required this.orderId, required this.appUser, required this.orderStatus, required this.paymentMethod, required this.totalAmount, @TimestampConverter() required this.orderDate, required this.itemDetails});
  factory _OrderModel.fromJson(Map<String, dynamic> json) => _$OrderModelFromJson(json);

@override  String orderId;
@override  AppUser appUser;
@override  String orderStatus;
@override  String paymentMethod;
@override  num totalAmount;
@override@TimestampConverter()  Timestamp orderDate;
@override  List<CartModel> itemDetails;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderModelCopyWith<_OrderModel> get copyWith => __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderModelToJson(this, );
}



@override
String toString() {
  return 'OrderModel(orderId: $orderId, appUser: $appUser, orderStatus: $orderStatus, paymentMethod: $paymentMethod, totalAmount: $totalAmount, orderDate: $orderDate, itemDetails: $itemDetails)';
}


}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res> implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(_OrderModel value, $Res Function(_OrderModel) _then) = __$OrderModelCopyWithImpl;
@override @useResult
$Res call({
 String orderId, AppUser appUser, String orderStatus, String paymentMethod, num totalAmount,@TimestampConverter() Timestamp orderDate, List<CartModel> itemDetails
});


@override $AppUserCopyWith<$Res> get appUser;

}
/// @nodoc
class __$OrderModelCopyWithImpl<$Res>
    implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? appUser = null,Object? orderStatus = null,Object? paymentMethod = null,Object? totalAmount = null,Object? orderDate = null,Object? itemDetails = null,}) {
  return _then(_OrderModel(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,appUser: null == appUser ? _self.appUser : appUser // ignore: cast_nullable_to_non_nullable
as AppUser,orderStatus: null == orderStatus ? _self.orderStatus : orderStatus // ignore: cast_nullable_to_non_nullable
as String,paymentMethod: null == paymentMethod ? _self.paymentMethod : paymentMethod // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as num,orderDate: null == orderDate ? _self.orderDate : orderDate // ignore: cast_nullable_to_non_nullable
as Timestamp,itemDetails: null == itemDetails ? _self.itemDetails : itemDetails // ignore: cast_nullable_to_non_nullable
as List<CartModel>,
  ));
}

/// Create a copy of OrderModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AppUserCopyWith<$Res> get appUser {
  
  return $AppUserCopyWith<$Res>(_self.appUser, (value) {
    return _then(_self.copyWith(appUser: value));
  });
}
}

// dart format on
