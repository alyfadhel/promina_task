import 'package:promina/core/network/dio_helper.dart';
import 'package:promina/core/network/end-points.dart';
import 'package:promina/features/gallery/data/model/my_gallery_model.dart';

abstract class BaseMyGalleryDataSource
{
  Future<List<ImagesModel>>getMyGallery();
}

class GalleryDataSource extends BaseMyGalleryDataSource
{
  final DioHelper dioHelper;

  GalleryDataSource(this.dioHelper);
  @override
  Future<List<ImagesModel>> getMyGallery() async{
    final response = await dioHelper.get(
        endPoint: myGallery,
      token: token,
    );
    
    return List<ImagesModel>.from((response['images']as List)
    .map((e) => ImagesModel.fromJson(e)));
  }

}