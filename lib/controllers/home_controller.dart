import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:sketch_color_app/common/app_pop_ups.dart';
import 'package:sketch_color_app/common/app_route.dart';
import 'package:uuid/uuid.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;

  Future<void> deleteImage({required String docId, required onComplete}) async {
    try {
      isLoading.value = true;
      await FirebaseFirestore.instance
          .collection('free_images')
          .doc('images')
          .set({docId: FieldValue.delete()}, SetOptions(merge: true));
      isLoading.value = false;
      AppPopUps.showSnackBar(message: 'Image deleted', context: myContext!);
    } catch (e) {
      isLoading.value = false;
      AppPopUps.showSnackBar(
          message: 'Failed to delete images ${e.toString()}',
          context: myContext!);
    } finally {
      isLoading.value = false;
    }
  }

  void pickAndUploadImages() async {
    try {
      isLoading.value = true;
      List<String> _downloadUrls = [];
      final List<XFile> images = await ImagePicker().pickMultiImage();
      await Future.forEach(images, (image) async {
        Reference ref =
            FirebaseStorage.instance.ref().child(path.basename(image.path));
        final UploadTask uploadTask = ref.putFile(File(image.path));
        final TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
        final url = await taskSnapshot.ref.getDownloadURL();
        _downloadUrls.add(url);
      });

      ///setting images
      await Future.forEach(_downloadUrls, (element) async {
        await FirebaseFirestore.instance
            .collection('free_images')
            .doc('images')
            .set(
                {const Uuid().v4(): element.toString()},
                SetOptions(
                  merge: true,
                ));
      });
    } catch (e) {
      isLoading.value = false;
      print("failed to upload images");
      AppPopUps.showSnackBar(
          message: 'Failed to upload images ${e.toString()}',
          context: myContext!);
    } finally {
      isLoading.value = false;
    }
  }
}
