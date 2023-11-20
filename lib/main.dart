import 'package:ecom_user/pages/cart_page.dart';
import 'package:ecom_user/pages/checkout_page.dart';
import 'package:ecom_user/pages/launcher_screen.dart';
import 'package:ecom_user/pages/login_screen.dart';
import 'package:ecom_user/pages/order_successful_page.dart';
import 'package:ecom_user/pages/product_details_page.dart';
import 'package:ecom_user/pages/product_list_page.dart';
import 'package:ecom_user/providers/cart_provider.dart';
import 'package:ecom_user/providers/order_provider.dart';
import 'package:ecom_user/providers/product_provider.dart';
import 'package:ecom_user/providers/user_providers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
// halim

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => UserProvider()),
    ChangeNotifierProvider(create: (_) => ProductProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
    ChangeNotifierProvider(create: (_) => OrderProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: EasyLoading.init(),
      initialRoute: LauncherScreen.routeName,
      routes: {
        LauncherScreen.routeName: (_) => const LauncherScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),
        ProductListPage.routeName: (_) => const ProductListPage(),
        ProductDetailsPage.routeName : (_) => const ProductDetailsPage(),
        CartPage.routeName : (_) => const CartPage(),
        CheckoutPage.routeName : (_) => const CheckoutPage(),
        OrderSuccessfulPage.routeName : (_) => const OrderSuccessfulPage(),
      },
    );
  }
}
