import 'package:MDKDelivery/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:MDKDelivery/business_logic/cubit/api_cubit/api_states.dart';
import 'package:MDKDelivery/business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import 'package:MDKDelivery/utils/strings.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:MDKDelivery/presentation/widgets/customer_componants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomersScreen extends StatelessWidget {
  const CustomersScreen({Key? key}) : super(key: key);

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
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocConsumer<ApiAppCubit, ApiStates>(
              listener: (context, state) {},
              builder: (context, state) {
                var apiCubit = ApiAppCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildSearchbar(context),
                    Expanded(
                      child: ConditionalBuilder(
                        condition: state is! NewLoadingCustomersDataState &&
                            state is! NewLoadingShearchCustomersDataState &&
                            apiCubit.isCustomers,
                        builder: (context) => ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (BuildContext context, index) {
                            return buildCustomerCard(
                                apiCubit.isSearching
                                    ? apiCubit.searchedCustomerData!.response
                                        .data[index]
                                    : apiCubit
                                        .CustomerData!.response.data[index],
                                apiCubit.user!.response.data.token);
                          },
                          itemCount: apiCubit.isSearching
                              ? apiCubit
                                  .searchedCustomerData!.response.data.length
                              : apiCubit.CustomerData!.response.data.length,
                        ),
                        fallback: (context) => const Center(
                            child: CircularProgressIndicator(
                          color: Color(0xff155079),
                        )),
                      ),
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
