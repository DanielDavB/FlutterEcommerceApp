import 'package:flutter/material.dart';
import 'package:tarea_flutter/widgets/navbar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: 'REPRESENT',
          onPressed: () {
            Navigator.of(context).pushNamed('shop');
          },
          onPressed2: () {
            Navigator.of(context).pushNamed('product');
          },
          onNotificationsPressed: () {},
          iconLeft: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          iconRight: const Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/image1.jpeg'),
                const SizedBox(height: 5),
                Image.asset('assets/Sampleimage2.png'),
                const SizedBox(height: 5),
              ]),
        ));
  }
}
