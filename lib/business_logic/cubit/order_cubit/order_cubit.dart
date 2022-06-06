import 'package:MDKDelivery/model/notify_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'order_state.dart';
// import 'package:image_picker/image_picker.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit() : super(InitOrderState());
  static OrderCubit get(context) => BlocProvider.of(context);
  static bool isEn = true;
  bool isAr = !isEn;

  init() async {
    SharedPreferences userPrefs = await SharedPreferences.getInstance();
    bool? lang = userPrefs.getBool('isEn');
    if (lang == null) {
      isEn = true;
      isAr = !isEn;
    } else {
      isEn = lang;
      isAr = !isEn;
    }
  }

  void changeLangu(bool lang) {
    emit(ChangeLanguagestate());
    isEn = lang;
    isAr = !isEn;
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

  String dropDownValue = "Picked_Up";
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
