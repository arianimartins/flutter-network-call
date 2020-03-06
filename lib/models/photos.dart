import 'package:json_annotation/json_annotation.dart';

import 'photo.dart';
part 'photos.g.dart';

@JsonSerializable()
class Photos {
  List<Photo> photos;

  Photos(this.photos);

  factory Photos.fromJson(List<dynamic> json){
    return Photos(json.map((i) => Photo.fromJson(i as Map<String, dynamic>))
        .toList());
    /*return Photos(
        photos: json.map((i) => Photo.fromJson(i as Map<String, dynamic>))
            .toList()
    );*/
  }
}