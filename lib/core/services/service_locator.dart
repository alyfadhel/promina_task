import 'package:get_it/get_it.dart';
import 'package:promina/core/network/dio_helper.dart';
import 'package:promina/features/gallery/data/datasource/base_my_gallery_remote_data_source.dart';
import 'package:promina/features/gallery/data/repository/my_gallery_repository.dart';
import 'package:promina/features/gallery/domain/repository/base_my_gallery_repository.dart';
import 'package:promina/features/gallery/domain/usecase/get_my_gallery_use_case.dart';
import 'package:promina/features/gallery/presentation/controller/cubit.dart';
import 'package:promina/features/login/data/datasource/base_login_remote_data_source.dart';
import 'package:promina/features/login/data/repository/login_repository.dart';
import 'package:promina/features/login/domain/repository/base_login_repository.dart';
import 'package:promina/features/login/domain/usecase/get_gallery_use_case.dart';
import 'package:promina/features/login/domain/usecase/get_login_user_usecase.dart';
import 'package:promina/features/login/presentation/controller/cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class ServiceLocator
{
  Future<void>init()async
  {
    sl.registerFactory(() => MyGalleryCubit(sl()));

    sl.registerLazySingleton(() => GetMyGalleryUseCase(sl()));

    sl.registerLazySingleton<BaseMyGalleryRepository>(
            () => MyGalleryRepository(sl()));

    sl.registerFactory<BaseMyGalleryDataSource>(
            () => GalleryDataSource(sl()));
    /*
    Login//////////////////////////////////////////////////
     */
    sl.registerFactory(() => LoginCubit(sl()));

    sl.registerLazySingleton(() => GetUserLoginUseCase(sl()));

    sl.registerLazySingleton<BaseLoginRepository>(
            () => LoginRepository(sl()));

    sl.registerLazySingleton<BaseLoginRemoteDataSource>(
            () => LoginRemoteDataSource(sl()));

    sl.registerLazySingleton<DioHelper>(
          () => DioHelperImpl(),
    );

    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(
            () => sharedPreferences);
  }
}