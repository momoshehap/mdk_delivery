import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/order_cubit/order_state.dart';
import 'package:MDKDelivery/presentation/widgets/notifications_componants.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: BlocBuilder<OrderCubit, OrderStates>(
        builder: (context, state) {
          var cubit = OrderCubit.get(context);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              !cubit.isclickedNotify
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: ConditionalBuilder(
                          condition: true,
                          builder: (context) => ListView.separated(
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, index) {
                              return buildNotifyCard();
                            },
                            separatorBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 1.5,
                                  color: Color(0xffB8B7B7),
                                ),
                              );
                            },
                            itemCount: 10,
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
        },
      ),
    );
  }
}
