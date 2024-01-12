class User {
  final String uid;
  final String? name;
  final String? photoUrl;
  final String? email;

  User({
    required this.uid,
    this.name,
    this.photoUrl,
    this.email,
  });
}
