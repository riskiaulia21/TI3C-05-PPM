import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class StaticBooks {
  static const String cdn = "https://cdn.syncfusion.com/";
  static const String path = "content/images/downloads/ebook/ebook-cover/";
  static const List<String> covers = [
    "visual-studio-for-mac-succinctly-v1.png",
    "angular-testing-succinctly.png",
    "azure-devops-succinctly.png",
    "asp-net-core-3-1-succinctly.png",
    "angulardart_succinctly.png"
  ];
}

class Succinctly extends StatelessWidget {
  List<Widget> createGrid() {
    List<Widget> imgs = [];
    Widget cImage;
    for (int i = 0; i <= StaticBooks.covers.length - 1; i++) {
      cImage = Container(
          child: Image.network(
              StaticBooks.cdn + StaticBooks.path + StaticBooks.covers[i]));
      imgs.add(cImage);
    }
    return imgs;
  }

  @override
  Widget build(BuildContext context) {
    final sizeX = MediaQuery.of(context).size.width;
    final sizeY = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text('Succinctly Books'),
        ),
        body: Container(
            width: sizeX,
            height: sizeY,
            child: GridView.count(
              children: createGrid(),
              padding: EdgeInsets.all(10),
              crossAxisSpacing: 4.5,
              mainAxisSpacing: 5.5,
              crossAxisCount: 2,
              scrollDirection: Axis.vertical,
            )));
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Succinctly(),
      theme: ThemeData(
        primaryColor: Colors.indigo,
        hintColor: Colors.amber,
        brightness: Brightness.dark,
      ),
    );
  }
}
