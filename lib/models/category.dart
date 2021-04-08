class Category {
  String name;
  int id;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> Json) {
    id = Json['id'];
    name = Json['name'];
  }
}
