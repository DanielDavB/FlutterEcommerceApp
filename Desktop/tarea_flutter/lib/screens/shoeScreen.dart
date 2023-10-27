import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarea_flutter/widgets/navbar.dart';

class ProductSingle extends StatelessWidget {
  const ProductSingle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "REPRESENT",
          onNotificationsPressed: () {},
          iconLeft: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushNamed('main');
          },
          onPressed2: () {
            Navigator.of(context).pushNamed('shop');
          },
          iconRight: const Icon(
            Icons.favorite_border_outlined,
            color: Colors.black,
          )),
      body: Column(
        children: [
          buildFullscreenContainer(context),
          TwoSectionContainer(),
          BlackButton(), // Add the black button
        ],
      ),
    );
  }

  Image fullscreenImage() {
    return Image.asset(
      'assets/sneaker.png', // Adjust the path as needed
      fit: BoxFit.cover,
    );
  }

  Container buildFullscreenContainer(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      color: Colors.blue,
      child: fullscreenImage(),
    );
  }

  Widget leftSection() {
    return SizedBox(
      width: 30,
      child: Column(
        children: [
          // First vertical section with ListWheelScrollView
          Expanded(
            child: Align(
              alignment: Alignment(0, 0), // Center the child vertically
              child: ListWheelScrollView(
                itemExtent: 50, // Adjust this value as needed
                useMagnifier: true,
                magnification: 1.3,
                children: List<Widget>.generate(50, (index) {
                  return Center(
                    child: Text(
                      '$index',
                      style: const TextStyle(fontSize: 16),
                    ),
                  );
                }),
              ),
            ),
          ),
          // Second vertical section
          Expanded(
            flex: 1, // Adjust the flex value to make it larger
            child: Container(),
          ),
        ],
      ),
    );
  }

  Expanded rightSection() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "COLOR",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                    CircleWidget(Colors.black),
                    CircleWidget(const Color.fromARGB(255, 197, 162, 59)),
                    CircleWidget(Colors.black),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
              height: 20), // Add space between the color section and size text
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 14,
                ),
                Text(
                  "SIZE",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'fightt3_',
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(20.0), // Add padding to the text
                child: SingleChildScrollView(
                  child: Text(
                    "The SprintFlex X1 running shoes are a perfect blend of style, comfort, and performance. These shoes are meticulously designed for the modern athlete who demands the best in both fashion and functionality.",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        height: 2.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget TwoSectionContainer() {
    return Expanded(
      child: Row(
        children: [
          leftSection(),
          rightSection(),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BlackButton() {
    return Container(
      width: double.infinity, // Takes the full width of the screen
      height: 50, // Set the height to 20
      margin: const EdgeInsets.all(10.0), // Add margin
      decoration: BoxDecoration(
        color: Colors.black, // Black background color
        borderRadius: BorderRadius.circular(10.0), // Add border radius
      ),
      child: const Center(
        child: Text(
          "100 USD",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}

class CircleWidget extends StatelessWidget {
  final Color color;

  CircleWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30, // Adjust the size of the circles as needed
      height: 30,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
