import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_all_in_one_starter/features/common/common.dart';
import 'package:flutter_all_in_one_starter/shared/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class Feature1 extends StatelessWidget {
  const Feature1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: const Text("features.debug.msg").tr(args: ["Feature1"])),
              TextButton(
              onPressed: () {
                throw Exception();
              },
              child: Text("test.crashlytics").tr()),
          TextButton(
              onPressed: () {
                authProvider.signOut();
              },
              child: Text("auth.logout").tr()),
        ],
      ),
    );
  }
}
