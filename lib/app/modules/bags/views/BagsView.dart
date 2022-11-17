import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testflutter/app/routes/app_Routes.dart';

import '../../../models/Product.dart';
import '../../../widgets/Button.dart';
import '../../home/controllers/HomeControllers.dart';

class BagsView extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final products = ref.watch(productsDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("BAGS", style: TextStyle(color: Colors.black38)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black38),
        ),
      ),
      body: products.when(
          data: (products) {
            List<Product> productList = products.map((e) => e).toList();
            return Stack(children: <Widget>[
              Column(
                children: [
                  Container(
                      height: 0.7 * MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: productList.length,
                          itemBuilder: (context, index) {
                            final checkedList = StateNotifierProvider<Selected,
                                    List>(
                                (ref) => Selected(
                                    List.filled(productList.length, false)));
                            final qteList =
                                StateNotifierProvider<Selected, List>((ref) =>
                                    Selected(
                                        List.filled(productList.length, 1)));
                            return Column(children: [
                              SingleChildScrollView(
                                  physics: ScrollPhysics(),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10, left: 5, right: 5),
                                      child: Container(
                                        height: 130,
                                        child: Card(
                                          child: ClipRRect(
                                            //   borderRadius: BorderRadius.all(Radius.circular(0.0)),
                                            child: AspectRatio(
                                              aspectRatio: 3.5,
                                              child: Row(
                                                children: <Widget>[
                                                  Consumer(
                                                    builder: (BuildContext
                                                                context,
                                                            WidgetRef watch,
                                                            Widget? child) =>
                                                        Checkbox(
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      activeColor: Colors.black,
                                                      value: watch.watch(
                                                          checkedList)[index],
                                                      onChanged: (bool? value) {
                                                        watch
                                                            .read(checkedList
                                                                .notifier)
                                                            .toggle(index);
                                                      },
                                                    ),
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width /
                                                            4,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      child: Image.network(
                                                        productList[index]
                                                            .image
                                                            .toString(),
                                                        fit: BoxFit.contain,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      child: GestureDetector(
                                                    child:
                                                        SingleChildScrollView(
                                                      physics: ScrollPhysics(),
                                                      child: Container(
                                                        padding: EdgeInsets.all(
                                                            MediaQuery.of(context)
                                                                        .size
                                                                        .width >=
                                                                    360
                                                                ? 10
                                                                : 8),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: <Widget>[
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2.0),
                                                              child: Text(
                                                                " \$ " +
                                                                    productList[
                                                                            index]
                                                                        .price
                                                                        .toString(),
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(2.0),
                                                              child: Text(
                                                                productList[
                                                                        index]
                                                                    .title
                                                                    .toString(),
                                                                maxLines: 2,
                                                                textAlign:
                                                                    TextAlign
                                                                        .left,
                                                              ),
                                                            ),
                                                            Container(
                                                              child: Consumer(
                                                                builder: (BuildContext context,
                                                                        WidgetRef
                                                                            watch,
                                                                        Widget?
                                                                            child) =>
                                                                    Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Card(
                                                                        child:
                                                                            IconButton(
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .add_circle,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                      onPressed:
                                                                          () {
                                                                        watch
                                                                            .read(qteList.notifier)
                                                                            .add(index);
                                                                      },
                                                                    )),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Text(watch
                                                                        .watch(qteList)[
                                                                            index]
                                                                        .toString()),
                                                                    SizedBox(
                                                                      width: 5,
                                                                    ),
                                                                    Container(
                                                                        padding: EdgeInsets.only(
                                                                            bottom:
                                                                                20),
                                                                        child:
                                                                            IconButton(
                                                                          icon:
                                                                              Icon(
                                                                            Icons.minimize,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            watch.read(qteList.notifier).minimize(index);
                                                                          },
                                                                        )),
                                                                    SizedBox(
                                                                      width: 20,
                                                                    ),
                                                                    Text(
                                                                      "Size :",
                                                                      style: TextStyle(
                                                                          color:
                                                                              Colors.black38),
                                                                    ),
                                                                    SizedBox(
                                                                      width: 0,
                                                                    ),
                                                                    Text("XL"),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ))),
                            ]);
                            /*            PaymentMethodComponent(),*/
                          })),
                  Container(
                      color: Colors.white,
                      height: 0.1 * MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.save),
                              Text(
                                "USE YOUR PROMO CODE",
                              ),
                              Icon(Icons.arrow_forward_ios),
                            ],
                          ),
                        ),
                      )),
                  Container(
                    color: Colors.white,
                    height: 0.1 * MediaQuery.of(context).size.height,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Total Payement : \n \$ 198.00",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        Container(
                          width: 120,
                          child: Button(
                            backgroundColor: Colors.black,
                            titleColor: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            buttonText: "CHECKOUT",
                            onPressed: () {
                              NavigationServices(context).gotoReceiptView();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ]);
          },
          error: (error, succes) => Text(error.toString()),
          loading: () => Center(child: CircularProgressIndicator())),
    );
  }
}

class Selected extends StateNotifier<List> {
  Selected(List initial) : super(initial);

  void toggle(index) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (i == index) !state[i] else state[i],
    ];
  }

  void minimize(index) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (i == index) state[i] - 1 else state[i],
    ];
  }

  void add(index) {
    state = [
      for (var i = 0; i < state.length; i++)
        if (i == index) state[i] + 1 else state[i],
    ];
  }
}
