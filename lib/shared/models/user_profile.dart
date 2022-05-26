import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  String uid;

  String email;

  String displayName;

  String? photoUrl;

  UserProfile({
    required this.uid,
    required this.email,
    required this.displayName,
    this.photoUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
