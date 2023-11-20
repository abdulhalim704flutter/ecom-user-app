import 'package:ecom_user/auth/auth_service.dart';
import 'package:ecom_user/pages/launcher_screen.dart';
import 'package:ecom_user/providers/user_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  String errorMsg = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 4.0),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Email address',
                      prefixIcon: const Icon(Icons.email)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this feild must not be empty!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 4.0),
                child: TextFormField(
                  obscureText: isObscureText,
                  controller: _passController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isObscureText = !isObscureText;
                          });
                        },
                        icon: Icon(isObscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'this feild must not be empty!';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  _authenticate(true);
                },
                child: Text('Save'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('New User?'),
                  TextButton(
                    onPressed: () {
                      _authenticate(false);
                    },
                    child: const Text('Register hare'),
                  )
                ],
              ),
              const Center(
                child: const Text('OR'),
              ),
              ElevatedButton(
                  onPressed: () {}, child: const Text('SIgn in with google')),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  errorMsg,
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _authenticate(bool isLogin) async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passController.text;
      EasyLoading.show(status: 'please wait');
      User user;
      try{
        if(isLogin){
          user = await AuthService.loginUser(email, password);
        }else{
          user = await AuthService.registerUser(email, password);
          await Provider.of<UserProvider>(context,listen: false)
            .addNewUser(user);
        }
        EasyLoading.dismiss();
        Navigator.pushReplacementNamed(context, LauncherScreen.routeName);
      }on FirebaseAuthException catch(error){
        EasyLoading.dismiss();
        setState(() {
          errorMsg = error.message!;
        });
      }
    }
  }
}
