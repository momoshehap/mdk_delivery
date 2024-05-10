import 'package:MDKDelivery/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/api_cubit/api_states.dart';
import 'package:MDKDelivery/business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_cubit.dart';
import 'package:MDKDelivery/localization/localizatios.dart';
import 'package:MDKDelivery/utils/strings.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_state.dart';
import 'package:flutter_svg/svg.dart';

import '../widgets/home_componants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext contextt) {
    ApiAppCubit.get(context)..getCurrentLocation();

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: BlocBuilder<OrderCubit, OrderStates>(
          builder: (context, state) {
            var cubit = OrderCubit.get(context);
            return BlocConsumer<ApiAppCubit, ApiStates>(
                listener: (context, apistate) {},
                builder: (context, apistate) {
                  var apiCubit = ApiAppCubit.get(context);
                  return Column(
                    children: [
                      ConditionalBuilder(
                        condition: apistate is! NewLoadingDataState &&
                            apiCubit.isShiftData,
                        builder: (context) {
                          return Container(
                            color: Color(0xff0D4B75),
                            width: double.infinity,
                            height: 60,
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${apiCubit.shift!.response.data.Date}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "SegoeUI",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15, vertical: 20),
                                    child: Container(
                                      width: 2,
                                      height: double.infinity,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${apiCubit.shift!.response.data.shiftTime}",
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontFamily: "SegoeUI",
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        fallback: (context) => const Center(
                            child: CircularProgressIndicator(
                          color: Color(0xff155079),
                        )),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: 40,
                                  padding: EdgeInsets.symmetric(horizontal: 3),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25.0),
                                    border: Border.all(
                                      width: 1,
                                      color: Color(0xffBCADAD),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            cubit.changeDropoffCustomer();
                                            apiCubit.getDropOffOrders();
                                          },
                                          child: Text(
                                            getLang(context, "dropoff"),
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: "SegoeUI",
                                              color: !cubit.isDropoff
                                                  ? Color(0xff0D4B75)
                                                  : Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0, backgroundColor: cubit.isDropoff
                                                ? Color(0xff0D4B75)
                                                : Colors.white,
                                            shape: StadiumBorder(),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: ElevatedButton(
                                          onPressed: () {
                                            cubit.changeDropoffCustomer();
                                            apiCubit.getpickUpOrders();
                                          },
                                          child: Text(
                                            getLang(context, "pickup"),
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: "SegoeUI",
                                              color: cubit.isDropoff
                                                  ? Color(0xff0D4B75)
                                                  : Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            elevation: 0, backgroundColor: !cubit.isDropoff
                                                ? Color(0xff0D4B75)
                                                : Colors.white,
                                            shape: StadiumBorder(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: ConditionalBuilder(
                                    condition: cubit.isDropoff
                                        ? apistate
                                                is! NewLoadingDropOffDataState &&
                                            apiCubit.isDropData
                                        : apistate
                                                is! NewLoadingpickUpDataState &&
                                            apiCubit.ispickUp,
                                    builder: (context) => ListView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        if (cubit.isDropoff) {
                                          if (apiCubit.dropOffData!.response
                                                  .data!.length !=
                                              0) {
                                            return buildCustomerCard(
                                                contextt,
                                                apiCubit.dropOffData!.response
                                                    .data![index],
                                                index,
                                                true);
                                          } else {
                                            return Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    getLang(
                                                        context, "empty_order"),
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontFamily: "SegoeUI",
                                                      color: Color(0xff0D4B75),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    child: SvgPicture.asset(
                                                        "assets/icons/Nodata.svg", //asset location
                                                        semanticsLabel:
                                                            'SVG From asset folder.'),
                                                  )
                                                ],
                                              ),
                                            );
                                          }
                                        } else {
                                          if (apiCubit.pickUpData!.response
                                                  .data!.length !=
                                              0) {
                                            return buildCustomerCard(
                                                contextt,
                                                apiCubit.pickUpData!.response
                                                    .data![index],
                                                index,
                                                false);
                                          } else {
                                            return Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    getLang(
                                                        context, "empty_order"),
                                                    style: TextStyle(
                                                      fontSize: 17,
                                                      fontFamily: "SegoeUI",
                                                      color: Color(0xff0D4B75),
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    child: SvgPicture.asset(
                                                        "assets/icons/Nodata.svg", //asset location
                                                        semanticsLabel:
                                                            'SVG From asset folder.'),
                                                  )
                                                ],
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      itemCount: cubit.isDropoff
                                          ? apiCubit.dropOffData!.response.data!
                                                      .length ==
                                                  0
                                              ? 1
                                              : apiCubit.dropOffData!.response
                                                  .data!.length
                                          : apiCubit.pickUpData!.response.data!
                                                      .length ==
                                                  0
                                              ? 1
                                              : apiCubit.pickUpData!.response
                                                  .data!.length,
                                    ),
                                    fallback: (context) => const Center(
                                        child: CircularProgressIndicator(
                                      color: Color(0xff155079),
                                    )),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
