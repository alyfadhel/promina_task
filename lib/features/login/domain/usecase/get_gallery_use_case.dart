import 'package:dartz/dartz.dart';
import 'package:promina/core/error/failure.dart';
import 'package:promina/core/usecase/base_usecase.dart';
import 'package:promina/features/login/domain/entities/login_entity.dart';
import 'package:promina/features/login/domain/repository/base_login_repository.dart';

class GetGalleryUseCase extends BaseUseCase<List<Formdata>,NoParameters>
{
  final BaseLoginRepository baseLoginRepository;

  GetGalleryUseCase(this.baseLoginRepository);
  @override
  Future<Either<Failure, List<Formdata>>> call(NoParameters parameters) async{
   return await baseLoginRepository.getGallery();
  }

}