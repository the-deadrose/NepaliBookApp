



class User{
final String token;
final String email;
final String username;
final String id;

User({
  required this.token,
  required this.email,
  required this.id,
  required this.username
});

factory User.fromJson(Map<String, dynamic> json){
  return User(
      token: json['token'],
      email: json['email'],
      id: json['id'],
      username: json['username']
  );

}


}