import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_state.dart';

Widget buildNotifyCard() {
  return BlocBuilder<OrderCubit, OrderStates>(builder: (context, state) {
    var cubit = OrderCubit.get(context);
    return InkWell(
      onTap: () {
        cubit.showClickedNotify();
      },
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Contact changed his number",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "SegoeUI",
                  fontWeight: FontWeight.bold,
                  color: Color(0xff707070),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                "2021-03-22 12:30:44",
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: "SegoeUI",
                  color: Color(0xffB8B7B7),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {
              cubit.showClickedNotify();
            },
            icon: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  });
}

Widget notificationBody() {
  return BlocBuilder<OrderCubit, OrderStates>(builder: (context, state) {
    var cubit = OrderCubit.get(context);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                IconButton(
                  onPressed: () {
                    cubit.showClickedNotify();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Contact changed his number",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "SegoeUI",
                        fontWeight: FontWeight.bold,
                        color: Color(0xff707070),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      "2021-03-22 12:30:44",
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: "SegoeUI",
                        color: Color(0xffB8B7B7),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ]),
              SizedBox(
                height: 30,
              ),
              Text(
                "body Contact changed his number Contact changed his number Contact changed his number",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "SegoeUI",
                  color: Color(0xff707070),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  });
}
