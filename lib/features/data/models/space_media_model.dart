import '../../domain/entities/space_media_entity.dart';

class SpaceMediaModel extends SpaceMediaEntity{
  SpaceMediaModel({
 required final String mediaType,
 required final String description,
 required final String title,
 required final String mediaUrl,
  }):super(
    description: description,mediaType: mediaType,title: title,mediaUrl: mediaUrl
  );
  factory SpaceMediaModel.fromJson(Map<String,dynamic>json)=>SpaceMediaModel(description: json['explanation'],mediaType: json['media_type'],title: json['title'],mediaUrl: json['url'],);
}