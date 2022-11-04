import 'package:equatable/equatable.dart';

class MyGallery extends Equatable
{
  final String? status;
  final GalleryData? data;
  final Message? message;

 const MyGallery({
   required this.status,
   required this.data,
   required this.message
 });
  @override
  List<Object?> get props => [
    status,
    data,
    message,
  ];

}


class GalleryData extends Equatable
{
 final List<Images>?images;

 const GalleryData({
    required this.images,
  });
  @override
  List<Object?> get props => [images];
}


class Images extends Equatable {
  final String images;

 const Images({
    required this.images,
  });
  @override
  List<Object?> get props => [images];

}


class Message extends Equatable
{
  final String? message;

 const Message({
    required this.message,
  });
  @override
  List<Object?> get props => [message];

}