class User {
  final String uid;
  final String? name;
  final String? photoUrl;
  final String? email;
  final String? phoneNumber;

  User({
    required this.uid,
    this.name,
    this.photoUrl,
    this.email,
    this.phoneNumber,
  });
}
