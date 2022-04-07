class LoginResponse {
  String? refresh;
  String? token;
  User? user;

  LoginResponse({this.refresh, this.token, this.user});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    refresh = json['refresh'];
    token = json['access'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['refresh'] = this.refresh;
    data['access'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  String? firstName;
  String? lastName;
  String? username;
  String? dateJoined;

  User({this.firstName, this.lastName, this.username, this.dateJoined});

  User.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    dateJoined = json['date_joined'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['username'] = this.username;
    data['date_joined'] = this.dateJoined;
    return data;
  }
}