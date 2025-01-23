import 'package:app/src/DTO/login/LoginDTO.dart';
import 'package:app/src/services/BaseService.dart';
import 'package:app/src/pages/movements/models/movement.dart';
import 'package:app/src/DTO/CategoryDTO.dart';
import 'package:app/src/DTO/store_movement_dto.dart';
class Apiservice extends Baseservice {
  //This method is used to login
  Future<String?> login(Logindto loginDTO) async {
    try {
      final response = await post('/auth/login', loginDTO.toMap());
      if (response.body["data"]?["token"] != null) {
        return response.body["data"]["token"];
      }
      return response.body;
    } catch (e) {
      return null;
    }
  }

  //This method is used to validate a token
  Future<bool> validateToken(String token) async {
    final response = await post('/auth/validate-token', null,
        headers: {"Authorization": "Bearer $token"});
    if (response.body["data"]?["success"] == true) {
      return true;
    }
    return false;
  }

  //This method is used to get a list of movements
  Future<List<Movement>> getMovements(String token) async {
    final response = await get('/movements/index', headers: {"Authorization": "Bearer $token"});
    if (response.body["response"] != null) {
      return List<Movement>.from(
        response.body["response"].map((m) => Movement.fromJson(m))
      );
    } 
    return [];
  }

  //This method is used to store a new category
  Future<CategoryDTO?> storeCategory(String token,CategoryDTO storeCategoryDTO)async {
    final response = await post('/categories/store',storeCategoryDTO.toMap(),headers: {"Authorization": "Bearer $token"});
    if (response.body["response"] != null) {
      return CategoryDTO.fromJson(response.body["response"]);
    }
    return null;
  }

  //This method is used to get a list of categories
  Future<List<CategoryDTO>> getCategories(String token) async {
    final response = await get('/categories/index', headers: {"Authorization": "Bearer $token"});
    if (response.body["response"] != null) {
      return List<CategoryDTO>.from(
        response.body["response"].map((c) => CategoryDTO.fromJson(c))
      );
    }
    return [];
  }

  //This method is used to store a new movement
  Future<Movement?> storeMovement(String token,StoreMovementDto storeMovementDto)async {
    final response = await post('/movements/store',storeMovementDto.toJson(),headers: {"Authorization": "Bearer $token"});
    if (response.body["data"] != null) {
      return Movement.fromJson(response.body["data"]);
    }
    return null;
  }
}
