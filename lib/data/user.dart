import 'dart:convert';

class User {
  int userId;
  String displayName;
  String email;
  String photoUrl;
  String quickWord;
  User({
    // this.userId = 1,
    this.userId,
    this.displayName,
    this.email,
    this.photoUrl,
    this.quickWord,
  });


  User copyWith({
    int userId,
    String displayName,
    String email,
    String photoUrl,
    String quickWord,
  }) {
    return User(
      userId: userId ?? this.userId,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      quickWord: quickWord ?? this.quickWord,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl,
      'quickWord': quickWord,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'],
      displayName: map['displayName'],
      email: map['email'],
      photoUrl: map['photoUrl'],
      quickWord: map['quickWord'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(userId: $userId, displayName: $displayName, email: $email, photoUrl: $photoUrl, quickWord: $quickWord)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is User &&
      other.userId == userId &&
      other.displayName == displayName &&
      other.email == email &&
      other.photoUrl == photoUrl &&
      other.quickWord == quickWord;
  }

  @override
  int get hashCode {
    return userId.hashCode ^
      displayName.hashCode ^
      email.hashCode ^
      photoUrl.hashCode ^
      quickWord.hashCode;
  }
}


