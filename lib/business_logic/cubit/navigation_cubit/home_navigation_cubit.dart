import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MDKDelivery/presentation/screens/customers_screen.dart';
import 'package:MDKDelivery/presentation/screens/home_screen.dart';
import 'package:MDKDelivery/presentation/screens/notification_screen.dart';
import 'package:MDKDelivery/presentation/screens/settings_screen.dart';
import 'home_navigation_state.dart';

class NavAppCubit extends Cubit<NavappStates> {
  NavAppCubit() : super(InitNavappState());
  static NavAppCubit get(context) => BlocProvider.of(context);

  List<Widget> titles = [
    Image.asset("assets/icons/logoDark.png"),
    Text("Customers"),
    Text("Notifications"),
    Text("Settings"),
  ];

  int navbarIndex = 0;
  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(
      icon: Expanded(
        child: ImageIcon(
          AssetImage("assets/icons/home.png"),
        ),
      ),
      label: "Home",
    ),
    BottomNavigationBarItem(
      icon: Expanded(
        child: ImageIcon(
          AssetImage("assets/icons/customers.png"),
        ),
      ),
      label: "Customers",
    ),
    BottomNavigationBarItem(
      icon: Expanded(
        child: ImageIcon(
          AssetImage("assets/icons/notify.png"),
        ),
      ),
      label: "Notification",
    ),
    BottomNavigationBarItem(
      icon: Expanded(
        child: ImageIcon(
          AssetImage("assets/icons/setting.png"),
        ),
      ),
      label: "setting",
    ),
  ];

  List<Widget> screens = const [
    HomeScreen(),
    CustomersScreen(),
    NotifyScreen(),
    SettingScreen(),
  ];

  Widget? title;
  void changeTitleAppBar(int index) {
    navbarIndex = index;

    emit(ChangeTitleAppBarstate());
  }

  void changeBottomNavBar(int index) {
    navbarIndex = index;
    emit(ChangeBottomNavBarstate());
  }
}
