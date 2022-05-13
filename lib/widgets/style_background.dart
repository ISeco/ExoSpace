import 'package:flutter/material.dart';

class StyleBackground extends StatelessWidget {
  const StyleBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: const [
          _BackgroundImage(),
          _BackgroundGradient()
        ],
      ),
    );
  }
}

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black,
      child: const Image(
        image: AssetImage('assets/fullscreen-bg.png'),
        fit: BoxFit.cover,
      ),
    );
  }
}

class _BackgroundGradient extends StatelessWidget {
  const _BackgroundGradient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.4,0.6],
          colors: [
            Color.fromARGB(0, 0, 0, 0),
            Color.fromARGB(255, 0, 0, 0),
          ]
        )
      ),
    );
  }
}