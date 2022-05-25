class Model {
  final String? title;
  final String? description;
  final String? date;

  Model({this.title, this.description, this.date});

  factory Model.fromJson(Map<String, dynamic> jasonData) {
    return Model(
      title: jasonData["title"],
      description: jasonData["description"],
      date: jasonData["date"],
    );
  }
}
