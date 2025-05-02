import 'package:get/get.dart';
import 'package:task_manager_task/ui/controller/forget_password_email_verification_controller.dart';
import 'package:task_manager_task/ui/controller/forget_password_otp_verification_controller.dart';
import '../../data/service/network_client.dart';
import '../../data/utils/urls.dart';

class ResetPasswordController extends GetxController {
  ForgetPasswordEmailVerificationController
  forgetPasswordEmailVerificationController =
      Get.find<ForgetPasswordEmailVerificationController>();
  ForgetPasswordOTPVerificationController
  forgetPasswordOTPVerificationController =
      Get.find<ForgetPasswordOTPVerificationController>();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<bool> resetPassword({required String password}) async {
    bool isSuccess = false;
    _isLoading = true;
    update();

    String email = forgetPasswordEmailVerificationController.email;
    String otp = forgetPasswordOTPVerificationController.otp;

    Map<String, dynamic> requestBody = {
      "email": email,
      "OTP": otp,
      "password": password,
    };
    String url = Urls.resetPasswordRrl;
    NetworkResponse response = await NetworkClient.postRequest(
      url: url,
      body: requestBody,
    );
    if (response.statusCode == 200) {
      isSuccess = true;
      Get.snackbar('Congratulations', 'Password reset successful');
    } else {
      Get.snackbar('Failed!', '${response.errorMessage}');
    }
    _isLoading = false;
    update();
    return isSuccess;
  }
}
