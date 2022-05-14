import 'package:flutter/material.dart';

import 'package:exospace_app/theme/app_theme.dart';

class CardService extends StatelessWidget {

  final String imageBackground;
  final String title;
  final String body;

  const CardService({
    Key? key,
    required this.imageBackground,
    required this.title,
    required this.body
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric( vertical: 10, horizontal: 30 ),
      child: Container(
        width: 300,
        height: 300,
        decoration: _cardShape(),
        child: _CardHeader(
          imgBackground: imageBackground,
          titleHeader: title,
          bodyHeader: body,
        )
      ),
    );
  }

  BoxDecoration _cardShape() => BoxDecoration(
    color: AppTheme.colorCard,
    borderRadius: BorderRadius.circular(15),
  );
}

class _CardHeader extends StatelessWidget {

  final String imgBackground;
  final String titleHeader;
  final String bodyHeader;

  const _CardHeader({
    Key? key,
    required this.titleHeader,
    required this.bodyHeader,
    required this.imgBackground,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      color:Colors.transparent,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _CardBackground(imageCard: imgBackground),
          const SizedBox(height: 15),
          _TitleHeader(title: titleHeader),
          const SizedBox(height: 20),
          _BodyHeder(body: bodyHeader)
        ],
      ),
    );
  }
}

class _CardBackground extends StatelessWidget {
  const _CardBackground({
    Key? key,
    required this.imageCard,
  }) : super(key: key);

  final String imageCard;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      child: Image(
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
        padding: EdgeInsets.symmetric(horizontal: 10),
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

class _BodyHeder extends StatelessWidget {

  final String body;

  const _BodyHeder({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          body,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white
          ),
        )
      ),
    );
  }
}