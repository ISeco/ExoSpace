import 'package:flutter/material.dart';

import 'package:animations/animations.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'package:exospace_app/screens/screens.dart';
import 'package:exospace_app/widgets/widgets.dart';

class ListCardServices extends StatelessWidget {
  const ListCardServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: animationConfig( <Widget>[
          const _OpenContainer(
            imgProfile: 'assets/exoplanet.png',
            title: 'Exoplanetas',
            body: 'Aquí podrás ver un listado de exoplanetas confirmados en el año 2022 con la información respectiva de sus características.',
            widget: ExoplanetScreen(),
          ),
          const _OpenContainer(
            imgProfile: 'assets/mars.png',
            title: 'Rover en Marte',
            body: 'Aquí podrás ver las fotografías tomadas por Rover en su misión por marte.',
            widget: RoverScreen(),
          ),
          const _OpenContainer(
            imgProfile: 'assets/astronomy.png',
            title: 'Imagen Astronómica del día',
            body: 'Aquí podrás ver una imagen astronómica del día',
            widget: PictureDayScreen(),
          ),
          const SizedBox(height: 40)
        ]),
      );
  }

  AnimationLimiter animationConfig( List<Widget> children ) {
    return AnimationLimiter(
      child: Column(
        children: AnimationConfiguration.toStaggeredList(
          duration: const Duration(seconds: 1),
          delay: const Duration(milliseconds: 500),
          childAnimationBuilder: (widget) => SlideAnimation(
            horizontalOffset: 50.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: children,
        ),
      ),
    );
  }
}

class _OpenContainer extends StatelessWidget {

  final String imgProfile;
  final String title;
  final String body;
  final Widget widget;

  const _OpenContainer({
    Key? key,
    required this.imgProfile,
    required this.title,
    required this.body,
    required this.widget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      transitionType: ContainerTransitionType.fadeThrough,
      transitionDuration: const Duration( milliseconds: 600 ),
      openBuilder: (context, _) => widget,
      closedBuilder: (context, openContainer) {
        return GestureDetector(
          onTap: () => openContainer(),
          child: CardService(
            imageBackground: imgProfile,
            title: title,
            body: body,
          ),
        );
      },
      closedElevation: 0,
    );
  }
}