import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/user_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserLine extends StatelessWidget {
  final UserModel user;
  final VoidCallback onPressed;
  final VoidCallback onDelete;

  const UserLine({super.key, required this.user, required this.onPressed, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            Icon(Icons.account_circle, color: theme.colorScheme.primary, size: 40.w),
            SizedBox(width: 22.w),
            Text(
              "${user.firstName} ${user.lastName}",
              style: theme.textTheme.bodyMedium?.copyWith(
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            IconButton(
              style: IconButton.styleFrom(
                backgroundColor: theme.colorScheme.surfaceContainer,
                fixedSize: Size.fromWidth(40.w),
              ),
              onPressed: onDelete,
              iconSize: 24.w,
              icon: Icon(Icons.delete_outline, color: theme.colorScheme.primary),
            ),
          ],
        ),
      ),
    );
  }
}
