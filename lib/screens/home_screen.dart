import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:exospace_app/providers/providers.dart';
import 'package:exospace_app/screens/screens.dart';
import 'package:exospace_app/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Scaffold(
        body: _Pages(),
        bottomNavigationBar: const CustomBottomNavigatorBar(),
      ),
    );
  }
}

class _Pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final navigationProvider = Provider.of<NavigationProvider>(context);

    return PageView(
      controller: navigationProvider.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: const [
        ListServicesScreen(),
        //TODO: Seguna página 
      ],
    );
  }
}