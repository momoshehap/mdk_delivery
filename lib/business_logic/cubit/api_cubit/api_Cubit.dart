import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:MDKDelivery/model/customer_model.dart';
import 'package:MDKDelivery/model/notify_model.dart';
import 'package:MDKDelivery/model/order_model.dart';
import 'package:MDKDelivery/model/shiftTime_model.dart';
import 'package:MDKDelivery/model/user_model.dart';
import 'package:MDKDelivery/service/api.dart';
import 'package:MDKDelivery/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:geolocator/geolocator.dart';
import 'api_states.dart';

class ApiAppCubit extends Cubit<ApiStates> {
  ApiAppCubit() : super(InitApiappState());
  static ApiAppCubit get(context) => BlocProvider.of(context);
  init() async {
    SharedPreferences userPrefs = await SharedPreferences.getInstance();
    String? userData = userPrefs.getString('userData');
    if (userData == null) {
    } else {
      Map<String, dynamic> jsonString = json.decode(userData);
      User savedUser = User.fromJson(jsonString);
      user = savedUser;
      getactiveSession();
      getDropOffOrders();
    }
  }

  String loginpath = "employee_login";
  int? status;
  User? user;
  bool isLogin = false;
  Future getLoginData({
    required BuildContext context,
    required String number,
    required String password,
  }) async {
    emit(NewLoginLoadingState());

    Helper.getData(
      url: loginpath,
      query: {
        'mobile': number,
        'password': password,
      },
    ).then((value) async {
      print(value.data["response"]["data"]);
      int status = value.data["response"]["status"];
      if (status == 0) {
        emit(GetwrongAccountState());
      } else {
        user = User.fromJson(value.data);
        getactiveSession();
        getDropOffOrders();
        emit(GetLoginDataSuccessState());
        SharedPreferences userPrefs = await SharedPreferences.getInstance();
        userPrefs.setString(
            'userData', jsonEncode(ApiAppCubit.get(context).user!.toJson()));
        isLogin = true;
        Navigator.of(context).pushNamedAndRemoveUntil(
            appMainScreen, (Route<dynamic> route) => false);
      }
    }).catchError((e) {
      print(e);
      emit(GetLoginDataErorrState(e.toString()));
    });
  }

  String activeSessionpath = "active_session_time";
  ShiftTime? shift;
  bool isShiftData = false;
  Future getactiveSession({
    String? number,
    String? password,
  }) async {
    emit(NewLoadingDataState());

    Helper.getData(
      url: activeSessionpath,
      query: {
        'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'time': DateFormat('Hm').format(DateTime.now()),
        'driverId': user!.response.data.id,
      },
      header: user!.response.data.token,
    ).then((value) {
      shift = ShiftTime.fromJson(value.data);
      isShiftData = true;
      print(shift!.response.data.shiftTime);
      emit(GetShiftTimeSuccessState());
    }).catchError((e) {
      emit(GetShiftTimeErorrState(e.toString()));
    });
  }

  String pickUpPath = "fetch_pick_up";
  Order? pickUpData;
  bool ispickUp = false;
  Future getpickUpOrders() async {
    emit(NewLoadingpickUpDataState());

    Helper.getData(
      url: pickUpPath,
      query: {
        'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'time': DateFormat('Hm').format(DateTime.now()),
        'driverId': user!.response.data.id,
      },
      header: user!.response.data.token,
    ).then((value) {
      pickUpData = Order.fromJson(value.data);
      ispickUp = true;
      print("pickUpPath");
      emit(GetPickUpDataSuccessState());
    }).catchError((e) {
      emit(GetPickUpDataErorrState(e.toString()));
    });
  }

  String dropOffPath = "drop_off";
  Order? dropOffData;
  bool isDropData = false;

