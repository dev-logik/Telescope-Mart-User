import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:telescope_mart/auth/auth_service.dart';
import 'package:telescope_mart/pages/cart_page.dart';
import 'package:telescope_mart/pages/checkout_page.dart';
import 'package:telescope_mart/pages/login_page.dart';
import 'package:telescope_mart/pages/order_page.dart';
import 'package:telescope_mart/pages/profile_page.dart';
import 'package:telescope_mart/pages/telescope_details_page.dart';
import 'package:telescope_mart/pages/view_telescope_page.dart';
import 'package:telescope_mart/providers/cart_provider.dart';
import 'package:telescope_mart/providers/order_provider.dart';
import 'package:telescope_mart/providers/telescope_provider.dart';
import 'package:telescope_mart/providers/user_provider.dart';
import 'package:telescope_mart/utils/colors.dart';

import 'firebase_options.dart';

final supabase = Supabase.instance.client;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize(
    serverClientId: "1062639968871-8g3cgfkbjfvv923kq4hhqvi9llvq2fhs.apps.googleusercontent.com",
  );
  await Supabase.initialize(
    url: "https://bxeoxtsmgkfikxhpzltt.supabase.co",
    publishableKey: "sb_publishable_nUvsbKwIADam-84om6aLyQ_Qj6zM9Ki",
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => TelescopeProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  ThemeData _buildShrineTheme() {
    final ThemeData base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: kShrinePink400,
        onPrimary: kShrineBrown900,
        secondary: kShrineBrown900,
        error: kShrineErrorRed,
      ),
      textTheme: _buildShrineTextTheme(GoogleFonts.ralewayTextTheme()),
      textSelectionTheme: const TextSelectionThemeData(
        selectionColor: kShrinePink100,
      ),
    );
  }

  TextTheme _buildShrineTextTheme(TextTheme base) {
    return base
        .copyWith(
          headlineSmall: base.headlineSmall!.copyWith(fontWeight: .w500),
          titleLarge: base.titleLarge!.copyWith(fontSize: 18.0),
          bodySmall: base.bodySmall!.copyWith(
            fontWeight: .w400,
            fontSize: 14.0,
          ),
          bodyLarge: base.bodyLarge!.copyWith(
            fontWeight: .w500,
            fontSize: 16.0,
          ),
        )
        .apply(displayColor: kShrineBrown900, bodyColor: kShrineBrown900);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _goRouter,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: _buildShrineTheme(),
      builder: EasyLoading.init(),
    );
  }

  final _goRouter = GoRouter(
    initialLocation: ViewTelescopePage.routeName,
    debugLogDiagnostics: true,
    redirect: (context, state) {
      if (AuthService.currentUser == null) {
        return LoginPage.routeName;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: LoginPage.routeName,
        name: LoginPage.routeName,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: ViewTelescopePage.routeName,
        name: ViewTelescopePage.routeName,
        builder: (context, state) => const ViewTelescopePage(),
        routes: [
          GoRoute(
            path: TelescopeDetailsPage.routeName,
            name: TelescopeDetailsPage.routeName,
            builder: (context, state) =>
                TelescopeDetailsPage(id: state.extra! as String),
          ),
          GoRoute(
            path: CartPage.routeName,
            name: CartPage.routeName,
            builder: (context, state) => const CartPage(),
            routes: [
              GoRoute(
                path: CheckoutPage.routeName,
                name: CheckoutPage.routeName,
                builder: (context, state) => const CheckoutPage(),
              ),
            ],
          ),
          GoRoute(
            path: ProfilePage.routeName,
            name: ProfilePage.routeName,
            builder: (context, state) => const ProfilePage(),
          ),
          GoRoute(
            path: OrderPage.routeName,
            name: OrderPage.routeName,
            builder: (context, state) => const OrderPage(),
          ),
        ],
      ),
    ],
  );
}
