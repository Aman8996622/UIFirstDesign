import 'package:flutter/material.dart';
import 'package:uifirstdesign/ui/styledata/TextStyle.dart';
import 'package:uifirstdesign/ui/widget/listitle.dart';
class Book extends StatefulWidget {
  Book({
    Key? key,
  }) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  List<String> image = [
 
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        // body: Center(child: Text("${widget.category}")),
        // ignore: prefer_const_literals_to_create_immutables
        body: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(
              height: 58,
            ),
            const Listt(
              leading: "assets/anime.png",
              title: "Stay trending",
              subtile: "Aman Shrma!",
              trailing: 'assets/button.png',
            ),
            const SizedBox(height: 24),
            Container(
                width: 320,
                height: 45,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.red,
                ),
                child: Text("empty space")
            ),
            const SizedBox(
              height: 20,
            ),
            ListTile(
                leading: Text("Trending Manga", style: TStyle().size18),
                trailing: Icon(Icons.more_horiz)),
            Container(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: image.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius: BorderRadius.circular(10)),
                          child: Image.asset(
                            image[index],
                            height: 100,
                            width: 100,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                   }
               ),
            ),
           ]
          ),
        ),
     );
  }
}
