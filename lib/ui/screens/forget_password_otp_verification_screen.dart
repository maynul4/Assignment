import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_manager_task/ui/controller/forget_password_email_verification_controller.dart';
import 'package:task_manager_task/ui/controller/forget_password_otp_verification_controller.dart';
import 'package:task_manager_task/ui/screens/reset_password_screen.dart';
import '../widgets/screen_background.dart';
import 'package:get/get.dart';

class ForgetPasswordOtpVerificationScreen extends StatefulWidget {
  const ForgetPasswordOtpVerificationScreen({super.key});

  @override
  State<ForgetPasswordOtpVerificationScreen> createState() =>
      _ForgetPasswordOtpVerificationScreenState();
}

class _ForgetPasswordOtpVerificationScreenState
    extends State<ForgetPasswordOtpVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _otpTEController = TextEditingController();

  final ForgetPasswordEmailVerificationController
  forgetPasswordEmailVerificationController =
      Get.find<ForgetPasswordEmailVerificationController>();

  final ForgetPasswordOTPVerificationController
  forgetPasswordOTPVerificationController =
      Get.find<ForgetPasswordOTPVerificationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 150),
                  Text(
                    'PIN Verification',
                    style: TextTheme.of(context).headlineMedium,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'A 6 digit pin verification will be sent to your email address',
                    style: TextTheme.of(context).labelLarge,
                  ),
                  const SizedBox(height: 20),
                  PinCodeTextField(
                    length: 6,
                    keyboardType: TextInputType.number,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 40,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      selectedFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      activeColor: Colors.green,
                      inactiveColor: Colors.green,
                      selectedColor: Colors.red,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    backgroundColor: Colors.transparent,
                    enableActiveFill: true,
                    controller: _otpTEController,
                    appContext: context,
                    validator: (String? value) {
                      if (value!.trim().isEmpty == true) {
                        return 'Please Provide your OTP';
                      } else if (value.trim().length < 6) {
                        return 'Provide valid OTP';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _onTapSubmit,
                    child: GetBuilder<ForgetPasswordOTPVerificationController>(
                      builder: (controller) {
                        return Visibility(
                          visible: controller.isLoading == false,
                          replacement: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: CircularProgressIndicator(),
                          ),

                          child: Icon(Icons.arrow_circle_right_outlined),
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 20),

                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(text: 'Already Have an Account?'),
                          TextSpan(
                            text: ' Sign in',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = _onTapSignInButton,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onTapSubmit() {
    if (_formKey.currentState!.validate() == true) {
      forgetPasswordOTPVerify();
    }
  }

  Future<void> forgetPasswordOTPVerify() async {
    final String otp = _otpTEController.text;

    bool isSuccess = await forgetPasswordOTPVerificationController
        .forgetPasswordOTPVerify(otp: otp);
    if (isSuccess) {
      Get.offNamedUntil('/resetPassword',(route)=>false);
    }
    return;
  }

  _onTapSignInButton() {
    Get.offNamedUntil('/login',(route)=>false);
  }
}
