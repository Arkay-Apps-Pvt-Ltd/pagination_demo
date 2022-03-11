import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_demo/utils/Utils.dart';

class HomeController extends GetxController {
  var isLoading = false.obs, booksOffset = 15.obs, booksLimit = 10;

  fetchNotes(BuildContext context) {
    if (!isLoading.value) {
      isLoading.value = true;

      Future.delayed(
        Duration(seconds: 2),
      ).then(
        (value) {
          isLoading.value = false;
          if (booksOffset.value > 30) {
            showInfoToast(context, 'No more data to show');
            return;
          } else {
            booksOffset.value += booksLimit;
          }
          booksOffset.value += booksLimit;
        },
      );
    }
    update();
  }
}
