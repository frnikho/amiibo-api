import 'package:amiibo/models/amiibo.dart';
import 'package:amiibo/screens/about_amiibo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static String id = "home_screen";
  @override
  Widget build(BuildContext context) {
    return Consumer<AmiiboList>(
      builder: (context, data, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                expandedHeight: 200.0,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Text("Amiibo", style: TextStyle(fontFamily: "Mina", fontWeight: FontWeight.w700)),
                ),
              ),
              SliverGrid(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1.0
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  Amiibo amiibo = data.amiibo[index];
                  Image image = data.amiibo[index].image;
                  String tag = "amiiboImage$index";
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAmiibo(image: image, tag: tag, amiibo: amiibo)));
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Expanded(child: Hero(child: image, tag: tag)),
                            SizedBox(height: 20),
                            Text(data.amiibo[index].character, style: TextStyle(fontFamily: "Mina", fontSize: 14, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: data.amiibo.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}