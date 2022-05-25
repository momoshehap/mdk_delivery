import 'package:flutter/material.dart';

Widget buildsettingcomponant(BuildContext context,
    {required String imgname, required String title, String? screen}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () {
        if (screen != null) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(screen, (Route<dynamic> route) => false);
        }
      },
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(
                2.0,
                2.0,
              ), //Offset
              blurRadius: 5.0,
            ), //BoxShadow
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ImageIcon(
              AssetImage("assets/icons/$imgname.png"),
              color: const Color(0xff004067),
              size: 60,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontFamily: "SegoeUI",
                color: Color(0xffB2B1B1),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
