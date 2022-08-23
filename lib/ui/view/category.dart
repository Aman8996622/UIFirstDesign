import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uifirstdesign/modals/gridmodal.dart';
import 'package:uifirstdesign/ui/styledata/TextStyle.dart';
// import 'package:uifirstdesign/ui/view/book.dart';
import 'package:uifirstdesign/ui/view/comiclist.dart';

import 'package:uifirstdesign/ui/view/form.dart';
import 'package:uifirstdesign/ui/widget/button.dart';

class Comic extends StatefulWidget {
  const Comic({Key? key}) : super(key: key);

  @override
  State<Comic> createState() => _ComicState();
}

class _ComicState extends State<Comic> {
  List<Choice> choices = const <Choice>[
    Choice(title: 'Action', image: "assets/Fire.png",),
    Choice(title: 'Romance', image: "assets/Heart.png"),
    Choice(title: 'Drama', image: "assets/Sneezing face.png"),
    Choice(title: 'Horror', image: "assets/face.png"),
    Choice(title: 'Fantasy', image: "assets/Unicorn.png"),
    Choice(title: 'Mistery', image: "assets/Camera.png"),
    Choice(title: 'Magic', image: "assets/Crystal ball.png"),
    Choice(title: 'Comedy', image: "assets/lau.png"),
    Choice(title: 'Daily life', image: "assets/Calendar.png"),
    Choice(title: 'Pyschology', image: "assets/Clock.png"),
    Choice(title: 'Adventure', image: "assets/Airplane.png"),
    Choice(title: 'Thriller', image: "assets/Cold face.png"),
  ];
  int a = -1;
  List<String> listSelect = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 78,
            ),
            child: Text("Let Us Know !", style: TStyle().size36),
          ),
          const SizedBox(height: 5),
          Padding(
            padding:
                const EdgeInsets.only(top: 5, left: 79, right: 78, bottom: 10),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "Choose your genre to find",
                    style: TStyle().categorytext,
                  ),
                  Text(
                    " favorite titles here!",
                    style: TStyle().categorytext,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemCount: choices.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    if (!listSelect.contains(choices[index].title.toString())) {
                      listSelect.add(choices[index].title.toString());
                    } else {
                      listSelect.remove(choices[index].title.toString());
                    }
                    print("list= ${listSelect}");
                    setState(() {
                      //enableMultiselection = true;
                    },
                   );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      width: 80,
                      height: 97,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(15),
                        color: //a != index
                            listSelect.contains(choices[index].title.toString())
                                ? const Color(0xFFA2B2FC)
                                : Colors.white,
                      ),
                      child: Center(
                        child: ListTile(
                          title: Image.asset(choices[index].image.toString()),
                          subtitle: Text(
                            choices[index].title.toString(),
                            overflow: TextOverflow.visible,
                            style: GoogleFonts.ubuntu(
                                fontSize: 10, color: Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
   
          Butt(
            text: 'Continue',
            colorBg: const Color(0Xff9D9D9D),
            colorText: Colors.white,
            ontap: () {

            },
            padding: const EdgeInsets.symmetric(
              horizontal: 100.0,
              vertical: 17.0,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) =>  Comiclist(),
               
                ),
              );
            },
            child: const Text(
              "Skip it Now",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
          )
        ],
      ),
    );
  }

 
}
