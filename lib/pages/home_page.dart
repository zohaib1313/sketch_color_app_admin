import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sketch_color_app/common/app_pop_ups.dart';
import 'package:sketch_color_app/common/common_widgets.dart';
import 'package:sketch_color_app/common/loading_widget.dart';
import 'package:sketch_color_app/common/user_defaults.dart';
import 'package:sketch_color_app/controllers/home_controller.dart';
import 'package:sketch_color_app/pages/login_page.dart';

import '../common/app_styles.dart';

class MyHomePage extends GetView<HomeController> {
  const MyHomePage({Key? key}) : super(key: key);
  static const id = '/myHomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.alphaGrey,
      appBar: myAppBar(title: 'Gallery', goBack: false, actions: [
        InkWell(
          onTap: () {
            UserDefaults.clearAll();
            Get.toNamed(LoginPage.id);
          },
          child: Row(
            children: [
              Text("Logout", style: AppTextStyles.textStyleNormalBodyXSmall),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.logout),
              )
            ],
          ),
        )
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.pickAndUploadImages();
          },
          child: const Icon(Icons.add)),
      body: GetX<HomeController>(
        initState: (_) {},
        builder: (logic) {
          return Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 20.w,
                        right: 20.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40.r),
                            topRight: Radius.circular(40.r)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('free_images')
                              .doc('images')
                              .snapshots(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return const Center(
                                  child: Text('Something went wrong'));
                            }
                            if (snapshot.data?.data() == null) {
                              return const Center(child: Text('No record'));
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(child: Text("Loading"));
                            }
                            Map<String, dynamic> mMap =
                                snapshot.data!.data() as Map<String, dynamic>;

                            // e.value['name']
                            return ListView(
                              children: mMap.entries
                                  .map(
                                    (e) => InkWell(
                                      onLongPress: () {
                                        AppPopUps.showConfirmDialog(
                                            title: 'Confirm',
                                            message:
                                                'Are you sure you want to delete this image?',
                                            onSubmit: () {
                                              //to close dialog.
                                              Get.back();
                                              controller.deleteImage(
                                                  docId: e.key,
                                                  onComplete: () {});
                                            });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(10),
                                        child: NetworkPlainImage(
                                          url: e.value,
                                          height: 600.h,
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              if (controller.isLoading.isTrue) LoadingWidget()
            ],
          );
        },
      ),
    );
  }
}
