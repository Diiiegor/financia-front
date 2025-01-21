class Movement {
  final String concept;
  final DateTime createdAt;
  final int movementTypeId;
  final int userId;
  final int categoryId;
  final int id;
  final String description;
  final DateTime? deletedAt;
  final double amount;
  final MovementType movementType;
  final Category category;

  Movement({
    required this.concept,
    required this.createdAt,
    required this.movementTypeId,
    required this.userId,
    required this.categoryId,
    required this.id,
    required this.description,
    this.deletedAt,
    required this.amount,
    required this.movementType,
    required this.category,
  });

  factory Movement.fromJson(Map<String, dynamic> json) {
    return Movement(
      concept: json['concept'],
      createdAt: DateTime.parse(json['created_at']),
      movementTypeId: json['movement_type_id'],
      userId: json['user_id'],
      categoryId: json['category_id'],
      id: json['id'],
      description: json['description'],
      deletedAt: json['deleted_at'] != null 
          ? DateTime.parse(json['deleted_at'])
          : null,
      amount: json['amount'].toDouble(),
      movementType: MovementType.fromJson(json['movement_type']),
      category: Category.fromJson(json['category']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'concept': concept,
      'created_at': createdAt.toIso8601String(),
      'movement_type_id': movementTypeId,
      'user_id': userId,
      'category_id': categoryId,
      'id': id,
      'description': description,
      'deleted_at': deletedAt?.toIso8601String(),
      'amount': amount,
      'movement_type': movementType.toJson(),
      'category': category.toJson(),
    };
  }
}

class MovementType {
  final String code;
  final bool active;
  final int id;

  MovementType({
    required this.code,
    required this.active,
    required this.id,
  });

  factory MovementType.fromJson(Map<String, dynamic> json) {
    return MovementType(
      code: json['code'],
      active: json['active'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'active': active,
      'id': id,
    };
  }
}

class Category {
  final String name;
  final DateTime createdAt;
  final int? userId;
  final String description;
  final int id;
  final DateTime? deletedAt;
  final String icon;

  Category({
    required this.name,
    required this.createdAt,
    this.userId,
    required this.description,
    required this.id,
    this.deletedAt,
    required this.icon,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      userId: json['user_id'],
      description: json['description'],
      id: json['id'],
      icon: json['icon'],
      deletedAt: json['deleted_at'] != null 
          ? DateTime.parse(json['deleted_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'created_at': createdAt.toIso8601String(),
      'user_id': userId,
      'description': description,
      'id': id,
      'deleted_at': deletedAt?.toIso8601String(),
      'icon': icon,
    };
  }
}
