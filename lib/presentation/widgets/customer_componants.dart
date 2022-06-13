import 'package:MDKDelivery/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/api_cubit/api_states.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_state.dart';
import 'package:MDKDelivery/localization/localizatios.dart';
import 'package:MDKDelivery/model/customer_model.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

Widget buildSearchbar(context) {
  return BlocListener<ApiAppCubit, ApiStates>(
    listener: (context, state) {
      if (state is GetSearchedCustomerDataSuccessState) {
        ApiAppCubit.get(context).isSearching = true;
      }
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: SizedBox(
        height: 48,
        child: TextField(
          onChanged: (value) {
            ApiAppCubit.get(context).getShearchCustomers(shearchWord: value);
            print(value.isEmpty);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24.0),
            ),
            filled: true,
            hintText: getLang(context, "search"),
            prefixIcon: const Icon(
              Icons.search,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget buildCustomerCard(Data customer, String token) {
  return BlocProvider(
    create: (context) => OrderCubit(),
    child: BlocBuilder<OrderCubit, OrderStates>(builder: (context, Ostate) {
      var cubit = OrderCubit.get(context);
      return Padding(
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
                          cubit.isAr
                              ? customer.ArcustomerType
                              : customer.customerType,
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
                          customer.customerName,
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
                            cubit.navigateTo(customer.customerGPS);
                          },
                          child: SvgPicture.asset("assets/icons/location.svg"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 2,
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
                            cubit.makingPhoneCall(customer.customerPhone);
                          },
                          child: Text(
                            customer.customerPhone,
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
                    Text.rich(
                      TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text:
                                '${cubit.isAr ? customer.cityNameAr : customer.cityName} - ',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "SegoeUI",
                              color: Color(0xffB2B1B1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: customer.customerAddress,
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
                    SizedBox(
                      height: 10,
                    ),
                    BlocProvider(
                      create: (context) => ApiAppCubit(),
                      child: BlocBuilder<ApiAppCubit, ApiStates>(
                          builder: (context, state) {
                        var apicubit = ApiAppCubit.get(context);
                        apicubit.user = ApiAppCubit.get(context).user;
                        return ConditionalBuilder(
                          condition:
                              state is! NewLoadingupDAteGpsCustomerState &&
                                  state is! NewLoadinggetCurrentLocationState,
                          builder: (context) => InkWell(
                            onTap: () {
                              apicubit.getCurrentLocation().then((value) {
                                print(value.longitude);
                                apicubit.upDAteGpsCustomer(
                                  context,
                                  customerId: customer.customerId,
                                  latlunGps:
                                      "${value.latitude},${value.longitude}",
                                  token: token,
                                );
                              });
                            },
                            child: Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: const Color(0xff155079),
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    getLang(context, "update_location"),
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
                          fallback: (context) => const Center(
                              child: CircularProgressIndicator(
                            color: Color(0xff155079),
                          )),
                        );
                      }),
                    )
                  ]),
            ),
          ),
        ),
      );
    }),
  );
}
