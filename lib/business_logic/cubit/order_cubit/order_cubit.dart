import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

import 'order_state.dart';
// import 'package:image_picker/image_picker.dart';

class OrderCubit extends Cubit<OrderStates> {
  OrderCubit() : super(InitOrderState());
  static OrderCubit get(context) => BlocProvider.of(context);

  bool isDropoff = true;
  void changeDropoffCustomer() {
    isDropoff = !isDropoff;
    emit(ChangeDropoffCustomerstate());
  }

  String dropDownValue = "Pinding";
  void changeDropDown(value) {
    dropDownValue = value;
    emit(ChangeDropDownstate());
  }

  bool isclickedNotify = false;
  void showClickedNotify() {
    isclickedNotify = !isclickedNotify;
    emit(ShowClickedNotifystate());
  }

  void navigateTo(double lat, double lng) async {
    var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
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
