import 'package:MDKDelivery/business_logic/cubit/api_cubit/api_Cubit.dart';
import 'package:MDKDelivery/localization/localizatios.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import '../../business_logic/cubit/navigation_cubit/home_navigation_state.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> titles = [
      SvgPicture.asset(
        "assets/icons/logoDark.svg",
        height: 60,
      ),
      Text(
        getLang(context, "customers"),
      ),
      Text(getLang(context, "notification")),
      Text(getLang(context, "settings")),
    ];
    return BlocConsumer<NavAppCubit, NavappStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NavAppCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: titles[cubit.navbarIndex],
            centerTitle: true,
            leading: Container(),
            backgroundColor: Colors.white,
            toolbarHeight: 81,
          ),
          body: cubit.screens[cubit.navbarIndex],
          bottomNavigationBar: BottomNavigationBar(
            elevation: 20,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey,
            selectedItemColor: const Color(0xff155079),
            showUnselectedLabels: true,
            currentIndex: cubit.navbarIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
              cubit.changeTitleAppBar(index);
              if (index == 0) {
                ApiAppCubit.get(context).getactiveSession();
              }
              if (index == 1) {
                ApiAppCubit.get(context).getCustomers();
              }
              if (index == 2) {
                ApiAppCubit.get(context).getNotifications();
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/home.svg",
                  color: cubit.navbarIndex == 0
                      ? const Color(0xff155079)
                      : Colors.grey,
                ),
                label: getLang(context, "home"),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/customers.svg",
                  color: cubit.navbarIndex == 1
                      ? const Color(0xff155079)
                      : Colors.grey,
                ),
                label: getLang(context, "customers"),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/notifications.svg",
                  color: cubit.navbarIndex == 2
                      ? const Color(0xff155079)
                      : Colors.grey,
                ),
                label: getLang(context, "notification"),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(
                  "assets/icons/settings.svg",
                  color: cubit.navbarIndex == 3
                      ? const Color(0xff155079)
                      : Colors.grey,
                ),
                label: getLang(context, "settings"),
              ),
            ],
          ),
        );
      },
    );
  }
}
