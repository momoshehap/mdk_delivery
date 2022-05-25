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
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          buildsettingcomponant(context,
              imgname: "language", title: "Change language"),
          buildsettingcomponant(context,
              imgname: "logout", title: "Logout", screen: loginScreen),
        ],
      ),
    );
  }
}
