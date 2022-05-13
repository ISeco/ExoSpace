import 'package:flutter/material.dart';

import 'package:exospace_app/widgets/widgets.dart';

class ListServicesScreen extends StatelessWidget {
  const ListServicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: const [
          StyleBackground(),
          TitleOfScreen(title:'ExoSpace'),
          _ContainerServices()
        ],
      ),
    );
  }
}

class _ContainerServices extends StatelessWidget {
  const _ContainerServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: double.infinity,
      margin: const EdgeInsets.only(top: 180),
      decoration: _styleBoxDecoration(),
      child: const ListCardServices()
    );
  }

  BoxDecoration _styleBoxDecoration() {
    return const BoxDecoration(
      color: Colors.transparent,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )
    );
  }
}