import 'package:air_bnb/support_files/colors.dart';
import 'package:flutter/material.dart';

import '../business_logic/bottom_sheet/login_screen_ui.dart';

class WishListsScreen extends StatefulWidget {
  const WishListsScreen({super.key});

  @override
  State<WishListsScreen> createState() => _WishListsScreenState();
}

class _WishListsScreenState extends State<WishListsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Edit',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: textColor),
                    ),
                  ),
                ],
              ),
              Text(
                'Wishlists',
                style: TextStyle(
                    fontSize: 30,
                    color: textColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              Text(
                'Log in to view your wishlists',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: textColor),
              ),
              const SizedBox(height: 10),
              Text(
                'You can create, view, or edit wishlists\nonce you\'ve logged in.',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                    color: textColor),
              ),
              const SizedBox(
                height: 60,
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      scrollControlDisabledMaxHeightRatio: 0.8,
                      context: context,
                      builder: (BuildContext context) {
                        return const LoginScreenUi();
                      });
                },
                style: TextButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: textButtonTextColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: const Size(130, 50),
                ),
                child: const Text('Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}