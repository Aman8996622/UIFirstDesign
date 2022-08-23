import 'package:flutter/material.dart';


class Butt extends StatelessWidget {
  final String? image;
  final String text;
  final EdgeInsets? padding;
  final Color? colorBg;
  final Color? colorText;
  final VoidCallback ontap;
  

  const Butt({
    Key? key,
    required this.text,
    required this.ontap,
   
    this.image,
    this.padding,
    this.colorBg,
    this.colorText,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          // ignore: prefer_const_literals_to_create_immutables
          boxShadow: [
            const BoxShadow(
              blurRadius: 0.1,
              blurStyle: BlurStyle.solid,
              color: Color(0xffb3b3b3),
            ),
          ],
          borderRadius: BorderRadius.circular(25.0),
          color: colorBg ?? const Color(0XffFFFFFF),
        ),
        /*shape: RoundedRectangleBorder(
          side: BorderSide.lerp(a:BorderRadiusDirectional.all,)
          borderRadius: BorderRadius.circular(25.0),
        ),*/
        //margin: const EdgeInsets.only(top:30.0),
        child: Padding(
          padding: padding ??
              const EdgeInsets.symmetric(
                horizontal: 36.0,
                vertical: 5.0,
              ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              image == null
                  ? Container()
                  : Image.asset(
                      image!,
                      height: 29,
                      width: 28,
                    ),
              const SizedBox(
                width: 15.0,
              ),
              Text(
               text
              
              ),
            ],
          ),
        ),
      ),
    );
  }
}
