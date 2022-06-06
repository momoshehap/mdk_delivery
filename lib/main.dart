import 'package:MDKDelivery/localization/localizatios.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:MDKDelivery/service/api.dart';
import 'package:MDKDelivery/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'business_logic/cubit/api_cubit/api_Cubit.dart';
import 'business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import 'business_logic/cubit/order_cubit/order_cubit.dart';
import 'business_logic/cubit/order_cubit/order_state.dart';
import 'router/app_routes.dart';

late String initialRoute;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Helper.init();
  SharedPreferences userPrefs = await SharedPreferences.getInstance();
  String? user = userPrefs.getString('userData');

  if (user == null) {
    initialRoute = loginScreen;
  } else {
    initialRoute = appMainScreen;
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext cntext) => NavAppCubit(context)),
        BlocProvider(create: (BuildContext context) => OrderCubit()..init()),
        BlocProvider(create: (BuildContext context) => ApiAppCubit()..init()),
      ],
      child: BlocConsumer<OrderCubit, OrderStates>(listener: (context, state) {
        if (state is ChangeLanguagestate) {
          setState(() {});
        }
      }, builder: (context, state) {
        var cubit = OrderCubit.get(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'MDK',
          theme: ThemeData(
            primaryColor: Color(0xff155079),
            appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  color: Color(0xff707070),
                  fontSize: 24,
                  fontFamily: "SegoeUI",
                  fontWeight: FontWeight.bold),
            ),
          ),
          onGenerateRoute: AppRouter().onGenerateRoute,
          initialRoute: initialRoute,
          localizationsDelegates: [
            AppLocale.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale("en", ""),
            Locale("ar", ""),
          ],
          localeResolutionCallback: cubit.localeResolutionCallback,
        );
      }),
    );
  }
}
