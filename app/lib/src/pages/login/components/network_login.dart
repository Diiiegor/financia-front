import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NetworkLogin extends StatelessWidget {
  @override
  Widget build(context) {
    return Container(
      width: double.infinity,
      child: Row( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(const Color(0xFF15171C))),
            onPressed: (){},
            child: Container(
              width: 100,
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/google.svg',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text('Google',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)
                ],
              ),
            ) ,
          ),
          const SizedBox(width: 20,),
          ElevatedButton(
            style: ButtonStyle(backgroundColor: WidgetStateProperty.all(const Color(0xFF15171C))),
            onPressed: (){},
            child: Container(
              width: 100,
              child: Row(
                children: [
                 SvgPicture.asset(
                    'assets/images/facebook.svg',
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(width: 8),
                  const Text('Facebook',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ),
        ],
         ));
  }
}