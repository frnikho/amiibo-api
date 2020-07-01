import 'package:amiibo/models/amiibo.dart';
import 'package:flutter/material.dart';

class AboutAmiibo extends StatelessWidget {
  static String id = "about_amiibo_screen";

  final Image image;
  final String tag;
  final Amiibo amiibo;

  const AboutAmiibo({Key key, this.image, this.tag, this.amiibo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Container(
                  height: 200,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                  child: Hero(tag: tag, child: image)),
              Text("${amiibo.name}",
                  style: TextStyle(
                      fontFamily: "Mina",
                      fontSize: 28,
                      color: Colors.white,
                      fontWeight: FontWeight.w700)),
              Expanded(
                  child: Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      child: Row(
                        children: [
                          Text(amiibo.character, style: TextStyle(fontFamily: "Mina", fontSize: 24))
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(15),
                        topLeft: Radius.circular(15)),
                    color: Colors.white),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
