import 'package:dartz/dartz.dart';
import 'package:promina/core/error/failure.dart';
import 'package:promina/features/gallery/domain/entities/my_gallery.dart';

abstract class BaseMyGalleryRepository
{
  Future<Either<Failure,List<Images>>>getMyGallery();
}