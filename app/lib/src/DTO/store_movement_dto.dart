import 'dart:convert';

StoreMovementDto welcomeFromJson(String str) => StoreMovementDto.fromJson(json.decode(str));
String welcomeToJson(StoreMovementDto data) => json.encode(data.toJson());

class StoreMovementDto {
    String concept;
    String description;
    double amount;
    int movementTypeId;
    int categoryId;

    StoreMovementDto({
        required this.concept,
        required this.description,
        required this.amount,
        required this.movementTypeId,
        required this.categoryId,
    });

    factory StoreMovementDto.fromJson(Map<String, dynamic> json) => StoreMovementDto(
        concept: json["concept"],
        description: json["description"],
        amount: json["amount"],
        movementTypeId: json["movement_type_id"],
        categoryId: json["category_id"],
    );

    Map<String, dynamic> toJson() => {
        "concept": concept,
        "description": description,
        "amount": amount,
        "movement_type_id": movementTypeId,
        "category_id": categoryId,
    };
}
