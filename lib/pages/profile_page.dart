import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:telescope_mart/db/db_helper.dart';
import 'package:telescope_mart/providers/user_provider.dart';
import 'package:telescope_mart/utils/helper_functions.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = "profile_page";
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? profileImagePath;
  late final UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    userProvider = Provider.of<UserProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("User Profile")),
      body: Consumer<UserProvider>(
        builder: (context, provider, child) => ListView(
          children: [
            Stack(
              alignment: .center,
              children: [
                CircleAvatar(
                  radius: 70,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(70),
                    child: CachedNetworkImage(
                      imageUrl: provider.appUser!.profileImage!.downloadUrl,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.person,
                        color: Colors.greenAccent,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 130,
                  bottom: 0,
                  child: IconButton(
                    onPressed: () {
                      showBottomSheet(
                        context: context,
                        builder: (bottomsheetContext) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ListTile(
                                  title: const Text("Take Photo"),
                                  leading: Icon(Icons.camera),
                                  onTap: () async {
                                    getAndSetImage(
                                      ImageSource.camera,
                                      bottomsheetContext,
                                    );
                                  },
                                ),
                                ListTile(
                                  title: const Text("Choose from Gallery"),
                                  leading: Icon(Icons.image),
                                  onTap: () {
                                    getAndSetImage(
                                      ImageSource.gallery,
                                      bottomsheetContext,
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.camera_alt),
                  ),
                ),
              ],
            ),
            ListTile(
              title: const Text("Name"),
              subtitle: Text(provider.appUser?.userName ?? "N/A"),
            ),
            ListTile(
              title: const Text("Email"),
              subtitle: Text(provider.appUser?.email ?? "N/A"),
            ),
            ListTile(
              title: const Text("Phone"),
              subtitle: Text(provider.appUser?.phone ?? "N/A"),
            ),

            ListTile(
              title: const Text("Address"),
              subtitle: Text(
                '${provider.appUser?.userAddress?.streetAddress ?? "N/A"}, ${provider.appUser?.userAddress?.city ?? "N/A"}.',
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getAndSetImage(ImageSource source, BuildContext context) async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: source, imageQuality: 50);
    if (file != null) {
      final imagePath = file.path;
      final imageModel = await userProvider.uploadImage(imagePath);
      await DbHelper.setProfileImage(userProvider.appUser!.uid, imageModel);
      if (context.mounted) {
        context.pop();
      }
    }
  }
}
