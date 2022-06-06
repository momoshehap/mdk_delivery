import 'package:MDKDelivery/business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import 'package:MDKDelivery/localization/localizatios.dart';
import 'package:flutter/material.dart';
import 'package:MDKDelivery/utils/strings.dart';

import '../widgets/settings_componants.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({key});

  @override
  State<SettingScreen> createState() => _SettingScreen();
}

class _SettingScreen extends State<SettingScreen> {
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
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            buildsettingcomponant(
              context,
              imgname: "language",
              title: getLang(context, "change_language"),
            ),
            buildsettingcomponant(context,
                imgname: "logout",
                title: getLang(context, "logout"),
                screen: loginScreen),
          ],
        ),
      ),
    );
  }
}
