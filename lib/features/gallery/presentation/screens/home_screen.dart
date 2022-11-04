import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/core/resources/assets_manager.dart';
import 'package:promina/core/services/service_locator.dart';
import 'package:promina/features/gallery/domain/entities/my_gallery.dart';
import 'package:promina/features/gallery/presentation/controller/cubit.dart';
import 'package:promina/features/gallery/presentation/controller/states.dart';
import 'package:promina/features/login/domain/entities/login_entity.dart';
import 'package:promina/features/login/presentation/controller/cubit.dart';
import 'package:promina/features/login/presentation/controller/states.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<MyGalleryCubit>()..getMyGallery(),
      child: BlocConsumer<MyGalleryCubit,MyGalleryStates>(
        listener: (context, state) {

        },
        builder: (context, state) {
          var cubit = MyGalleryCubit.get(context);
          return Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.home),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(
                              height: 40,
                            ),
                            Text(
                              "Welcome",
                              style: TextStyle(fontSize: 28),
                            ),
                            Text(
                              "Mina",
                              style: TextStyle(fontSize: 28),
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(
                              "https://cdn.dribbble.com/users/113337/screenshots/3957971/media/ecb958b8f07616848e99a3aeb0f04c9d.jpg?compress=1&resize=400x300&vertical=top"),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white,
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.login_outlined),
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text("log out")
                                    ],
                                  ))),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 20,
                          width: MediaQuery.of(context).size.width / 2.5,
                          child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              color: Colors.white,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Icon(Icons.cloud_upload),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Text("upload")
                                    ],
                                  ))),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 248,
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: GridView.builder(
                      shrinkWrap: false,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) => getGallery(cubit.images),
                      itemCount: cubit.images.length,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget getGallery(List<Images>images)=>Card(
  elevation: 5,
  margin: const EdgeInsets.all(10),
  semanticContainer: true,
  clipBehavior: Clip.antiAliasWithSaveLayer,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
  ),
  child: Image.network(
    'https://technichal.prominaagency.com/api/collections/${images[0].images}',
    fit: BoxFit.fill,
  ),
);