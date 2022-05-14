import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';

import 'package:exospace_app/services/services.dart';
import 'package:exospace_app/widgets/widgets.dart';

class RoverScreen extends StatelessWidget {
   
  const RoverScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: const [
          StyleBackground(),
          TitleOfScreen(title:'Rover en Marte'),
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

    final roverService = Provider.of<RoverService>(context);
    final listPhotos =  roverService.roverPhotos;

    return Container(
      margin: const EdgeInsets.only(top: 180),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          const InputDate(),
          Flexible(
            child: roverService.isLoading
              ? Container(
                  margin: const EdgeInsets.only(top: 100),
                  padding: const EdgeInsets.all(5),
                  width: 40,
                  height: 40,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),  
                )
                 
              : Container(
                  color: Colors.transparent,
                  child: !roverService.thereArePhotos
                    ? const Text(
                        'Rover no tomó fotografías en esta fecha :(',
                        style: TextStyle(color: Colors.white),
                      )
                    : Swiper(
                        scrollDirection: Axis.vertical,
                        axisDirection: AxisDirection.down,
                        itemCount: listPhotos.length,
                        layout: SwiperLayout.STACK,
                        itemWidth: 380,
                        itemHeight: 390,
                        itemBuilder: (_, int i) {
                          return CardImage(photo: listPhotos[i]);
                        },
                      ),
                ),
          ),
        ],
      ),
    );
  }
}