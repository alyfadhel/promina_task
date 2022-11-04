import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/core/usecase/base_usecase.dart';
import 'package:promina/features/gallery/domain/entities/my_gallery.dart';
import 'package:promina/features/gallery/domain/usecase/get_my_gallery_use_case.dart';
import 'package:promina/features/gallery/presentation/controller/states.dart';

class MyGalleryCubit extends Cubit<MyGalleryStates>
{
  final GetMyGalleryUseCase getMyGalleryUseCase;
  MyGalleryCubit(
      this.getMyGalleryUseCase
      ): super(InitialMyGalleryState());

  static MyGalleryCubit get(context)=> BlocProvider.of(context);


  List<Images>images = [];

  Future<void>getMyGallery()async
  {
    final result = await getMyGalleryUseCase(const NoParameters());

    result.fold(
            (l) =>  emit(GetMyGalleryErrorState(l.message)),
            (r) => emit(GetMyGallerySuccessState(r)),
    );
  }

}