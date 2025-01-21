class Logindto {
  String username;
  String password;

  Logindto(this.username, this.password);

  Map<String, String> toMap() {
    return {"username": username, "password": password};
  }
}
