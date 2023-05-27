import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/presentation/home/view/home_screen_container.dart';
import 'package:pollo_education/presentation/onboarding/view/onboarding_screen.dart';
import 'package:pollo_education/utils/constants.dart';
import 'package:pollo_education/utils/design_system/r.dart';
import 'package:pollo_education/utils/get_size.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = '/';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreenView();
  }
}

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreenView> {
  var isLoading = false;
  String mobileNo = '';
  bool isOptSend = false;
  String otp = "";
  bool loaded = false;
  bool shake = false;
  bool valid = false;
  final OtpFieldController _otpController = OtpFieldController();

  void onCodeInput(String value) {
    if (otp.length < 5) {
      otp = value;
      setState(() {});
      if (otp.length == 5) {
        dismissKeyBoard();
      }
    }
  }

  void dismissKeyBoard() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  bool isButtonEnable() {
    if (mobileNo.length == 10) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.surface,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          child: Stack(
            children: [
              Container(
                height: getSize(context).height / 2,
                width: getSize(context).width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/student.jpg'),
                  ),
                ),
              ),
              isOptSend ? _buildOtp() : _buildLogin()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogin() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: R.color.blueColor.withOpacity(0.8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter mobile number to countinue',
                        style: TextStyle(
                            color: R.color.surface,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 32),
                      TextFormField(
                        style: TextStyle(color: R.color.surface),
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.phone_iphone,
                              color: R.color.greenColor,
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: R.color.surface)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: R.color.surface)),
                            labelText: '10-digit contact number',
                            labelStyle: TextStyle(color: R.color.surface)),
                        enabled: !isLoading,
                        onChanged: (value) {
                          mobileNo = value;
                          if (isButtonEnable()) {
                            dismissKeyBoard();
                            setState(() {});
                          }
                        },
                        onSaved: (value) {},
                        keyboardType: TextInputType.number,
                        maxLength: 10,
                      ),
                      const SizedBox(height: 32),
                      GestureDetector(
                        onTap: isButtonEnable()
                            ? () {
                                isOptSend = true;
                                setState(() {});
                              }
                            : null,
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: R.color.greenColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'Send Otp',
                              style: TextStyle(
                                  color: R.color.surface,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtp() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    color: R.color.blueColor.withOpacity(0.8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Enter 5 digit otp to countinue',
                        style: TextStyle(
                            color: R.color.surface,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 32),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        width: MediaQuery.of(context).size.width,
                        child: OTPTextField(
                          style: TextStyle(color: R.color.surface),
                          controller: _otpController,
                          fieldWidth: 50,
                          fieldStyle: FieldStyle.box,
                          otpFieldStyle: OtpFieldStyle(
                              borderColor: R.color.surface,
                              focusBorderColor: R.color.surface),
                          length: 5,
                          onChanged: (value) => otp = value,
                          onCompleted: (value) {
                            otp = value;
                          },
                        ),
                      ),
                      const SizedBox(height: 32),
                      GestureDetector(
                        onTap: otp.length == 5
                            ? () async {
                                await di<SharedPreferences>().setBool(
                                  Constant.instance.loggedInCacheKey,
                                  true,
                                );
                                di<GoRouter>()
                                    .go(HomeScreenContainer.routeName);
                              }
                            : null,
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: R.color.greenColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              'Verify Otp',
                              style: TextStyle(
                                  color: R.color.surface,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
