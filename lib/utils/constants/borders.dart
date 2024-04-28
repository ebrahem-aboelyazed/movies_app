import 'package:flutter/material.dart';
import 'package:movies_app/utils/utils.dart';

class Borders {
  Borders._();

  static OutlineInputBorder searchBorder = OutlineInputBorder(
    borderSide: const BorderSide(color: AppColors.borderColor),
    borderRadius: BorderRadius.circular(28),
  );
}
