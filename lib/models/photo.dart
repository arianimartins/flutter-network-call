import 'package:json_annotation/json_annotation.dart';
part 'photo.g.dart';

@JsonSerializable()
class Photo {

  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  Photo(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  factory Photo.fromJson(Map<String,dynamic>json) => _$PhotoFromJson(json);
  Map<String,dynamic> toJson() => _$PhotoToJson(this);

  /*Photo.fromJson(Map<String, dynamic> json) {
    albumId = json['albumId'];
    id = json['id'];
    title = json['title'];
    url = json['url'];
    thumbnailUrl = json['thumbnailUrl'];
  }*/

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }*/
}