  Future getDropOffOrders() async {
    emit(NewLoadingDropOffDataState());

    Helper.getData(
      url: dropOffPath,
      query: {
        'date': DateFormat('yyyy-MM-dd').format(DateTime.now()),
        'time': DateFormat('Hm').format(DateTime.now()),
        'driverId': user!.response.data.id,
      },
      header: user!.response.data.token,
    ).then((value) {
      print(value.data);

      dropOffData = Order.fromJson(value.data);

      isDropData = true;
      print("drop_off");

      emit(GetDropOffDataSuccessState());
    }).catchError((e) {
      emit(GetDropOffDataErorrState(e.toString()));
    });
  }

  String getCustomersPath = "customer_area";
  Customer? CustomerData;
  bool isCustomers = false;

  Future getCustomers() async {
    emit(NewLoadingCustomersDataState());

    Helper.getData(
      url: getCustomersPath,
      query: {
        'areaId': user!.response.data.area[0].id,
        'driverId': user!.response.data.id,
      },
      header: user!.response.data.token,
    ).then((value) {
      CustomerData = Customer.fromJson(value.data);
      isCustomers = true;
      emit(GetCustomerDataSuccessState());
    }).catchError((e) {
      emit(GetCustomerDataErorrState(e.toString()));
    });
  }

  Customer? searchedCustomerData;
  bool isSearching = false;
  Future getShearchCustomers({
    String? shearchWord,
  }) async {
    emit(NewLoadingShearchCustomersDataState());

    Helper.getData(
      url: getCustomersPath,
      query: {
        'areaId': user!.response.data.area[0].id,
        'driverId': user!.response.data.id,
        'search': shearchWord,
      },
      header: user!.response.data.token,
    ).then((value) {
      searchedCustomerData = Customer.fromJson(value.data);
      emit(GetSearchedCustomerDataSuccessState());
    }).catchError((e) {
      emit(GetSearchedCustomerDataErorrState(e.toString()));
    });
  }

  String getNotificationsPath = "getNotifications";

  Notifications? notification;
  bool isNotification = false;
  Future getNotifications({
    String? shearchWord,
  }) async {
    emit(NewLoadingNotificationsDataState());

    Helper.getData(
      url: getNotificationsPath,
      query: {
        'driverId': user!.response.data.id,
      },
      header: user!.response.data.token,
    ).then((value) {
      notification = Notifications.fromJson(value.data);
      isNotification = true;
      print(notification!.response.data.length);
      emit(GetNotificationsDataSuccessState());
    }).catchError((e) {
      print(notification!.response.data.length);

      emit(GetNotificationsDataErorrState(e.toString()));
    });
  }

  String updateGpsPath = "updateCustomerGps";
  Future upDAteGpsCustomer(
    context, {
    required String customerId,
    required String latlunGps,
    required String token,
  }) async {
    emit(NewLoadingupDAteGpsCustomerState());

    Helper.SendPost(
      url: updateGpsPath,
      query: {
        'id': customerId,
        'gps': latlunGps,
      },
      header: token,
    ).then((value) {
      print(value.data['response']['msg']);
      emit(upDAteGpsCustomerSuccessState());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color(0xff155079),
        content: Text("Gps Location Updated Successfuly"),
      ));
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color(0xff155079),
        content: Text("Please check your Internet"),
      ));
      emit(upDAteGpsCustomerErorrState(e.toString()));
    });
  }

  Future<Position> getCurrentLocation() async {
    emit(NewLoadinggetCurrentLocationState());

    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      await Geolocator.requestPermission();
      emit(getCurrentLocationSuccessState());
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  String updateOrderPath = "updateOrderStatus";
  Future updateOrderStatus(
    context, {
    required String orderId,
    required String status,
  }) async {
    emit(NewLoadingupDAteGpsCustomerState());

    Helper.SendPost(
      url: updateOrderPath,
      query: {
        'orderId': orderId,
        'driverId': user!.response.data.id,
        'status': status,
      },
      header: user!.response.data.token,
    ).then((value) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: const Color(0xff155079),
        content: Text("Order Status Updated Successfuly"),
      ));
      print(value.data['response']['response']);

      emit(upDAteGpsCustomerSuccessState());
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text("Please check your Internet"),
      ));
      emit(upDAteGpsCustomerErorrState(e.toString()));
    });
  }
}
