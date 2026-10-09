import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide User;
import 'package:telescope_mart/auth/auth_service.dart';
import 'package:telescope_mart/db/db_helper.dart';
import 'package:telescope_mart/main.dart';
import 'package:telescope_mart/models/app_user.dart';
import 'package:telescope_mart/models/image_model.dart';
import 'package:telescope_mart/utils/constants.dart';

class UserProvider extends ChangeNotifier {
  AppUser? appUser;
  Future<void> addUser({required User user, String? name, String? phone}) {
    final appUser = AppUser(
      uid: user.uid,
      email: user.email!,
      phone: phone,
      userName: name,
      userCreationTime: Timestamp.fromDate(user.metadata.creationTime!),
    );

    return DbHelper.addUser(appUser);
  }

  void getUserInfo() {
    DbHelper.getUserInfo(AuthService.currentUser!.uid).listen((docSnapshot) {
      if (docSnapshot.exists) {
        appUser = AppUser.fromJson(docSnapshot.data()!);
        notifyListeners();
      }
    });
  }

  Future<bool> doesUserExist(String uid) => DbHelper.doesUserExist(uid);

  Future<ImageModel> uploadImage(String imageLocalPath) async {
    final String name = "image_${DateTime.now().millisecondsSinceEpoch}.jpg";

    final file = File(imageLocalPath);

    try {
      log("Before upload", name: "In Upload image");
      final filePath = await supabase.storage
          .from(userImageDirectory)
          .upload(
            name,
            file,
            fileOptions: FileOptions(cacheControl: '3600', upsert: false),
          );

      var url = supabase.storage
          .from(userImageDirectory)
          .getPublicUrl(filePath);
      url = url.replaceFirst("/$userImageDirectory", "");
      log("After upload: $url", name: "In Upload image");
      return ImageModel(
        imageName: name,
        directoryName: userImageDirectory,
        downloadUrl: url,
      );
    } catch (error) {
      log("Error uploading file: $error", name: "In Upload image");
      rethrow;
    }
  }
}
