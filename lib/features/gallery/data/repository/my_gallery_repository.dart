import 'package:dartz/dartz.dart';
import 'package:promina/core/error/exception.dart';
import 'package:promina/core/error/failure.dart';
import 'package:promina/features/gallery/data/datasource/base_my_gallery_remote_data_source.dart';
import 'package:promina/features/gallery/domain/entities/my_gallery.dart';
import 'package:promina/features/gallery/domain/repository/base_my_gallery_repository.dart';

class MyGalleryRepository extends BaseMyGalleryRepository
{
  final BaseMyGalleryDataSource baseMyGalleryDataSource;

  MyGalleryRepository(this.baseMyGalleryDataSource);
  @override
  Future<Either<Failure, List<Images>>> getMyGallery() async{
    final result = await baseMyGalleryDataSource.getMyGallery();

    try{
      return Right(result);
    }on ServerException catch(failure){
      return Left(ServerFailure(failure.statusErrorMessageModel.message));
    }
  }

}