class Customer {
  Customer({
    required this.status,
    required this.response,
  });
  late final int status;
  late final Response response;

  Customer.fromJson(Map<String, dynamic> json) {
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
  late final List<Data> data;

  Response.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }
}

class Data {
  Data({
    required this.customerId,
    required this.customerAddress,
    required this.customerName,
    required this.customerPhone,
    required this.customerGPS,
    required this.customerType,
    required this.ArcustomerType,
    required this.cityName,
    required this.cityNameAr,
  });
  late final String customerId;
  late final String customerAddress;
  late final String customerName;
  late final String customerPhone;
  late final String customerGPS;
  late final String customerType;
  late final String ArcustomerType;
  late final String cityName;
  late final String cityNameAr;

  Data.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    customerAddress = json['customerAddress'];
    customerName = json['customerName'];
    customerPhone = json['customerPhone'];
    customerGPS = json['customerGPS'];
    customerType = json['customerType'];
    ArcustomerType = json['ArcustomerType'];
    cityName = json['cityName'];
    cityNameAr = json['cityNameAr'];
  }
}
