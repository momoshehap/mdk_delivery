import 'package:MDKDelivery/business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_state.dart';
import 'package:MDKDelivery/utils/strings.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget buildsettingcomponant(
  BuildContext context, {
  required String imgname,
  required String title,
  String? screen,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: InkWell(
      onTap: () async {
        if (screen != null) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(screen, (Route<dynamic> route) => false);
          SharedPreferences userPrefs = await SharedPreferences.getInstance();
          await userPrefs.remove('userData');
          NavAppCubit.get(context).navbarIndex = 0;
        } else {
          changeLanguage(context);
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

Future changeLanguage(context) {
  return showDialog(
      context: context,
      builder: (context) {
        return BlocBuilder<OrderCubit, OrderStates>(
          builder: (context, state) {
            var cubit = OrderCubit.get(context);
            return AlertDialog(
              content: SizedBox(
                width: double.infinity,
                height: 120,
                child: Expanded(
                  child: ConditionalBuilder(
                    condition: true,
                    builder: (context) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () async {
                            cubit.changeLangu(false);
                            SharedPreferences userPrefs =
                                await SharedPreferences.getInstance();
                            userPrefs.setBool("isEn", false);
                            Navigator.pop(context);
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                mainn, (Route<dynamic> route) => false);
                          },
                          child: Container(
                              width: double.infinity,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: const Color(0xff155079),
                              ),
                              child: Text(
                                "Arabic",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: "SegoeUI"),
                              )),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () async {
                            cubit.changeLangu(true);
                            SharedPreferences userPrefs =
                                await SharedPreferences.getInstance();
                            userPrefs.setBool("isEn", true);
                            Navigator.pop(context);
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                mainn, (Route<dynamic> route) => false);
                          },
                          child: Container(
                              width: double.infinity,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0),
                                color: const Color(0xff155079),
                              ),
                              child: Text(
                                "English",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontFamily: "SegoeUI"),
                              )),
                        ),
                      ],
                    ),
                    fallback: (context) => const Center(
                        child: CircularProgressIndicator(
                      color: Color(0xff155079),
                    )),
                  ),
                ),
              ),
            );
          },
        );
      });
}
