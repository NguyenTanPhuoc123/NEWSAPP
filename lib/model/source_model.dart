
class Source{
  String id;
  String name;
  
  Source(this.id,this.name);
  factory Source.fromJson(Map<String,dynamic> json){
    return Source(json["id"]!=null? json["id"]:"null",json["name"]);
  }
}