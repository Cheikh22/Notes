class Note {
  int? id;
  String? title;
  String? description;

  Note({this.id,this.title,this.description});

  factory Note.fromJson(Map<String,dynamic> json){
    return Note(
      id:json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson(){
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    return data;
  }
}