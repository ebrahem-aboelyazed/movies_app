import 'package:flutter/material.dart';
import 'package:movies_app/gen/assets.gen.dart';
import 'package:movies_app/l10n/l10n.dart';
import 'package:movies_app/utils/utils.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Assets.svg.icEmptyData.svg(
              height: context.heightPercentage(0.4),
            ),
            Center(
              child: Text(
                context.l10n.no_results_found,
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
