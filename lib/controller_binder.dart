import 'package:get/get.dart';
import 'package:task_manager_task/ui/controller/get_task_by_status_controller.dart';
import 'package:task_manager_task/ui/controller/login_controller.dart';
import 'package:task_manager_task/ui/controller/task_count_by_status_controller.dart';
import 'package:task_manager_task/ui/controller/update_profile_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>LoginController());
    Get.lazyPut(()=> GetTaskByStatusController());
    Get.lazyPut(()=>TaskCountByStatusController());
    Get.lazyPut(()=>UpdateProfileController());
  }

}