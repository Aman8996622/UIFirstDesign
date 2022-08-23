import 'package:flutter/material.dart';

class Listt extends StatefulWidget {
  final String ? title;
  final String leading;
  final String ? subtile;
  final String ? trailing;
  final Color? colorBg;
  final Color? colorText;
  final Text? t;
  final Widget? icon;
   
  // final VoidCallback ontap;
  // final Widget Circle= CircleAvatar(

  const Listt({
    Key? key,
    this.title,
    required this.leading,
    this.subtile,
    this.t,
    this.trailing,
    this.colorBg,
    this.colorText,
    this.icon,
   }
    ) : super(key: key);

  @override
  State<Listt> createState() => _ListtState();
}

class _ListtState extends State<Listt> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: widget.t ??
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(widget.leading),
            ),
        title: Text(widget.title.toString()),
        subtitle: Text(widget.subtile.toString()),
        trailing: widget.icon??InkWell(
          child: Image.asset(widget.trailing.toString()),
        )
       );
  }

}
