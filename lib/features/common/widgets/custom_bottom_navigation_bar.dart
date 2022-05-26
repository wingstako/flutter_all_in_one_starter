import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_all_in_one_starter/features/feature_1/feature_1.dart';
import 'package:flutter_all_in_one_starter/features/feature_2/feature_2.dart';
import 'package:flutter_all_in_one_starter/shared/providers/bottom_nav_provider.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navProvider = Provider.of<BottomNavigationBarProvider>(context);

    return BottomNavigationBar(
      elevation: 0,
      selectedLabelStyle: const TextStyle(height: 0),
      unselectedLabelStyle: const TextStyle(height: 0),
      currentIndex: navProvider.currentIndex,
      onTap: (value) => navProvider.currentIndex = value,
      items: const [
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: ""),
      BottomNavigationBarItem(icon: Icon(CupertinoIcons.settings), label: "")
    ]);
  }
}
