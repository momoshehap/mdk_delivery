import 'package:MDKDelivery/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/api_cubit/api_states.dart';
import 'package:MDKDelivery/localization/localizatios.dart';
import 'package:MDKDelivery/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_state.dart';
import 'package:flutter_svg/svg.dart';

Widget buildCustomerCard(
    BuildContext context, Data? orders, int index, bool type) {
  var cubit = OrderCubit.get(context);

  return InkWell(
    onTap: () {
      buildCustomerDialog(context, orders, index, type);
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
                children: [
                  Text(
                    '#${orders!.orderId}',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "SegoeUI",
                      color: Color(0xff004067),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Text(
                    orders.StatusName!,
                    style: TextStyle(
                      color: Color(0xff004067),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
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
                    cubit.isAr ? orders.ArcustomerType! : orders.customerType!,
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
                    orders.customerName!,
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
                children: [
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text:
                                '${cubit.isAr ? orders.cityNameAr : orders.cityName} - ',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "SegoeUI",
                              color: Color(0xffB2B1B1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: cubit.isAr
                                ? orders.ArAddress
                                : orders.customerAddress,
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
                    orders.amount != ""
                        ? "${orders.amount} - ${orders.currency} With collection"
                        : "",
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

Future<dynamic> buildCustomerDialog(
    cnxt, Data? orders, int index, bool isDrop) {
  String? temp = orders!.StatusName;

  return showDialog(
    barrierDismissible: false,
    context: cnxt,
    builder: (BuildContext context) {
      return BlocBuilder<ApiAppCubit, ApiStates>(
        builder: (context, apistate) {
          print("from api $apistate");
          var apicubit = ApiAppCubit.get(context);
          return AlertDialog(
            backgroundColor: Colors.white.withOpacity(0.0),
            contentPadding: const EdgeInsets.all(0.0),
            content: SizedBox(
              height: 550,
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Container(
                      height: 430,
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
                            print("from order $state");
                            OrderCubit.get(context).changeDropDown(temp);

                            var cubit = OrderCubit.get(context);
                            return SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "#${orders.orderId}",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: "SegoeUI",
                                          color: Color(0xff004067),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        orders.StatusName!,
                                        style: TextStyle(
                                          color: Color(0xff004067),
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
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
                                        cubit.isAr
                                            ? orders.ArcustomerType!
                                            : orders.customerType!,
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
                                        orders.customerName!,
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color(0xffB2B1B1),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/number.svg",
                                        color: Color(0xff004067),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          cubit.makingPhoneCall(
                                              orders.customerPhone);
                                        },
                                        child: Text(
                                          orders.customerPhone!,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        child: Text.rich(
                                          TextSpan(
                                            children: <InlineSpan>[
                                              TextSpan(
                                                text: cubit.isAr
                                                    ? orders.cityNameAr
                                                    : orders.cityName,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontFamily: "SegoeUI",
                                                  color: Color(0xffB2B1B1),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              TextSpan(
                                                text: cubit.isAr
                                                    ? orders.ArAddress
                                                    : orders.customerAddress,
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
                                        orders.amount != ""
                                            ? "${orders.amount} - ${orders.currency} With collection"
                                            : "",
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
                                  Text(
                                    getLang(context, "note"),
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
                                    orders.notes!,
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
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/location.svg",
                                        color: Color(0xff004067),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          cubit.navigateTo(orders.customerGPS!);
                                        },
                                        child: Text(
                                          getLang(context, "showonmap"),
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff004067)),
                                        ),
                                      )
                                    ],
                                  ),
                                  PopupMenuButton(
                                    elevation: 16,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8.0))),
                                    itemBuilder: (context) {
                                      return [
                                        'Picked_Up',
                                        'Collected',
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
                                      temp = value;
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.brown),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              cubit.dropDownValue!,
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontFamily: "SegoeUI",
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff004067)),
                                            ),
                                            Icon(Icons
                                                .keyboard_arrow_down_sharp),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      apicubit
                                          .getCurrentLocation()
                                          .then((value) {
                                        print(value.longitude);
                                        apicubit.upDAteGpsCustomer(
                                          cnxt,
                                          customerId: orders.customerId!,
                                          latlunGps:
                                              "${value.latitude},${value.longitude}",
                                          token: apicubit
                                              .user!.response.data.token,
                                        );
                                      });

                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        color: const Color(0xff155079),
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            getLang(cnxt, "update_location"),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontFamily: "SegoeUI",
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                          Spacer(),
                                          Icon(
                                            Icons.add_location_alt_outlined,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        apicubit.updateOrderStatus(cnxt,
                                            orderId: orders.orderId!,
                                            status: cubit.dropDownValue!);

                                        isDrop
                                            ? apicubit.dropOffData!.response
                                                    .data![index].StatusName =
                                                cubit.dropDownValue!
                                            : apicubit.pickUpData!.response
                                                    .data![index].StatusName =
                                                cubit.dropDownValue!;
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        getLang(cnxt, "update"),
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontFamily: "SegoeUI",
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: StadiumBorder(), backgroundColor: Color(0xff0D4B75),
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
                  Positioned(
                      top: 0,
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: SvgPicture.asset("assets/icons/dismiss.svg"))),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
