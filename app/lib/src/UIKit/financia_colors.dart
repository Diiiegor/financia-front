import 'package:flutter/material.dart';

enum FinanciaColors {
  buttonPrimary,
  buttonSecondary,
  buttonTertiary,
  buttonQuaternary,
  mainBg,
  bgSecondary,
  buttonPrimaryDisabled,
  buttonSecondaryDisabled
}

extension FinanciaColorsExtension on FinanciaColors {
  Color get color => switch (this) {
    FinanciaColors.buttonPrimary => const Color(0xFFD94A70),
    FinanciaColors.buttonSecondary => const Color(0xFF04BF55),
    FinanciaColors.buttonTertiary => const Color(0xFF4174D9),
    FinanciaColors.buttonQuaternary => const Color(0xFF000000),
    FinanciaColors.buttonPrimaryDisabled => const Color(0xFFD94A70).withOpacity(0.2),
    FinanciaColors.buttonSecondaryDisabled => const Color(0xFF04BF55).withOpacity(0.2),

    FinanciaColors.mainBg => const Color(0xFF15171C),
    FinanciaColors.bgSecondary => const Color(0xFF1D1F27),
  };
}