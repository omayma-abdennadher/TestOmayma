import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testflutter/app/models/Product.dart';
import 'package:testflutter/app/modules/home/controllers/HomeControllers.dart';

import '../../../routes/app_Routes.dart';
import '../../../widgets/Button.dart';
import '../../../widgets/ButtonIcon.dart';

class HomeView extends ConsumerWidget {
  final curentIndexbottomBar = StateProvider<int>((ref) => 0);
  final curentIndexMenuList = StateProvider<int>((ref) => 0);
  final isMan = StateProvider<bool>((ref) => true);

  @override
  Widget build(BuildContext context, ref) {
    final products = ref.watch(productsDataProvider);
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: Consumer(
              builder: (BuildContext context, WidgetRef watch, Widget? child) =>
                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    color: watch.watch(isMan) ? Colors.black : Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        watch.read(isMan.notifier).state = true;
                      },
                      child: Text(
                        'MAN',
                        style: TextStyle(
                            color: watch.watch(isMan)
                                ? Colors.white
                                : Colors.black38),
                      ),
                    ),
                    elevation: 2,
                  ),
                  Card(
                    color: watch.watch(isMan) ? Colors.white : Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      onPressed: () {
                        watch.read(isMan.notifier).state = false;
                      },
                      child: Text(
                        'WOMAN',
                        style: TextStyle(
                            color: watch.watch(isMan)
                                ? Colors.black38
                                : Colors.white),
                      ),
                    ),
                    elevation: 2,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.black38,
                    size: 35,
                  ),
                ),
              )
            ],
            leading: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: Colors.black38),
              ),
            )),
        body: products.when(
            data: (products) {
              List<Product> productList = products.map((e) => e).toList();
              return Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                              'https://picsum.photos/250?image=1',
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 4,
                              fit: BoxFit.cover),
                        ),
                      ),
                      Positioned(
                          top: 60,
                          left: 40,
                          child: Text(
                            "BRACE YOURSELF ! \n GET YOURS !",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                      Positioned(
                          bottom: 40,
                          left: 40,
                          child: Container(
                            height: 60,
                            width: 150,
                            child: ButtonIcon(
                              backgroundColor: Colors.orange[800],
                              titleColor: Colors.white,
                              fontSize: 18,
                              buttonText: "SHOP NOW",
                            ),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                      height: 50,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 4,
                          );
                        },
                        itemCount: menuList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Consumer(
                            builder: (BuildContext context, WidgetRef watch,
                                    Widget? child) =>
                                GestureDetector(
                                    onTap: () {
                                      watch
                                          .read(curentIndexMenuList.notifier)
                                          .state = index;
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      color: watch.watch(curentIndexMenuList) ==
                                              index
                                          ? Colors.black
                                          : Colors.white,
                                      elevation: 3,
                                      child: Center(
                                          child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          menuList[index],
                                          style: TextStyle(
                                            color: watch.watch(
                                                        curentIndexMenuList) ==
                                                    index
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                        ),
                                      )),
                                    )),
                          );
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            crossAxisCount: 2,
                          ),
                          shrinkWrap: false,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return Stack(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: GestureDetector(
                                        onTap: () {
                                          NavigationServices(context)
                                              .gotoDetails(
                                                  productList[index].id);
                                        },
                                        child: Image.network(productList[index]
                                            .image
                                            .toString()))),
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Container(
                                          height: 40,
                                          width: 60,
                                          child: Button(
                                            backgroundColor: Colors.orange[800],
                                            titleColor: Colors.white,
                                            fontSize: 12,
                                            buttonText: "NEW",
                                          ),
                                        ))),
                                Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 40.0, left: 20.0),
                                      child: Text(
                                          '\$ ' +
                                              productList[index]
                                                  .price
                                                  .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          )),
                                    )),
                                Container(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          bottom: 20.0, left: 20.0),
                                      child: Text(
                                          productList[index]
                                              .category
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    )),
                              ],
                            );
                          }),
                    ),
                  )
                ],
              );
            },
            error: (error, succes) => Text(error.toString()),
            loading: () => Center(child: CircularProgressIndicator())),
        bottomNavigationBar: Consumer(
            builder: (context, watch, child) => BottomNavigationBar(
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.black38,
                  currentIndex: watch.watch(curentIndexbottomBar),
                  onTap: (int newIndex) {
                    watch.read(curentIndexbottomBar.notifier).state = newIndex;
                  },
                  items: [
                    BottomNavigationBarItem(
                      label: "",
                      icon: Icon(Icons.home_repair_service_sharp),
                    ),
                    BottomNavigationBarItem(
                      label: "",
                      icon: Icon(Icons.mail_outline),
                    ),
                    BottomNavigationBarItem(
                      label: "",
                      icon: Icon(Icons.wallet_giftcard),
                    ),
                    BottomNavigationBarItem(
                        icon: Container(
                            height: 30.0,
                            width: 30,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      "https://d2qp0siotla746.cloudfront.net/img/use-cases/profile-picture/template_3.jpg"),
                                  fit: BoxFit.cover,
                                ))),
                        label: ""),
                  ],
                )));
  }

  List<String> menuList = [
    "NEW IN",
    "CLOTHING",
    "NEW IN",
    "BOSS & NEW",
    "NEW IN",
    "CLOTHING"
  ];
}
