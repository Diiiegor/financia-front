import 'package:flutter/material.dart';
import 'package:app/src/UIKit/financia_colors.dart';

class FinanciaButton extends StatelessWidget {
  const FinanciaButton({super.key, required this.text, required this.onPressed, this.color = FinanciaColors.buttonPrimary,this.size});
  final String text;
  final VoidCallback onPressed;
  final FinanciaColors color;
  final Size? size;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
       boxShadow: [
        BoxShadow(
          color: color.color.withOpacity(0.5),
          blurRadius: 5,
        )
       ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: size,
          backgroundColor: color.color,
        ),
        child: Text(text,style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
    );
  }
}