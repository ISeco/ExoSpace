import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:exospace_app/theme/app_theme.dart';
import 'package:exospace_app/providers/providers.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigatorBar extends StatelessWidget {

  const CustomBottomNavigatorBar({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final navigationProvider = Provider.of<NavigationProvider>(context);

    return FancyBottomNavigation(
      initialSelection: navigationProvider.currentPage,
      barBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
      textColor: Colors.white,
      inactiveIconColor: Colors.white,
      circleColor: AppTheme.primary,
      tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: FontAwesomeIcons.cloudSunRain, title: "Mars Weather")
      ],
      onTabChangedListener: (value) {
        navigationProvider.currentPage = value;
      },
    );
  }
}