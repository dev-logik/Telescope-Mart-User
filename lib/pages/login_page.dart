import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:telescope_mart/auth/auth_service.dart';
import 'package:telescope_mart/customwidgets/login_section.dart';
import 'package:telescope_mart/customwidgets/registration_section.dart';
import 'package:telescope_mart/pages/view_telescope_page.dart';
import 'package:telescope_mart/providers/user_provider.dart';
import 'package:telescope_mart/utils/colors.dart';
import 'package:telescope_mart/utils/helper_functions.dart';

enum AuthChoice { login, register }

class LoginPage extends StatefulWidget {
  static const String routeName = "/login";
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _errMsg = '';
  AuthChoice _authChoice = AuthChoice.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: .all(24.0),
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Text(
                "Welcome, user",
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: .center,
              ),
            ),
            SegmentedButton<AuthChoice>(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return kShrineBrown900;
                  }
                  return null;
                }),
                foregroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return kShrineSurfaceWhite;
                  }
                  return kShrineBrown900;
                }),

                shape: WidgetStateProperty.resolveWith((states) {
                  return RoundedRectangleBorder(borderRadius: .circular(12.0));
                }),
              ),
              showSelectedIcon: false,
              segments: [
                const ButtonSegment(
                  value: AuthChoice.login,
                  label: Text("LOGIN"),
                ),
                const ButtonSegment(
                  value: AuthChoice.register,
                  label: Text("REGISTER"),
                ),
              ],
              selected: {_authChoice},
              onSelectionChanged: (choice) {
                setState(() {
                  _authChoice = choice.first;
                });
              },
            ),

            Card(
              child: Padding(
                padding: .all(8),
                child: AnimatedCrossFade(
                  firstChild: LoginSection(
                    onSuccess: () {
                      showMessage(context, "Login Successful");
                      context.goNamed(ViewTelescopePage.routeName);
                    },
                    onFailure: (value) {
                      setState(() {
                        _errMsg = value;
                      });
                    },
                  ),
                  secondChild: RegistrationSection(
                    onSuccess: () {
                      showMessage(context, "Registration Successful");
                    },
                    onFailure: (value) {
                      setState(() {
                        _errMsg = value;
                      });
                    },
                  ),
                  crossFadeState: _authChoice == .login
                      ? .showFirst
                      : .showSecond,
                  duration: const Duration(milliseconds: 500),
                ),
              ),
            ),

            if (_errMsg.isNotEmpty)
              Text(
                _errMsg,
                style: TextStyle(color: kShrineErrorRed, fontSize: 18),
              ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'OR',
                textAlign: .center,
                style: TextStyle(fontSize: 20),
              ),
            ),

            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: kShrineBrown900,
                foregroundColor: kShrineSurfaceWhite,
              ),
              onPressed: _signinWithGoogle,
              icon: const Icon(Icons.g_mobiledata),
              label: Text("SIGNIN WITH GOOGLE"),
            ),
          ],
        ),
      ),
    );
  }

  void _signinWithGoogle() async {
    setState(() {
      _errMsg = '';
    });
    EasyLoading.show(status: "Please wait");
    try {
      final credential = await AuthService.signInWithGoogle();
      if (credential == null) {
        EasyLoading.dismiss();
        return;
      }
      if (!mounted) return;
      final exists = await Provider.of<UserProvider>(
        context,
        listen: false,
      ).doesUserExist(credential.user!.uid);
      if (!exists) {
        await Provider.of<UserProvider>(context, listen: false).addUser(
          user: credential.user!,
          name: credential.user!.displayName,
          phone: credential.user!.phoneNumber,
        );
      }

      if (EasyLoading.isShow) {
        EasyLoading.dismiss();
      }

      if (mounted) {
        context.goNamed(ViewTelescopePage.routeName);
      }
    } catch (e) {
      EasyLoading.dismiss();
      setState(() {
        if (e is GoogleSignInException) {
          _errMsg = e.description!;
        } else if (e is FirebaseAuthException) {
          _errMsg = e.message ?? e.code;
        } else {
          _errMsg = e.toString();
        }
      });
    }
  }
}
