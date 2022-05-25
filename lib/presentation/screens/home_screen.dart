import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_state.dart';

import '../widgets/home_componants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: BlocBuilder<OrderCubit, OrderStates>(
        builder: (context, state) {
          var cubit = OrderCubit.get(context);

          return Column(
            children: [
              Container(
                color: Color(0xff0D4B75),
                width: double.infinity,
                height: 60,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "22 March 2021",
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: "SegoeUI",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        child: Container(
                          width: 2,
                          height: double.infinity,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "11:00 am - 1:00 pm",
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
                                  },
                                  child: Text(
                                    'Drop off',
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
                                    elevation: 0,
                                    shape: StadiumBorder(),
                                    primary: cubit.isDropoff
                                        ? Color(0xff0D4B75)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    cubit.changeDropoffCustomer();
                                  },
                                  child: Text(
                                    'Pick up',
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
                                    elevation: 0,
                                    shape: StadiumBorder(),
                                    primary: !cubit.isDropoff
                                        ? Color(0xff0D4B75)
                                        : Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ConditionalBuilder(
                            condition: true,
                            builder: (context) => ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (BuildContext context, index) {
                                return buildCustomerCard(context);
                              },
                              itemCount: 10,
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
        },
      ),
    );
  }
}
