import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pagination_demo/constants/Constants.dart';

import '../colors/colors.dart';
import '../utils/Utils.dart';

AppBar buildPrimaryAppBar(context, title, profilePicturePath,
    {required onLeadingPress, required Function onProfileTap}) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: primaryColor,
    leading: IconButton(
      icon: Icon(Icons.menu),
      onPressed: onLeadingPress,
    ),
    title: Text(
      title,
    ),
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.longestSide * 0.02,
        ),
        child: InkWell(
          child: Align(
            alignment: Alignment.centerRight,
            child: loadLocalImageRound(
              imagePath: profilePicturePath,
              height: MediaQuery.of(context).size.aspectRatio * 80,
              width: MediaQuery.of(context).size.aspectRatio * 80,
              boxFit: BoxFit.cover,
            ),
          ),
          onTap: () => onProfileTap(),
        ),
      ),
    ],
  );
}

Widget displayLoadingIndicator(BuildContext context) {
  return Center(
    child: Column(
      children: [
        Platform.isAndroid
            ? CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(primaryColor),
                backgroundColor: Colors.transparent,
              )
            : CupertinoActivityIndicator(
                radius: 10,
              ),
        verticalSpace(context, 0.02),
        Text(
          'loading...',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    ),
  );
}

Row buildBookRow(
    BuildContext context, String imagePath, String bookName, String lastRead) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      loadLocalImageRound(
          imagePath: imagePath,
          height: MediaQuery.of(context).size.longestSide * 0.05,
          width: MediaQuery.of(context).size.longestSide * 0.05,
          boxFit: BoxFit.cover),
      horizontalSpace(context, 0.04),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              bookName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            verticalSpace(context, 0.005),
            Text(
              lastRead,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            verticalSpace(context, 0.002),
            Divider(),
          ],
        ),
      )
    ],
  );
}
