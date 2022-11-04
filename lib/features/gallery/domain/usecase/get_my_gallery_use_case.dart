import 'package:dartz/dartz.dart';
import 'package:promina/core/error/failure.dart';
import 'package:promina/core/usecase/base_usecase.dart';
import 'package:promina/features/gallery/domain/entities/my_gallery.dart';
import 'package:promina/features/gallery/domain/repository/base_my_gallery_repository.dart';

class GetMyGalleryUseCase extends BaseUseCase<List<Images>,NoParameters>
{
  final BaseMyGalleryRepository baseMyGalleryRepository;

  GetMyGalleryUseCase(this.baseMyGalleryRepository);
  @override
  Future<Either<Failure, List<Images>>> call(NoParameters parameters) async{
    return await baseMyGalleryRepository.getMyGallery();
  }

}