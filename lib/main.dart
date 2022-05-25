import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'business_logic/cubit/navigation_cubit/home_navigation_cubit.dart';
import 'business_logic/cubit/order_cubit/order_cubit.dart';
import 'router/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => NavAppCubit()),
        BlocProvider(create: (BuildContext context) => OrderCubit()),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
