import 'package:flutter/material.dart';
import 'package:exospace_app/models/models.dart';

class CardImage extends StatelessWidget {

  final Photo photo;

  const CardImage({
    Key? key,
    required this.photo
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Hero(
      tag: photo.id,
      child: ClipRRect(
        borderRadius: BorderRadius.circular( 10 ),
        child: FadeInImage(
          image: NetworkImage(photo.imgSrc),
          placeholder: const AssetImage('assets/loader.gif'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}