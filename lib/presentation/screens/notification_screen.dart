import 'package:MDKDelivery/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/api_cubit/api_states.dart';
import 'package:MDKDelivery/business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_state.dart';
import 'package:MDKDelivery/presentation/widgets/notifications_componants.dart';
import 'package:MDKDelivery/utils/strings.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        NavAppCubit.get(context).navbarIndex = 0;
        Navigator.of(context).pushNamedAndRemoveUntil(
            appMainScreen, (Route<dynamic> route) => false);
        NavAppCubit.get(context).navbarIndex = 0;
        return true;
      },
      child: SizedBox(
        width: double.infinity,
        child: BlocBuilder<OrderCubit, OrderStates>(
          builder: (context, state) {
            var cubit = OrderCubit.get(context);

            return BlocBuilder<ApiAppCubit, ApiStates>(
                builder: (context, apistate) {
              var apiCubit = ApiAppCubit.get(context);
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  !cubit.isclickedNotify
                      ? Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: ConditionalBuilder(
                              condition: apistate
                                      is! NewLoadingNotificationsDataState &&
                                  apiCubit.isNotification,
                              builder: (context) => ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, index) {
                                  if (apiCubit
                                          .notification!.response.data.length !=
                                      0) {
                                    return buildNotifyCard(apiCubit
                                        .notification!.response.data[index]);
                                  } else {
                                    return Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            "No Drop Off Data for this Shift",
                                            style: TextStyle(
                                              fontSize: 17,
                                              fontFamily: "SegoeUI",
                                              color: Color(0xff0D4B75),
                                              fontWeight: FontWeight.bold,
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
                                },
                                separatorBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 1.5,
                                      color: Color(0xffB8B7B7),
                                    ),
                                  );
                                },
                                itemCount: apiCubit.notification!.response.data
                                            .length ==
                                        0
                                    ? 1
                                    : apiCubit
                                        .notification!.response.data.length,
                              ),
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator(
                                color: Color(0xff155079),
                              )),
                            ),
                          ),
                        )
                      : notificationBody(),
                ],
              );
            });
          },
        ),
      ),
    );
  }
}
