import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_state.dart';

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

Widget buildCustomerCard(BuildContext context) {
  return InkWell(
    onTap: () {
      buildCustomerDialog(context);
    },
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
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(
                children: const [
                  Text(
                    "#22548",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "SegoeUI",
                      color: Color(0xff004067),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  ImageIcon(
                    AssetImage("assets/icons/Collected.png"),
                    color: Colors.green,
                  ),
                  Text(
                    "Collected",
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 13,
                      fontFamily: "SegoeUI",
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
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
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'Hamra - ',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "SegoeUI",
                              color: Color(0xffB2B1B1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text:
                                "Clemenceau street -Clemenceau medicalcenter-Bloc A - 15th floor - Clinic 220",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: "SegoeUI",
                              color: Color(0xffB2B1B1),
                            ),
                          )
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2,
              ),
              Row(
                children: [
                  Text(
                    " With collection",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    ),
  );
}

Future<dynamic> buildCustomerDialog(cnxt) {
  return showDialog(
    barrierDismissible: false,
    context: cnxt,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white.withOpacity(0.0),
        contentPadding: const EdgeInsets.all(0.0),
        content: SizedBox(
          height: 450,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  height: 415,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: BlocProvider(
                      create: (context) => OrderCubit(),
                      child: BlocBuilder<OrderCubit, OrderStates>(
                          builder: (context, state) {
                        var cubit = OrderCubit.get(context);

                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: const [
                                  Text(
                                    "#22548",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "SegoeUI",
                                      color: Color(0xff004067),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  ImageIcon(
                                    AssetImage("assets/icons/Collected.png"),
                                    color: Colors.green,
                                  ),
                                  Text(
                                    "Collected",
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 13,
                                      fontFamily: "SegoeUI",
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
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
                                  ),
                                ],
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
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Expanded(
                                    child: Text.rich(
                                      TextSpan(
                                        children: <InlineSpan>[
                                          TextSpan(
                                            text: 'Hamra - ',
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "SegoeUI",
                                              color: Color(0xffB2B1B1),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text:
                                                "Clemenceau street -Clemenceau medicalcenter-Bloc A - 15th floor - Clinic 220",
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: "SegoeUI",
                                              color: Color(0xffB2B1B1),
                                            ),
                                          )
                                        ],
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Pick up ",
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "SegoeUI",
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    " With collection",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              const Text(
                                "Notes",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  color: Color(0xff004067),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "please leave the packages at the reciption with mrs . Nayla Saade",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: "SegoeUI",
                                  color: Color(0xff004067),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Image.asset("assets/icons/mic.png"),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                      "assets/icons/play_voice.png",
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  ImageIcon(
                                    AssetImage("assets/icons/location.png"),
                                    color: Color(0xff004067),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      cubit.navigateTo(-3.823216, -38.481700);
                                    },
                                    child: Text("Show on map"),
                                  )
                                ],
                              ),
                              PopupMenuButton(
                                elevation: 16,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                                itemBuilder: (context) {
                                  return [
                                    'Pinding',
                                    'Picked up',
                                    'collected',
                                    'Delivered',
                                  ]
                                      .map(
                                        (value) => PopupMenuItem(
                                          value: value,
                                          child: Text(value),
                                        ),
                                      )
                                      .toList();
                                },
                                onSelected: (String? value) {
                                  cubit.changeDropDown(value);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.brown),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          cubit.dropDownValue,
                                          style: TextStyle(
                                            fontSize: 13,
                                            fontFamily: "SegoeUI",
                                            color: Color(0xff004067),
                                          ),
                                        ),
                                        Icon(Icons.keyboard_arrow_down_sharp),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Update',
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "SegoeUI",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    primary: Color(0xff0D4B75),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Positioned(
                    top: 0, child: Image.asset("assets/icons/dismiss.png")),
              ),
            ],
          ),
        ),
      );
    },
  );
}
