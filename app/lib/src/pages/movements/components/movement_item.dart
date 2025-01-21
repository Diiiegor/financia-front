import 'package:app/src/pages/movements/models/movement.dart';
import 'package:flutter/material.dart';

class MovementItem extends StatelessWidget {

  const MovementItem({
    super.key,
    required this.movement
  });

  
  final Movement movement;
  bool get income => movement.movementTypeId == 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 28, 31, 38),
          borderRadius: BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            // BoxShadow(color: Colors.black)
          ]),
      width: double.infinity,
      height: 80,
      child: Row(
        children: [
           Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                this.income ? Icons.upload_outlined :Icons.download_outlined,
                size: 30,
                color: this.income ? Colors.green : Colors.red,
              ),
              const SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Text(
                    this.movement.concept,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                   Text(this.movement.description, style: TextStyle(color: Colors.white))
                ],
              )
            ],
          ),
          Expanded(
            child: Container(),
          ),
           Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(this.income ?  this.movement.amount.toString() : "-${this.movement.amount.toString()}",
                  style: TextStyle(
                      color: this.income ? Colors.green : Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              const SizedBox(
                width: 15,
              ),
               CircleAvatar(
                backgroundColor: Color.fromARGB(255, 50, 53, 62),
                child: Text(movement.category.icon)
              )
            ],
          )
        ],
      ),
    );
  }
}
