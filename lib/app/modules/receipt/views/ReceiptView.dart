import 'package:flutter/material.dart';

import '../../../widgets/ButtonIcon.dart';
import '../../../widgets/Button.dart';

class ReceiptView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("RECEIPT", style: TextStyle(color: Colors.black38)),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.black38),
          ),
        ),
        body: Stack(children: <Widget>[
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                alignment: Alignment.center, // where to position the child
                child: Container(
                  width: 200,
                  height: 100,
                  child: Button(
                      backgroundColor: Colors.pink[200],
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      titleColor: Colors.black,
                      buttonText: "Klarna."),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("SUBTOTAL : "),
                    Text("\$ 300.00"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("SHIPEMENT SERVICE : "),
                    Text("\$ 02.15"),
                  ],
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(left: 40, right: 40, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("DISCOUNT : "),
                      Text("- \$ 20.00", style: TextStyle(color: Colors.red)),
                    ],
                  )),
              Divider(
                color: Colors.black,
              ),
              Padding(
                  padding: const EdgeInsets.all(40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("TOTAL PAYEMENT : "),
                      Text("\$ 178.15",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold)),
                    ],
                  )),
            ],
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              height: 70,
              child: ButtonIcon(
                  backgroundColor: Colors.black,
                  titleColor: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  buttonText: "PAY NOW."),
            ),
          )
        ]));
  }
}
