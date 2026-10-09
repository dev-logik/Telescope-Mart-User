# Fix Nested Object Serialization Error

The error `Invalid argument: Instance of '_AppUser'` occurs when Cloud Firestore receives a custom Dart object instead of a supported primitive type (like `Map`, `String`, `int`, etc.). This typically happens when serializing a nested object (like `AppUser` inside `OrderModel`) without explicitly telling the JSON serializer to call `toJson()` on the nested object.

## Proposed Changes

### [Models]

I will add `@JsonSerializable(explicitToJson: true)` to the following models to ensure nested objects are correctly converted to Maps during serialization:

#### [MODIFY] [order_model.dart](file:///D:/Documents/Code Workspace/Side Projects/telescope_mart_user_v2/lib/models/order_model.dart)
- Add `@JsonSerializable(explicitToJson: true)` to the `OrderModel` class. This ensures `appUser` and `itemDetails` are serialized as Maps/Lists of Maps.

#### [MODIFY] [app_user.dart](file:///D:/Documents/Code Workspace/Side Projects/telescope_mart_user_v2/lib/models/app_user.dart)
- Uncomment or add `@JsonSerializable(explicitToJson: true)` to the `AppUser` class. This ensures `userAddress` is serialized as a Map.

#### [MODIFY] [telescope.dart](file:///D:/Documents/Code Workspace/Side Projects/telescope_mart_user_v2/lib/models/telescope.dart)
- Add `@JsonSerializable(explicitToJson: true)` to the `Telescope` class. This ensures `brand` and `ImageModel` fields are serialized correctly.

### [Build]

#### [RUN] Regenerate Code
- Execute `flutter pub run build_runner build --delete-conflicting-outputs` to update the `.g.dart` files with the new serialization logic.

## Verification Plan

### Automated Tests
- I will verify that the generated `order_model.g.dart` now contains `appUser.toJson()` instead of just `appUser`.

### Manual Verification
1. Attempt to place an order in the app.
2. Verify that the `Invalid argument: Instance of '_AppUser'` error no longer appears in the logs.
3. Check Cloud Firestore to ensure the `Orders` and `Users` documents are created with correctly nested Maps.
