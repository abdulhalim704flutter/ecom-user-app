import 'package:ecom_user/pages/product_list_page.dart';
import 'package:flutter/material.dart';

import '../auth/auth_service.dart';
import 'login_screen.dart';

class LauncherScreen extends StatefulWidget {
  static const String routeName = '/';
  const LauncherScreen({super.key});

  @override
  State<LauncherScreen> createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State<LauncherScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 0),(){
      if(AuthService.currentUser != null){
        Navigator.pushReplacementNamed(context, ProductListPage.routeName);
      }else{
        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
