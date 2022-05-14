import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:exospace_app/theme/app_theme.dart';
import 'package:exospace_app/services/services.dart';
import 'package:exospace_app/widgets/widgets.dart';
import 'package:exospace_app/models/models.dart';

class PictureDayScreen extends StatelessWidget {
   
  const PictureDayScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final pictureDayService = Provider.of<PictureDayService>(context);

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const StyleBackground(),
          const TitleOfScreen(title:'Imagen Astronómica del día'),
          _PictureWidget( pictureService: pictureDayService ),
          _BodyPictureWidget( pictureService: pictureDayService )
        ],
      ),
    );
  }
}

class _PictureWidget extends StatelessWidget {

  final PictureDayService pictureService;

  const _PictureWidget({
    Key? key,
    required this.pictureService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: pictureService.getPictureDay(),
      builder: ( _, AsyncSnapshot<PictureDay> snapshot ) {
        if ( !snapshot.hasData || snapshot.data == null ) {
          return Container(
            margin: const EdgeInsets.only(top: 180),
            width: double.infinity,
            height: 185,
            child: const Center(
              child: CircularProgressIndicator(),
            ),  
          );
        }
        final pictureDay = snapshot.data!;

        return Padding(
          padding: const EdgeInsets.symmetric( horizontal: 30 ),
          child: Container(
            margin: const EdgeInsets.only(top: 185),
            width: double.infinity,
            height: 300,
            decoration: _cardShape(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: FadeInImage(
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                placeholder: const AssetImage('assets/loader.gif'),
                image: NetworkImage(pictureDay.url)
              ),
            ),
          ),
        );
      }
    );
  }

  BoxDecoration _cardShape() => BoxDecoration(
    color: Colors.transparent,
    borderRadius: BorderRadius.circular(15),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0, 5)
      )
    ]
  );
}

class _BodyPictureWidget extends StatelessWidget {

  final PictureDayService pictureService;

  const _BodyPictureWidget({
    Key? key,
    required this.pictureService,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: pictureService.getPictureDay(),
      builder: (_, AsyncSnapshot<PictureDay> snapshot) {

        if( !snapshot.hasData || snapshot.data == null) {
          return Container(
            margin: const EdgeInsets.only(top: 500),
            width: double.infinity,
            height: 185,
            child: const Center(
              child: CircularProgressIndicator(),
            ),  
          );
        }

        final pictureDay = snapshot.data!;

        return Container(
          margin: const EdgeInsets.only(top: 500, left:20, right:20,),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          width: double.infinity,
          decoration: _cardShape(),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Text('Titulo: ${pictureDay.title}', style: _styleText()),
                const SizedBox(height: 10),
                Text(
                  'Fecha: ${pictureDay.date.day}/${pictureDay.date.month}/${pictureDay.date.year}',
                  style: _styleText()
                ),
                const SizedBox(height: 10),
                Text(
                  'Explicación: ${pictureDay.explanation}',
                  style: _styleText(),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }

  TextStyle _styleText() => const TextStyle(
    color: Colors.white
  );

  BoxDecoration _cardShape() => BoxDecoration(
    color: AppTheme.colorCard,
    borderRadius: BorderRadius.circular(15),
    boxShadow: const [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0, 5)
      )
    ]
  );
}
