import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildSearchbar() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: SizedBox(
      height: 48,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(24.0),
          ),
          filled: true,
          hintText: "Search customers",
          prefixIcon: const Icon(
            Icons.search,
          ),
        ),
      ),
    ),
  );
}

Widget buildCustomerCard() {
  return BlocBuilder<OrderCubit, OrderStates>(builder: (context, state) {
    var cubit = OrderCubit.get(context);
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 10.0),
            child: Container(
              width: double.infinity,
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Doctor",
                          style: TextStyle(
                              fontSize: 15,
                              fontFamily: "SegoeUI",
                              color: Color(0xff004067),
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 15,
                            width: 2,
                            color: Color(0xff707070),
                          ),
                        ),
                        Text(
                          "Dr. Ali Salha",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xffB2B1B1),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            cubit.navigateTo(-3.823216, -38.481700);
                          },
                          child: ImageIcon(
                            AssetImage("assets/icons/location.png"),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: [
                        ImageIcon(
                          AssetImage("assets/icons/number.png"),
                          color: Color(0xff004067),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        TextButton(
                          onPressed: () {
                            cubit.makingPhoneCall("+961 1 255 863");
                          },
                          child: Text(
                            "+961 1 255 863",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: "SegoeUI",
                              color: Color(0xffB2B1B1),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Hamra - Clemenceau street -Clemenceau medicalcenter-Bloc A - 15th floor - Clinic 220",
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "SegoeUI",
                        color: Color(0xffB2B1B1),
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  });
}
