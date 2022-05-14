import 'package:flutter/material.dart';

import 'package:exospace_app/theme/app_theme.dart';
import 'package:exospace_app/models/models.dart';

class CardPlanet extends StatelessWidget {

  final Exoplanet exoplanet;

  const CardPlanet({
    Key? key,
    required this.exoplanet
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: _styleCardPlanet(),
      child: _CardHeader( exoplanet: exoplanet )
    );
    
  }

  BoxDecoration _styleCardPlanet() => BoxDecoration(
    color: AppTheme.colorCard,
    borderRadius: BorderRadius.circular(15),
  );
}

class _CardHeader extends StatelessWidget {

  final Exoplanet exoplanet;

  const _CardHeader({
    Key? key,
    required this.exoplanet,    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color:Colors.transparent,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          const _CardBackground(),
          const SizedBox(height: 5),
          _TitleHeader(title: exoplanet.plName),
          const SizedBox(height: 10),
          _InfoPlanet(exoplanet: exoplanet)
        ],
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {

  const _CardBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    const imageCard = 'assets/exoplanets-profile.png';

    return Container(
      width: 160,
      height: 160,
      child: const Image(
        image: AssetImage(imageCard),
        fit: BoxFit.cover,
      ),
    );
  }
}

class _TitleHeader extends StatelessWidget {

  final String title;

  const _TitleHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}

class _InfoPlanet extends StatelessWidget {

  final Exoplanet exoplanet;

  const _InfoPlanet({
    Key? key,
    required this.exoplanet
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 18),
      child: Column(
        children: [
          Text('Año Descubierto: ${exoplanet.discYear}', style: _styleTextInfo()),
          ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 240
            ),
            child: Text(
              'Metodo Descubrimiento: ${exoplanet.discoverymethod}',
              style: _styleTextInfo(),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 3,
            ),
          ),
          Text( exoplanet.plOrbper == null 
            ? 'Periodo de Orbita: Sin Registro'
            : 'Periodo de Orbita: ${exoplanet.plOrbper!.toInt()} días',
            style: _styleTextInfo()
          ),
          Text( exoplanet.plRade == null
            ? 'Radio: Sin registro'
            : 'Radio: ${ exoplanet.plRade } x Jupiter',
            style: _styleTextInfo()
          ),
          Text( exoplanet.plMassj == null
            ? 'Masa: Sin registro'
            : 'Masa: ${ exoplanet.plMassj } x Jupiter',
            style: _styleTextInfo()
          ),
        ],
      )
    );
  }

  TextStyle _styleTextInfo() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 18
    );
  }
}