import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LocalizationView extends StatelessWidget {
  const LocalizationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).canvasColor,
        leading: BackButton(color: Colors.blue.shade100,)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () =>
                  EasyLocalization.of(context)!.setLocale(const Locale('zh')),
              child: Center(child: const Text("lang.chinese").tr())),

               TextButton(
              onPressed: () =>
                  EasyLocalization.of(context)!.setLocale(const Locale('en')),
              child: Center(child: const Text("lang.english").tr())),
        ],
      ),
    );
  }
}
