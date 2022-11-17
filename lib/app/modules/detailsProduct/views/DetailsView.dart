import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../models/Product.dart';
import '../../../routes/app_Routes.dart';
import '../../../widgets/ButtonIcon.dart';
import '../../../widgets/Button.dart';
import '../controllers/DetailsControllers.dart';

class DetailsView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final product = ref.watch(productDataProvider);
    return Scaffold(
      body: product.when(
          data: (product) {
            return Stack(children: <Widget>[
              Column(
                children: [
                  Stack(children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      child: Carousel(
                        images: [
                          for (var i = 0; i < 4; i++)
                            Image.network(product.image.toString(),
                                fit: BoxFit.fitWidth),
                        ],
                        autoplay: true,
                        autoplayDuration: const Duration(seconds: 5),
                        showIndicator: false,
                      ),
                    ),
                    Positioned(
                        bottom: 60,
                        left: 10,
                        right: 10,
                        child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            color: Colors.white70,
                            child: Container(
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 100,
                                      child: Button(
                                          backgroundColor: Colors.pink[200],
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          titleColor: Colors.black,
                                          buttonText: "Klarna."),
                                    ),
                                    Text("free payements of \$ 49.50 "),
                                    Text("Learn more"),
                                  ],
                                )))),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 20),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back, color: Colors.white70),
                      ),
                    ),
                  ]),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, bottom: 20, top: 20),
                    child: Row(
                      children: [
                        Text(
                          "\$" + product.price.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        Text(
                          product.category.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.orange,
                            elevation: 3,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "NEW",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.black,
                            elevation: 3,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "BOSS X FREDDIE MERCURY",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Colors.purpleAccent[200],
                            elevation: 3,
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "REGULAR FREQUANCE",
                                style: TextStyle(color: Colors.white),
                              ),
                            )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, bottom: 20),
                        child: Text(
                          "DETAIL",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      product.description.toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Container(
                  height: 70,
                  child: ButtonIcon(
                    icon: Icons.shopping_bag_outlined,
                    backgroundColor: Colors.black,
                    titleColor: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    buttonText: "ADD TO SHOPING BAG.",
                    onPressed: () {
                      NavigationServices(context).gotoBags();
                    },
                  ),
                ),
              )
            ]);
          },
          error: (error, succes) => Text(error.toString()),
          loading: () => Center(child: CircularProgressIndicator())),
    );
  }
}
