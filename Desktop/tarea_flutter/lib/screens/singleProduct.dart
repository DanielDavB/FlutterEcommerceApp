import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tarea_flutter/widgets/navbar.dart';

class ProductSingle extends StatefulWidget {
  const ProductSingle({Key? key}) : super(key: key);

  @override
  _ProductSingleState createState() => _ProductSingleState();
}

class _ProductSingleState extends State<ProductSingle> {
  Image _currentImage =
      Image.asset('assets/sneaker.png', fit: BoxFit.cover); // Initial image

  void changeImage(String imagePath) {
    setState(() {
      _currentImage = Image.asset(imagePath);
    });
  }

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
          BlackButton(),
        ],
      ),
    );
  }

  Image fullscreenImage() {
    return _currentImage;
  }

  Container buildFullscreenContainer(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      color: const Color.fromARGB(255, 255, 255, 255),
      child: fullscreenImage(),
    );
  }

  Widget leftSection() {
    return SizedBox(
      width: 30,
      child: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment(0, 0),
              child: ListWheelScrollView(
                itemExtent: 50,
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
          Expanded(
            flex: 1,
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
                    CircleWidget(Colors.black, () {
                      changeImage('assets/sneaker.png');
                    }),
                    CircleWidget(const Color.fromARGB(255, 197, 162, 59), () {
                      changeImage('assets/sample.jpg');
                    }),
                    CircleWidget(Colors.black, () {
                      changeImage('assets/sample2.jpg');
                    }),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
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
                padding: EdgeInsets.all(20.0),
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

  Widget BlackButton() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10.0),
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
  final Function onTap;

  CircleWidget(this.color, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 30,
        height: 30,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
    );
  }
}
