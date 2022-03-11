import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_demo/styles/Style.dart';
import 'package:pagination_demo/utils/Utils.dart';

import '../constants/Constants.dart';
import '../controllers/HomeController.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.find<HomeController>();

  final ScrollController _bookListController = ScrollController();

  void addScrollController() {
    _bookListController.addListener(
      () {
        if (_bookListController.position.maxScrollExtent ==
            _bookListController.position.pixels) {
          // fetch new data
          homeController.fetchNotes(context);
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    addScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildPrimaryAppBar(context, '$baseImagePath/avatar.png',
          onLeadingPress: () {}, onProfileTap: () {}),
      body: SafeArea(
        child: Obx(
          () => ListView.builder(
            controller: _bookListController,
            itemCount: homeController.booksOffset.value,
            itemBuilder: (context, index) {
              return buildBookList(context, index);
            },
          ),
        ),
      ),
    );
  }

  Padding buildBookList(BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.longestSide * 0.01,
        horizontal: MediaQuery.of(context).size.longestSide * 0.02,
      ),
      child: Column(
        children: [
          buildBookRow(
            context,
            '$baseImagePath/book.jpg',
            'Alice in Wonderland',
            'Read today',
          ),
          Obx(
            () => index == (homeController.booksOffset.value - 1) &&
                    homeController.isLoading.value
                ? SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        verticalSpace(context, 0.01),
                        displayLoadingIndicator(context),
                      ],
                    ),
                  )
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
