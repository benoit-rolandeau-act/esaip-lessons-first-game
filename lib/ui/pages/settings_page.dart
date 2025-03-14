import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsPage extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool>? onChanged;

  const SettingsPage({super.key, required this.isChecked, this.onChanged});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.inversePrimary,
        title: const Text('(TR) Settings'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 60.h),
              Container(
                height: 200.w,
                width: double.infinity,
                color: theme.colorScheme.primary,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 130.w),
                child: Text(
                  "Ceci est un texte",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontSize: 24.sp,
                    height: 0.83,
                    fontWeight: FontWeight.w900,
                    color: theme.colorScheme.onPrimary,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              Container(
                height: 130.w,
                width: double.infinity,
                color: theme.colorScheme.secondary,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(top: 12.w, left: 14.w),
                child: Text(
                  "Exemple",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSecondary,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Switch(value: isChecked, onChanged: onChanged),
            ],
          ),
        ),
      ),
    );
  }
}
