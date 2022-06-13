class Order {
  Order({
    required this.status,
    required this.response,
  });
  late final int status;
  late final Response response;

  Order.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = Response.fromJson(json['response']);
  }
}

class Response {
  Response({
    required this.msg,
    required this.status,
    required this.data,
  });
  late final String msg;
  late final int status;
  late final List<Data>? data;

  Response.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }
}

class Data {
  Data({
    required this.customerId,
    required this.amount2,
    required this.currency2,
    required this.amount,
    required this.currency,
    required this.ArAddress,
    required this.customerAddress,
    required this.orderId,
    required this.notes,
    required this.customerAddressOld,
    required this.customerName,
    required this.customerPhone,
    required this.customerGPS,
    required this.customerType,
    required this.ArcustomerType,
    required this.ifWithCollection,
    required this.voiceNote,
    required this.cityName,
    required this.cityNameAr,
    required this.StatusName,
  });
  late final String? customerId;
  late final String? amount2;
  late final String? currency2;
  late final String? amount;
  late final String? currency;
  late final String? ArAddress;
  late final String? customerAddress;
  late final String? orderId;
  late final String? notes;
  late final String? customerAddressOld;
  late final String? customerName;
  late final String? customerPhone;
  late final String? customerGPS;
  late final String? customerType;
  late final String? ArcustomerType;
  late final String? ifWithCollection;
  late final String? voiceNote;
  late final String? cityName;
  late final String? cityNameAr;
  late String? StatusName;

  Data.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    amount2 = json['amount2'];
    currency2 = json['currency2'];
    amount = json['amount'];
    currency = json['currency'];
    ArAddress = json['ArAddress'];
    customerAddress = json['customerAddress'];
    orderId = json['orderId'];
    notes = json['notes'];
    customerAddressOld = json['customerAddress_old'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    customerGPS = json['customerGPS'];
    customerType = json['customerType'];
    ArcustomerType = json['ArcustomerType'];
    ifWithCollection = json['ifWithCollection'];
    voiceNote = json['voiceNote'];
    cityName = json['cityName'];
    cityNameAr = json['cityNameAr'];
    StatusName = json['StatusName'];
  }
}
