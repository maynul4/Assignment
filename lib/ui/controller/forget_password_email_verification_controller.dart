import 'package:get/get.dart';
import 'package:task_manager_task/ui/screens/forget_password_otp_verification_screen.dart';
import '../../data/service/network_client.dart';
import '../../data/utils/urls.dart';

class ForgetPasswordEmailVerificationController extends GetxController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String _email = '';

  String get email => _email;

  Future<bool> forgetPasswordEmailVerify({required String email}) async {
   bool isSuccess = false;
    _isLoading = true;
    update();
    String url = Urls.forgetPasswordEmailVerifyUrl(email);

    NetworkResponse response = await NetworkClient.getRequest(url: url);
    if (response.statusCode == 200) {
      _email = email;
      isSuccess = true;
    } else {
      Get.snackbar('Failed', 'This mail is not registered');
    }
    _isLoading = false;
    update();
    return isSuccess;
  }
}
