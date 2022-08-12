// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String? username;
  String? fname;
  String? lname;
  String? email;
  DateTime? datePosted;
  String? experience;
  User({
    this.username,
    this.fname,
    this.lname,
    this.datePosted,
    this.experience,
  });

  User copyWith({
    String? username,
    String? fname,
    String? lname,
    DateTime? datePosted,
    String? experience,
  }) {
    return User(
      username: username ?? this.username,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      datePosted: datePosted ?? this.datePosted,
      experience: experience ?? this.experience,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'fname': fname,
      'lname': lname,
      'datePosted': datePosted?.millisecondsSinceEpoch,
      'experience': experience,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'] != null ? map['username'] as String : null,
      fname: map['fname'] != null ? map['fname'] as String : null,
      lname: map['lname'] != null ? map['lname'] as String : null,
      datePosted: map['datePosted'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['datePosted'] as int)
          : null,
      experience:
          map['experience'] != null ? map['experience'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(username: $username, fname: $fname, lname: $lname, datePosted: $datePosted, experience: $experience)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.username == username &&
        other.fname == fname &&
        other.lname == lname &&
        other.datePosted == datePosted &&
        other.experience == experience;
  }

  @override
  int get hashCode {
    return username.hashCode ^
        fname.hashCode ^
        lname.hashCode ^
        datePosted.hashCode ^
        experience.hashCode;
  }
}
