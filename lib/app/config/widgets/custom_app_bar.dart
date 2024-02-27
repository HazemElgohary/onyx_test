import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:onyx_test/app/config/theme.dart';
import 'package:onyx_test/app/helpers/keys.dart';
import 'package:onyx_test/app/helpers/prefs.dart';

class CustomAppBar extends StatelessWidget {
  final String imagePath;

  const CustomAppBar({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    String userId = Prefs.getString(PrefsKeys.userName);

    List<String> words = userId.split(" ");

    String firstName = words.isNotEmpty ? words.first : "";

    String lastName = words.length > 1 ? words.last : "";

    return AppBar(
      flexibleSpace: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            )),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(18),
              ),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.width / 10),
                Text(
                  firstName,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 20,
                  ),
                ),
                Text(
                  lastName,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
