import 'package:app/src/DTO/login/LoginDTO.dart';
import 'package:app/src/services/BaseService.dart';
import 'package:app/src/pages/movements/models/movement.dart';
import 'package:app/src/DTO/CategoryDTO.dart';

class Apiservice extends Baseservice {
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

  Future<bool> validateToken(String token) async {
    final response = await post('/auth/validate-token', null,
        headers: {"Authorization": "Bearer $token"});
    if (response.body["data"]?["success"] == true) {
      return true;
    }
    return false;
  }

  Future<List<Movement>> getMovements(String token) async {
    final response = await get('/movements/index', headers: {"Authorization": "Bearer $token"},decoder: (data) {
      final movements = data["response"];
      return List<Movement>.from( 
        movements.map((m) => Movement.fromJson(m))
      );
    },);
    return response.body ?? [];
  }

  Future<CategoryDTO?> storeCategory(String token,CategoryDTO storeCategoryDTO)async {
    final response = await post('/categories/store',storeCategoryDTO.toMap(),headers: {"Authorization": "Bearer $token"},decoder: (data){
      if(data["response"]!=null){
        return CategoryDTO.fromJson(data["response"]);
      }
      return null;
    });
    return response.body;
  }

  Future<List<CategoryDTO>> getCategories(String token) async {
    final response = await get('/categories/index', headers: {"Authorization": "Bearer $token"},decoder: (data){
      return List<CategoryDTO>.from(data["response"].map((c) => CategoryDTO.fromJson(c)));
    });
    return response.body ?? [];
  }
}
