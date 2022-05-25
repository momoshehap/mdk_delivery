import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import '../../business_logic/cubit/navigation_cubit/home_navigation_state.dart';
import '../../utils/strings.dart';

class MainAppScreen extends StatefulWidget {
  const MainAppScreen({key});

  @override
  State<MainAppScreen> createState() => _MainAppScreenState();
}

class _MainAppScreenState extends State<MainAppScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavAppCubit, NavappStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NavAppCubit.get(context);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: cubit.titles[cubit.navbarIndex],
            centerTitle: true,
            actions: cubit.navbarIndex == 0
                ? [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        color: Color(0xff707070),
                        size: 35,
                      ),
                    ),
                  ]
                : null,
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
            },
            items: cubit.items,
          ),
        );
      },
    );
  }
}
