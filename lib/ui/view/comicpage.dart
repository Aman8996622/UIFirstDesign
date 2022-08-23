import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uifirstdesign/ui/widget/listitle.dart';

class Comicpages extends StatefulWidget {
  const Comicpages({Key? key}) : super(key: key);

  @override
  State<Comicpages> createState() => _ComicpagesState();
}

class _ComicpagesState extends State<Comicpages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor:Colors.white,
          body:SafeArea(
          child: Column(
            children: [
            const SizedBox(height: 25,),
            Listt(
             leading: "assets/anime.png",
             title: "Aman Sharma",
             subtile: "Stay trending",
             trailing: "assets/button.png",
            ),
                        
           ]
         ),
        ),



    );
  }
}
