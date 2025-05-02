import 'package:get/get.dart';
import 'package:task_manager_task/ui/controller/add_new_task_controller.dart';
import 'package:task_manager_task/ui/controller/auth_controller.dart';
import 'package:task_manager_task/ui/controller/delete_task_controller.dart';
import 'package:task_manager_task/ui/controller/forget_password_email_verification_controller.dart';
import 'package:task_manager_task/ui/controller/forget_password_otp_verification_controller.dart';
import 'package:task_manager_task/ui/controller/get_task_by_status_controller.dart';
import 'package:task_manager_task/ui/controller/login_controller.dart';
import 'package:task_manager_task/ui/controller/reset_password_controller.dart';
import 'package:task_manager_task/ui/controller/signup_controller.dart';
import 'package:task_manager_task/ui/controller/task_count_by_status_controller.dart';
import 'package:task_manager_task/ui/controller/updateTaskController.dart';
import 'package:task_manager_task/ui/controller/update_profile_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
    Get.put(GetTaskByStatusController());
    Get.put(TaskCountByStatusController());
    Get.put(UpdateProfileController());
    Get.put(AuthController());
    Get.put(DeleteTaskController());
    Get.put(UpdateTaskController());
    Get.put(AddNewTaskController());
    Get.put(SignupController());
    Get.put(ForgetPasswordEmailVerificationController());
    Get.put(ForgetPasswordOTPVerificationController());
    Get.put(ResetPasswordController());
  }

}