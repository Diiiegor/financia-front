class CategoryDTO{
    String?    description;
    DateTime?  deletedAt;
    int?       userId;
    String    name;
    int?       id;
    DateTime?  createdAt;
    String    icon;

    CategoryDTO({this.deletedAt,this.userId,required this.name,this.id,this.createdAt,required this.icon,this.description});
    
    factory CategoryDTO.fromJson(Map<String,dynamic> data){
          return CategoryDTO(
              userId: data["user_id"],
              name: data["name"],
              id:data["id"],
              createdAt: DateTime.parse(data["created_at"]),
              icon:data["icon"]);
    }

    Map<String,dynamic> toMap(){
      return {
        "name":name,
        "description":description,
        "icon":icon
      };
    }

    
}