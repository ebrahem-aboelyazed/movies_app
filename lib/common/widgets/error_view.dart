import 'package:flutter/material.dart';
import 'package:movies_app/gen/assets.gen.dart';
import 'package:movies_app/utils/utils.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({
    required this.message,
    super.key,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Assets.svg.icNoData.svg(
              height: context.heightPercentage(0.4),
            ),
            Center(
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
