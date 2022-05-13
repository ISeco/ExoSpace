import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:exospace_app/services/services.dart';
import 'package:exospace_app/widgets/widgets.dart';

class ExoplanetScreen extends StatelessWidget {
   
  const ExoplanetScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: const [
          StyleBackground(),
          TitleOfScreen(title:'Exoplanetas'),
          _BodyWidget()
        ],
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final exoPlanetService = Provider.of<ExoplanetService>(context);

    return Container(
      margin: const EdgeInsets.only(top: 100),
      width: double.infinity,
      height: double.infinity,
      child: exoPlanetService.isLoading
      ? const Center(
        child: CircularProgressIndicator(
          color: Colors.indigo,
        ),
      )
      : Swiper(
          itemCount: exoPlanetService.listExoplanet.length,
          layout: SwiperLayout.STACK,
          itemWidth: 300,
          itemHeight: 400,
          itemBuilder: (_, int i) {
            return CardPlanet( 
              exoplanet: exoPlanetService.listExoplanet[i], 
            );
          },
        )
    );
  }
}