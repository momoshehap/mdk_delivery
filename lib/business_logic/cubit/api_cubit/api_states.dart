abstract class ApiStates {}

class InitApiappState extends ApiStates {}

class NewLoginLoadingState extends ApiStates {}

class GetLoginDataSuccessState extends ApiStates {}

class GetLoginDataErorrState extends ApiStates {
  final String error;
  GetLoginDataErorrState(this.error);
}

class GetwrongAccountState extends ApiStates {}

class NewLoadingDataState extends ApiStates {}

class GetShiftTimeSuccessState extends ApiStates {}

class GetShiftTimeErorrState extends ApiStates {
  final String error;
  GetShiftTimeErorrState(this.error);
}

class NewLoadingpickUpDataState extends ApiStates {}

class GetPickUpDataSuccessState extends ApiStates {}

class GetPickUpDataErorrState extends ApiStates {
  final String error;
  GetPickUpDataErorrState(this.error);
}

class NewLoadingDropOffDataState extends ApiStates {}

class GetDropOffDataSuccessState extends ApiStates {}

class GetDropOffDataErorrState extends ApiStates {
  final String error;
  GetDropOffDataErorrState(this.error);
}

class NewLoadingCustomersDataState extends ApiStates {}

class GetCustomerDataSuccessState extends ApiStates {}

class GetCustomerDataErorrState extends ApiStates {
  final String error;
  GetCustomerDataErorrState(this.error);
}

class NewLoadingShearchCustomersDataState extends ApiStates {}

class GetSearchedCustomerDataSuccessState extends ApiStates {}

class GetSearchedCustomerDataErorrState extends ApiStates {
  final String error;
  GetSearchedCustomerDataErorrState(this.error);
}

class NewLoadingupDAteGpsCustomerState extends ApiStates {}

class UpDAteGpsCustomerSuccessState extends ApiStates {}

class UpDAteGpsCustomerErorrState extends ApiStates {
  final String error;
  UpDAteGpsCustomerErorrState(this.error);
}

class NewLoadingupDateOrderStatusState extends ApiStates {}

class UpDateOrderStatusSuccessState extends ApiStates {}

class UpDateOrderStatusErorrState extends ApiStates {
  final String error;
  UpDateOrderStatusErorrState(this.error);
}

class NewLoadinggetCurrentLocationState extends ApiStates {}

class getCurrentLocationSuccessState extends ApiStates {}

class NewLoadingNotificationsDataState extends ApiStates {}

class GetNotificationsDataSuccessState extends ApiStates {}

class GetNotificationsDataErorrState extends ApiStates {
  final String error;
  GetNotificationsDataErorrState(this.error);
}
