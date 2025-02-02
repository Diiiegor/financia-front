import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/src/UIKit/financia_colors.dart';

class FinanciaAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback onBack;

  const FinanciaAppBar({super.key, required this.title, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: FinanciaColors.mainBg.color,
      scrolledUnderElevation: 0.0,
      title: Text(title,style: const TextStyle(color: Colors.white),),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back,color: Colors.white,),
        onPressed: onBack,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
