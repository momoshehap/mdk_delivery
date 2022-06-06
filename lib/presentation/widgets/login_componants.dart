import 'package:flutter/material.dart';

Future buildWrongAccountDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      titleTextStyle: TextStyle(
        fontSize: 17,
        fontFamily: "SegoeUI",
        color: Color(0xff0D4B75),
        fontWeight: FontWeight.bold,
      ),
      title: const Text('Wrong account'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Please enter your Number or Password correct",
            style: TextStyle(
              fontSize: 13,
              fontFamily: "SegoeUI",
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Ok',
            style: TextStyle(
              fontSize: 17,
              fontFamily: "SegoeUI",
              color: Color(0xff0D4B75),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

Future buildCheckInternetAlert(BuildContext context) {
  return showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text(
        'failed to connect',
        style: TextStyle(
          fontSize: 17,
          fontFamily: "SegoeUI",
          color: Color(0xff0D4B75),
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Some Thing Went Wrong , Please check your internet",
            style: TextStyle(
              fontSize: 13,
              fontFamily: "SegoeUI",
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Ok',
            style: TextStyle(
              fontSize: 17,
              fontFamily: "SegoeUI",
              color: Color(0xff0D4B75),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}
