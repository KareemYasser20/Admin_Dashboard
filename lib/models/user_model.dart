class UserModel
{
  final String userId;
  final String userName;
  final String userEmail;
  final String useractive;
  final String userLastdate;


  UserModel({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.useractive,
    required this.userLastdate,
  });

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      userId: json['user_id'],
      userName: json['user_name'],
      userEmail: json['user_email'],
      useractive: json['user_active'],
      userLastdate: json['user_lastdate'],
    );
  }

}