import 'package:promina/features/gallery/domain/entities/my_gallery.dart';

abstract class MyGalleryStates{}

class InitialMyGalleryState extends MyGalleryStates {}

class GetMyGalleryLoadingState extends MyGalleryStates{}

class GetMyGallerySuccessState extends MyGalleryStates{
  final List<Images>images;

  GetMyGallerySuccessState(this.images);
}

class GetMyGalleryErrorState extends MyGalleryStates
{
  final String message;

  GetMyGalleryErrorState(this.message);
}