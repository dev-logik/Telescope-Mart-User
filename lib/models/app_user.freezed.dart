// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppUser {

 String get uid; set uid(String value); String get email; set email(String value); UserAddress? get userAddress; set userAddress(UserAddress? value); ImageModel? get profileImage; set profileImage(ImageModel? value); String? get userName; set userName(String? value); String? get phone; set phone(String? value);@TimestampConverter() Timestamp? get userCreationTime;@TimestampConverter() set userCreationTime(Timestamp? value);
/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppUserCopyWith<AppUser> get copyWith => _$AppUserCopyWithImpl<AppUser>(this as AppUser, _$identity);

  /// Serializes this AppUser to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'AppUser(uid: $uid, email: $email, userAddress: $userAddress, profileImage: $profileImage, userName: $userName, phone: $phone, userCreationTime: $userCreationTime)';
}


}

/// @nodoc
abstract mixin class $AppUserCopyWith<$Res>  {
  factory $AppUserCopyWith(AppUser value, $Res Function(AppUser) _then) = _$AppUserCopyWithImpl;
@useResult
$Res call({
 String uid, String email, UserAddress? userAddress, ImageModel? profileImage, String? userName, String? phone,@TimestampConverter() Timestamp? userCreationTime
});


$UserAddressCopyWith<$Res>? get userAddress;$ImageModelCopyWith<$Res>? get profileImage;

}
/// @nodoc
class _$AppUserCopyWithImpl<$Res>
    implements $AppUserCopyWith<$Res> {
  _$AppUserCopyWithImpl(this._self, this._then);

  final AppUser _self;
  final $Res Function(AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uid = null,Object? email = null,Object? userAddress = freezed,Object? profileImage = freezed,Object? userName = freezed,Object? phone = freezed,Object? userCreationTime = freezed,}) {
  return _then(_self.copyWith(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,userAddress: freezed == userAddress ? _self.userAddress : userAddress // ignore: cast_nullable_to_non_nullable
as UserAddress?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as ImageModel?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,userCreationTime: freezed == userCreationTime ? _self.userCreationTime : userCreationTime // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}
/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAddressCopyWith<$Res>? get userAddress {
    if (_self.userAddress == null) {
    return null;
  }

  return $UserAddressCopyWith<$Res>(_self.userAddress!, (value) {
    return _then(_self.copyWith(userAddress: value));
  });
}/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageModelCopyWith<$Res>? get profileImage {
    if (_self.profileImage == null) {
    return null;
  }

  return $ImageModelCopyWith<$Res>(_self.profileImage!, (value) {
    return _then(_self.copyWith(profileImage: value));
  });
}
}


/// Adds pattern-matching-related methods to [AppUser].
extension AppUserPatterns on AppUser {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppUser value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppUser() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppUser value)  $default,){
final _that = this;
switch (_that) {
case _AppUser():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppUser value)?  $default,){
final _that = this;
switch (_that) {
case _AppUser() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uid,  String email,  UserAddress? userAddress,  ImageModel? profileImage,  String? userName,  String? phone, @TimestampConverter()  Timestamp? userCreationTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.uid,_that.email,_that.userAddress,_that.profileImage,_that.userName,_that.phone,_that.userCreationTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uid,  String email,  UserAddress? userAddress,  ImageModel? profileImage,  String? userName,  String? phone, @TimestampConverter()  Timestamp? userCreationTime)  $default,) {final _that = this;
switch (_that) {
case _AppUser():
return $default(_that.uid,_that.email,_that.userAddress,_that.profileImage,_that.userName,_that.phone,_that.userCreationTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uid,  String email,  UserAddress? userAddress,  ImageModel? profileImage,  String? userName,  String? phone, @TimestampConverter()  Timestamp? userCreationTime)?  $default,) {final _that = this;
switch (_that) {
case _AppUser() when $default != null:
return $default(_that.uid,_that.email,_that.userAddress,_that.profileImage,_that.userName,_that.phone,_that.userCreationTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppUser implements AppUser {
   _AppUser({required this.uid, required this.email, this.userAddress, this.profileImage, this.userName, this.phone, @TimestampConverter() this.userCreationTime});
  factory _AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

@override  String uid;
@override  String email;
@override  UserAddress? userAddress;
@override  ImageModel? profileImage;
@override  String? userName;
@override  String? phone;
@override@TimestampConverter()  Timestamp? userCreationTime;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppUserCopyWith<_AppUser> get copyWith => __$AppUserCopyWithImpl<_AppUser>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppUserToJson(this, );
}



@override
String toString() {
  return 'AppUser(uid: $uid, email: $email, userAddress: $userAddress, profileImage: $profileImage, userName: $userName, phone: $phone, userCreationTime: $userCreationTime)';
}


}

/// @nodoc
abstract mixin class _$AppUserCopyWith<$Res> implements $AppUserCopyWith<$Res> {
  factory _$AppUserCopyWith(_AppUser value, $Res Function(_AppUser) _then) = __$AppUserCopyWithImpl;
@override @useResult
$Res call({
 String uid, String email, UserAddress? userAddress, ImageModel? profileImage, String? userName, String? phone,@TimestampConverter() Timestamp? userCreationTime
});


@override $UserAddressCopyWith<$Res>? get userAddress;@override $ImageModelCopyWith<$Res>? get profileImage;

}
/// @nodoc
class __$AppUserCopyWithImpl<$Res>
    implements _$AppUserCopyWith<$Res> {
  __$AppUserCopyWithImpl(this._self, this._then);

  final _AppUser _self;
  final $Res Function(_AppUser) _then;

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uid = null,Object? email = null,Object? userAddress = freezed,Object? profileImage = freezed,Object? userName = freezed,Object? phone = freezed,Object? userCreationTime = freezed,}) {
  return _then(_AppUser(
uid: null == uid ? _self.uid : uid // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,userAddress: freezed == userAddress ? _self.userAddress : userAddress // ignore: cast_nullable_to_non_nullable
as UserAddress?,profileImage: freezed == profileImage ? _self.profileImage : profileImage // ignore: cast_nullable_to_non_nullable
as ImageModel?,userName: freezed == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,userCreationTime: freezed == userCreationTime ? _self.userCreationTime : userCreationTime // ignore: cast_nullable_to_non_nullable
as Timestamp?,
  ));
}

/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserAddressCopyWith<$Res>? get userAddress {
    if (_self.userAddress == null) {
    return null;
  }

  return $UserAddressCopyWith<$Res>(_self.userAddress!, (value) {
    return _then(_self.copyWith(userAddress: value));
  });
}/// Create a copy of AppUser
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageModelCopyWith<$Res>? get profileImage {
    if (_self.profileImage == null) {
    return null;
  }

  return $ImageModelCopyWith<$Res>(_self.profileImage!, (value) {
    return _then(_self.copyWith(profileImage: value));
  });
}
}

// dart format on
