import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:app/src/UIKit/financia_colors.dart';

class ShimmerIncomesSpendingsChart extends StatelessWidget {
  const ShimmerIncomesSpendingsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Shimmer.fromColors(
        baseColor: FinanciaColors.shimmerBase.color,
        highlightColor: FinanciaColors.shimmerHighlight.color,
        child: Container(
          width: double.infinity,
          height: 100.0,
          color: Colors.grey.shade300,
        ),
      ),
    );
  }
}
