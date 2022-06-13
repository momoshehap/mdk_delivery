import 'package:MDKDelivery/model/notify_model.dart';
import 'package:MDKDelivery/utils/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit() : super(InitOrderState());
  static OrderCubit get(context) => BlocProvider.of(context);
  static bool isEn = false;
  bool isAr = !isEn;
  Locale? locale;

  Future init() async {
    await SharedPreferences.getInstance().then((value) {
      bool? lang = value.getBool('isEn');
      if (lang == null || lang == true) {
        isEn = true;
        changeLocale(Locale('en'));
      } else if (lang == false) {
        isEn = lang;
        changeLocale(Locale('ar'));
      }
      emit(SetinitFanctionstate());
      return value;
    });
  }

  void changeLangu(bool lang) {
    isEn = lang;
    isAr = !isEn;
    emit(ChangeLanguagestate());
  }

  void changeLocale(Locale local) {
    locale = local;
    emit(ChangeLogstate());
  }

  LocaleResolutionCallback localeResolutionCallback =
      (currentLang, supportedLang) {
    if (isEn) {
      return supportedLang.first;
    } else {
      return supportedLang.last;
    }
  };

  bool isDropoff = true;
  void changeDropoffCustomer() {
    isDropoff = !isDropoff;
    emit(ChangeDropoffCustomerstate());
  }

  String? dropDownValue = "Picked_Up";
  void changeDropDown(value) {
    dropDownValue = value;
    emit(ChangeDropDownstate());
  }

  bool isclickedNotify = false;
  Data? activeNotification;
  void showClickedNotify({Data? active}) {
    activeNotification = active;
    isclickedNotify = !isclickedNotify;
    emit(ShowClickedNotifystate());
  }

  void navigateTo(String latlng) async {
    var uri = Uri.parse("google.navigation:q=$latlng&mode=d");
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }

  void makingPhoneCall(number) async {
    var url = Uri.parse('tel:$number');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch ${url.toString()}';
    }
  }
}
