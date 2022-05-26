import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_all_in_one_starter/features/localization/localization.dart';
import 'package:flutter_all_in_one_starter/shared/providers/auth_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<void> _login() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    String email = _emailController.text;
    String password = _passwordController.text;

    final success =
        await authProvider.signInWithEmailAndPassword(email, password);
  }

  Future<void> _register() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    String email = _emailController.text;
    String password = _passwordController.text;

    final success =
        await authProvider.registerWithEmailAndPassword(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).canvasColor,
          elevation: 0,
          actions: [
            GestureDetector(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const LocalizationView())),
              child: Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Icon(
                  CupertinoIcons.globe,
                  color: Colors.blue.shade100,
                ),
              ),
            )
          ]),
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: CustomScrollView(
              // physics: NeverScrollableScrollPhysics(),
              slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SvgPicture.asset(
                          'assets/images/undraw_relaxing_walk.svg'),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200,
                        ),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Icon(CupertinoIcons.mail),
                            ),
                            Expanded(
                                flex: 5,
                                child: TextFormField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                  showCursor: false,
                                  autocorrect: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "error.cannot.be.empty"
                                          .tr(args: ["auth.email".tr()]);
                                    }
                                    bool emailValid = RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value);

                                    if (!emailValid) {
                                      return "error.invalid.email".tr();
                                    }
                                    return null;
                                  },
                                ))
                          ],
                        ),
                      ),
                      const Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.shade200,
                        ),
                        child: Flex(
                          direction: Axis.horizontal,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Icon(CupertinoIcons.lock),
                            ),
                            Expanded(
                                flex: 5,
                                child: TextFormField(
                                  controller: _passwordController,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                  showCursor: false,
                                  autocorrect: false,
                                  obscureText: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "error.cannot.be.empty"
                                          .tr(args: ["auth.password".tr()]);
                                    }

                                    if (value.length < 6) {
                                      return "error.password.too.weak".tr();
                                    }

                                    return null;
                                  },
                                ))
                          ],
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      Flex(direction: Axis.horizontal, children: [
                        TextButton(
                          style: const ButtonStyle(),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _login();
                            }
                          },
                          child: const Text("auth.login").tr(),
                        ),
                        TextButton(
                          style: const ButtonStyle(),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _register();
                            }
                          },
                          child: const Text("auth.register").tr(),
                        ),
                      ]),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
