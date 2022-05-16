import 'package:flutter/material.dart';

import 'package:exospace_app/widgets/widgets.dart';
import 'package:exospace_app/models/models.dart';
import 'package:exospace_app/theme/app_theme.dart';

class ListNews extends StatelessWidget {

  final List<Article> noticias;

  const ListNews({
    Key? key,
    required this.noticias
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
        const StyleBackground(),
        const TitleOfScreen(title:'Noticias'),
        _NewsList(noticias: noticias)
      ])
    );
  }
}

class _NewsList extends StatelessWidget {
  const _NewsList({
    Key? key,
    required this.noticias,
  }) : super(key: key);

  final List<Article> noticias;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 180),
      width: double.infinity,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: noticias.length,
        itemBuilder: (BuildContext context, int index) {
          return _Noticia(
            index: index, noticia: noticias[index]
          );
        }
      ),
    );
  }
}

class _Noticia extends StatelessWidget {

  final Article noticia;
  final int index;

  const _Noticia({
    Key? key,
    required this.noticia,
    required this.index
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CardTopBar(noticia: noticia, index: index),
        _CardTitle( noticia: noticia ),
        _CardImage( noticia: noticia ),
        _CardBody( noticia: noticia ),
        const SizedBox(height: 10),
        const Divider(),
        _CardButtons(),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _CardTopBar extends StatelessWidget {

  final Article noticia;
  final int index;

  const _CardTopBar({
    Key? key,
    required this.noticia,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}. ', style: _styleText()),
          Text('${noticia.source.name}. ', style: _styleText()),
        ],
      ),
    );
  }

  TextStyle _styleText() {
    return const  TextStyle(
      color: Colors.white
    );
  }
}

class _CardTitle extends StatelessWidget {

  final Article noticia;

  const _CardTitle({
    Key? key,
    required this.noticia
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title, style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.white
      )),
    );
  }
}

class _CardImage extends StatelessWidget {

  final Article noticia;

  const _CardImage({
    Key? key,
    required this.noticia
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50)
        ),
        child: Container(
          child: noticia.urlToImage == null
            ? const Image(image: AssetImage('assets/no-image.png'))
            : FadeInImage(
                image: NetworkImage(noticia.urlToImage!),
                placeholder: const AssetImage('assets/loader.gif'),
              ),
        ),
      ),
    );
  }
}

class _CardBody extends StatelessWidget {

  final Article noticia;

  const _CardBody({
    Key? key,
    required this.noticia
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10) ,
      child: Text( noticia.description != null 
        ? noticia.description!
        : '',
        style: TextStyle( color: Colors.white ),
      ),
    );
  }
}

class _CardButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {},
            fillColor: AppTheme.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Icon(Icons.star_border, color: Colors.white,),
          ),
          
          const SizedBox( width: 10 ),

          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20)
            ),
            child: const Icon(Icons.more, color: Colors.white,),
          ),
        ],
      ),
    );
  }
}