class Note {
  int? id;
  String? title;
  String? description;
  String? date;

  Note({this.id, this.title, this.description,this.date});

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      date: json['date'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['date'] = this.date;
    return data;
  }
}
