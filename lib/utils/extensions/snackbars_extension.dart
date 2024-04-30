import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/core.dart';
import 'package:movies_app/utils/utils.dart';

extension SnackBarsExtensions on BuildContext {
  void showErrorSnackBar(Failure failure) {
    EasyThrottle.throttle(
      'error_snack_bar',
      const Duration(seconds: 4),
      () {
        ScaffoldMessenger.of(this).showSnackBar(
          SnackBar(
            content: Text(
              failure.message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            backgroundColor: Colors.redAccent,
          ),
        );
      },
    );
  }

  void showWarningSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.blueGrey,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.yellowAccent,
      ),
    );
  }

  void showMessageSnackBar(String message) {
    EasyThrottle.throttle(
      'message_snackBar',
      const Duration(seconds: 2),
      () {
        ScaffoldMessenger.of(this).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            backgroundColor: Colors.blueGrey,
          ),
        );
      },
    );
  }

  void showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  void showInfoSnackBar(String message) {
    EasyThrottle.throttle(
      'info_snackBar',
      const Duration(seconds: 2),
      () {
        ScaffoldMessenger.of(this).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 1),
            content: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            backgroundColor: AppColors.lightPrimaryColor,
          ),
        );
      },
    );
  }
}
