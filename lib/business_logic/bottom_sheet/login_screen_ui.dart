import 'package:air_bnb/support_files/colors.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class LoginScreenUi extends StatefulWidget {
  const LoginScreenUi({super.key});

  @override
  State<LoginScreenUi> createState() => _LoginScreenUiState();
}

class _LoginScreenUiState extends State<LoginScreenUi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.cancel)),
          centerTitle: true,
          title: Text(
            'Log in or sign up',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: textColor,
              fontSize: 15,
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5)),
                  child: const CountryCodePicker(
                    alignLeft: true,
                    enabled: true,
                    showDropDownButton: true,
                    initialSelection: 'in',
                  ),
                ),
                Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    child: TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10, top: 8),
                          hintText: 'Phone number',
                          border: InputBorder.none),
                    )),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'We\'ll call or text you to confirm your number. Standard message and data rates apply.',
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w400,
                      color: textColor),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: buttonColor,
                    foregroundColor: textButtonTextColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: const Size(360, 60),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Continue',
                    style: TextStyle(color: textButtonTextColor),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * .38,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      'or',
                      style: TextStyle(fontSize: 15, color: textColor),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Container(
                        height: 1,
                        width: MediaQuery.of(context).size.width * .38,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * .85, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.grey, width: 1)),
                  ),
                  icon: const ImageIcon(
                    AssetImage('assets/icons/message_icon.png'),
                    size: 20,
                    color: Colors.black,
                  ),
                  label: Row(
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      Text(
                        'Continue with email',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: textColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * .85, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.grey, width: 1)),
                  ),
                  icon: const ImageIcon(
                    AssetImage('assets/icons/apple_icon.png'),
                    size: 20,
                    color: Colors.black,
                  ),
                  label: Row(
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      Text(
                        'Continue with apple',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: textColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * .85, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.grey, width: 1)),
                  ),
                  icon: const ImageIcon(
                    AssetImage('assets/icons/google_icon.png'),
                    size: 23,
                    color: Colors.black,
                  ),
                  label: Row(
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      Text(
                        'Continue with google',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: textColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    minimumSize:
                        Size(MediaQuery.of(context).size.width * .85, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.grey, width: 1)),
                  ),
                  icon: const ImageIcon(
                    AssetImage('assets/icons/facebook_icon.png'),
                    size: 20,
                    color: Colors.black,
                  ),
                  label: Row(
                    children: [
                      const SizedBox(
                        width: 80,
                      ),
                      Text(
                        'Continue with facebook',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: textColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
