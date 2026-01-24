import 'dart:io';

class UserModel {
  final String name;
  final String email;
  final String role;
  final String phone;
  final String location;

  UserModel({
    required this.name,
    required this.email,
    required this.role,
    required this.phone,
    required this.location,
  });
}

// Global variable agar data tidak hilang saat pindah-pindah halaman
UserModel? currentUser;
File? globalProfileImage;
File? globalCoverImage;
