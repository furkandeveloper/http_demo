class Todo {
  int id;
  int userId;
  bool completed;
  String title;

  Todo(int id, int userId, bool completed, String title) {
    this.id = id;
    this.userId = userId;
    this.completed = completed;
    this.title = title;
  }

  // gelen json formatını Todo class yapısına çevirir
  Todo.fromJson(Map json) {
    id = json["id"];
    userId = json["userId"];
    completed = json["completed"];
    title = json["title"];
  }

  //todo classını json formatına çevir
  // veri tabanı insert için gerekli
  Map toJson() {
    return {"id": id, "userId": userId, "completed": completed, "title": title};
  }
}
