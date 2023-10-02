import 'package:flutter/material.dart';
import 'package:flutter_restapi_with_mavvm/res/components/roundbutton.dart';
import 'package:flutter_restapi_with_mavvm/utils/routes/routeNames.dart';

import 'package:flutter_restapi_with_mavvm/utils/utils/utils.dart';
import 'package:provider/provider.dart';

import '../view_model/auth_View_Model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode emailfocusNode = FocusNode();
  final FocusNode passwordfocusNode = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailfocusNode.dispose();
    passwordfocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authviewmodel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  focusNode: emailfocusNode,
                  onFieldSubmitted: (val) {
                    Utils.changeFocusNode(
                        context, emailfocusNode, passwordfocusNode);
                  },
                  decoration: const InputDecoration(
                      hintText: "Email", prefixIcon: Icon(Icons.email)),
                  controller: _emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                ValueListenableBuilder(
                  valueListenable: _obsecurePassword,
                  builder: (context, value, child) {
                    return TextFormField(
                      obscureText: _obsecurePassword.value,
                      focusNode: passwordfocusNode,
                      decoration: InputDecoration(
                          hintText: "Password",
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: InkWell(
                              onTap: () {
                                _obsecurePassword.value =
                                    !_obsecurePassword.value;
                              },
                              child: const Icon(Icons.visibility_off))),
                      controller: _passwordController,
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                roundButton(
                    title: "Login",
                    loading: authviewmodel.loading,

                    onpress: () async{
                      if (_emailController.text.isEmpty) {
                        Utils.flushBarErrorMessage(
                            "Email cannot be empty", context);
                      } else if (_passwordController.text.isEmpty) {
                        Utils.flushBarErrorMessage(
                            "Password cannot be empty", context);
                      } else {
                        Map data = {
                          "email": _emailController.text.toString(),
                          "password": _passwordController.text.toString()
                        };
                        authviewmodel.loginApi(data,context);
               
                      
                      }
                    }),
                   const SizedBox(
                  height: 10,
                ), 
                 Row(
                   children: [
                     const Text("Don't have an account?"),
                    TextButton(onPressed: (){
                      Navigator.pushNamed(context, RouteNames.signUpScreen);
                    }, child: const Text("Sign Up"))
                   ],
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
