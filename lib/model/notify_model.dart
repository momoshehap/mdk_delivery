class Notifications {
  Notifications({
    required this.status,
    required this.response,
  });
  late final int status;
  late final Response response;

  Notifications.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    response = Response.fromJson(json['response']);
  }
}

class Response {
  Response({
    required this.data,
  });
  late final List<Data> data;

  Response.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.description,
    required this.insertdatetime,
    required this.active,
  });
  late final String id;
  late final String title;
  late final String description;
  late final String insertdatetime;
  late final String active;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    insertdatetime = json['insertdatetime'];
    active = json['active'];
  }
}
