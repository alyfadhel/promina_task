import 'package:promina/features/gallery/domain/entities/my_gallery.dart';

class MyGalleryModel extends MyGallery
{
 const MyGalleryModel({
    required super.status,
    required super.data,
    required super.message,
  });

 factory MyGalleryModel.fromJson(Map<String,dynamic>json)
 {
   return MyGalleryModel(
       status: json['status'],
       data: json['data'] != null ? GalleryDataModel.fromJson(json['data']) : null,
       message: json['message'] != null ? MessageModel.fromJson(json['message']) : null,
   );
 }

}


class GalleryDataModel extends GalleryData
{
 const GalleryDataModel({
   required super.images,
 });

 factory GalleryDataModel.fromJson(Map<String,dynamic>json)
 {
   List<ImagesModel>images = [];
   if(json['images'] != null){
     json['images'].forEach((element)
     {
       images.add(ImagesModel.fromJson(element));
     });
   }
   return GalleryDataModel(
       images: images,
   );
 }
}


class ImagesModel extends Images
{
 const ImagesModel({
   required super.images,
 });

 factory ImagesModel.fromJson(Map<String,dynamic>json)
 {
   return ImagesModel(
       images: json['images'],
   );
 }

}

class MessageModel extends Message
{
 const MessageModel({
   required super.message,
 });

 factory MessageModel.fromJson(Map<String,dynamic>json)
 {
   return MessageModel(
       message: json['message'],
   );
 }

}