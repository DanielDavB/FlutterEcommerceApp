import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tarea_flutter/services/allService.dart';

import 'package:tarea_flutter/widgets/navbar.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final shoesService = Provider.of<ShoesService>(context);

    return Scaffold(
      appBar: CustomAppBar(
        title: 'FW19',
        onPressed: () {
          Navigator.of(context).pushNamed('main');
        },
        onPressed2: () {
          Navigator.of(context).pushNamed('shoe');
        },
        onNotificationsPressed: () {},
        iconLeft: const Icon(Icons.arrow_back, color: Colors.black),
        iconRight: const Icon(Icons.crop_square, color: Colors.black),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 3.0,
          mainAxisSpacing: 3.0,
          childAspectRatio: 0.5, // Adjust this value for a 200px height
        ),
        itemCount: shoesService.allData.length,
        itemBuilder: (context, index) {
          return CustomCard(
            allData: shoesService.allData[index],
          );
        },
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  final allData;

  CustomCard({Key? key, required this.allData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: AspectRatio(
                aspectRatio:
                    1, // Use a 1:1 aspect ratio for the image container
                child: Image.network(
                  allData.pic,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    allData.name,
                    style: const TextStyle(fontFamily: 'Impact'),
                  ),
                  Text(
                    allData.price,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Impact',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
