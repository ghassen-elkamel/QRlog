class AccessUser {
  AccessUser({
    this.token,
    this.role,
    this.refreshToken
  });

  final String? token;
  final String? role;
  final String? refreshToken;

  factory AccessUser.fromJson(Map<String, dynamic>? json) => AccessUser(
        token: json?["access_token"],
        role: json?["user_role"],
        refreshToken: json?["refresh_token"],
      );

  Map<String, dynamic> toJson() => {
        if (token != null) "access_token": token,
        if (role != null) "user_role": role,
        if (refreshToken != null) "refresh_token": refreshToken,
  };
}
