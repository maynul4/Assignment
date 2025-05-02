import 'package:get/get.dart';
import 'package:task_manager_task/ui/controller/forget_password_email_verification_controller.dart';

import '../../data/service/network_client.dart';
import '../../data/utils/urls.dart';

class ForgetPasswordOTPVerificationController extends GetxController{

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String _otp = '';
  String get otp => _otp;

  ForgetPasswordEmailVerificationController forgetPasswordEmailVerificationController = Get.find<ForgetPasswordEmailVerificationController>();

  Future<bool> forgetPasswordOTPVerify({required String otp}) async {
    bool isSuccess = false;
    String email = forgetPasswordEmailVerificationController.email;

    _isLoading = true;
    update();

    String url = Urls.forgetPasswordEmailAndOPTVerifyUrl(
      email: email,
      otp: otp,
    );

    NetworkResponse response = await NetworkClient.getRequest(url: url);

    if (response.statusCode == 200) {
      _otp = otp;
      isSuccess = true;
    } else {
      Get.snackbar('Worning!', 'Invalid Otp');
      //will be managed from network client
    }
    _isLoading = false;
    update();
    return isSuccess;
  }

}