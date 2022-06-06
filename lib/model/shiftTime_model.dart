class ShiftTime {
  ShiftTime({
    required this.status,
    required this.response,
  });
  late final int status;
  late final Response response;

  ShiftTime.fromJson(Map<String, dynamic> json) {
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
  late final Data data;

  Response.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    status = json['status'];
    data = Data.fromJson(json['data']);
  }
}

class Data {
  Data({
    required this.shiftTime,
    required this.shift,
    required this.Date,
  });
  late final String shiftTime;
  late final int shift;
  late final String Date;

  Data.fromJson(Map<String, dynamic> json) {
    shiftTime = json['shiftTime'];
    shift = json['shift'];
    Date = json['Date'];
  }
}
