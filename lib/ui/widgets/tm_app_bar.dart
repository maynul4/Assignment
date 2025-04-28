import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:logger/logger.dart';
import 'package:task_manager_task/ui/controller/auth_controller.dart';
import 'package:task_manager_task/ui/controller/update_profile_controller.dart';

class TMAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? fromProfileScreen;
  const TMAppBar({super.key, this.fromProfileScreen,});

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return AppBar(
      backgroundColor: Colors.green,
      title: GestureDetector(
        onTap: () {
          if (fromProfileScreen ?? false) {
            // that means this is not update profile screen not true
            return;
          }
          _onTapProfileUpdate(context);
        },

        child: GetBuilder<UpdateProfileController>(
          builder: (controller) {

            return Row(
              children: [
                CircleAvatar(
                  radius: 16,
                  backgroundImage:
                      shouldShowImage(AuthController.userInfoModel?.photo)
                          ? MemoryImage(
                            base64Decode(AuthController.userInfoModel?.photo ?? ''),
                          )
                          : null,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fullName(
                          firstName: AuthController.userInfoModel?.firstName??'' ,
                          lastName: AuthController.userInfoModel?.lastName?? '',
                        ),
                        style: theme.bodyLarge?.copyWith(color: Colors.white),
                      ),
                      Text(
                        AuthController.userInfoModel!.email,
                        style: theme.bodySmall?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),

                IconButton(
                  onPressed: () {
                    _onTapLogOut(context);
                  },
                  icon: Icon(Icons.logout),
                ),
              ],
            );
          }
        ),
      ),
    );
  }

  _onTapLogOut(context) async {
    await AuthController.clearUserData();
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  void _onTapProfileUpdate(BuildContext context) {
    Navigator.pushNamed(
      context,
      '/UpdateProfileScreen',
    );
  }

  fullName({required String firstName, required String lastName}) {
    return '$firstName $lastName';
  }

  bool shouldShowImage(String? photo) {
    return photo != null && photo.isNotEmpty;
  }
}
