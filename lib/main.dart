import 'package:flutter/material.dart';
import 'package:uifirstdesign/ui/view/comiclist.dart';
import 'package:uifirstdesign/ui/view/comicpage.dart';
// import 'package:uifirstdesign/ui/view/comiclist.dart';
import 'package:uifirstdesign/ui/view/login.dart';
// import 'package:uifirstdesign/ui/view/login.dart';
// import 'package:uifirstdesign/screen/category.dart';

// import 'package:uifirstdesign/screen/formscreeen.dart';
//  import 'package:uifirstdesign/screen/demo.dart';
// import 'package:uifirstdesign/screen/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Comicpages(),
      );
  }
}
