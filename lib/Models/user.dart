// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class User {
  String uid;
  String? fname;
  String? lname;
  String? headline;
  String? about;
  List<String>? skills;
  List<String>? educations;
  List<String>? userLinks;
  List<String>? licenses;
  List<String>? certifications;
  String? cvRef;
  String? profileUrl;
  DateTime? dateJoined;
  String? experience;
  User({
    required this.uid,
    this.fname,
    this.lname,
    this.headline,
    this.about,
    this.skills,
    this.educations,
    this.userLinks,
    this.licenses,
    this.certifications,
    this.cvRef,
    this.profileUrl,
    this.dateJoined,
    this.experience,
  });

  User copyWith({
    String? uid,
    String? fname,
    String? lname,
    String? headline,
    String? about,
    List<String>? skills,
    List<String>? educations,
    List<String>? userLinks,
    List<String>? licenses,
    List<String>? certifications,
    String? cvRef,
    String? profileUrl,
    DateTime? dateJoined,
    String? experience,
  }) {
    return User(
      uid: uid ?? this.uid,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      headline: headline ?? this.headline,
      about: about ?? this.about,
      skills: skills ?? this.skills,
      educations: educations ?? this.educations,
      userLinks: userLinks ?? this.userLinks,
      licenses: licenses ?? this.licenses,
      certifications: certifications ?? this.certifications,
      cvRef: cvRef ?? this.cvRef,
      profileUrl: profileUrl ?? this.profileUrl,
      dateJoined: dateJoined ?? this.dateJoined,
      experience: experience ?? this.experience,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'fname': fname,
      'lname': lname,
      'headline': headline,
      'about': about,
      'skills': skills,
      'educations': educations,
      'userLinks': userLinks,
      'licenses': licenses,
      'certifications': certifications,
      'cvRef': cvRef,
      'profileUrl': profileUrl,
      'dateJoined': dateJoined?.millisecondsSinceEpoch,
      'experience': experience,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'] as String,
      fname: map['fname'] != null ? map['fname'] as String : null,
      lname: map['lname'] != null ? map['lname'] as String : null,
      headline: map['headline'] != null ? map['headline'] as String : null,
      about: map['about'] != null ? map['about'] as String : null,
      skills: map['skills'] != null
          ? List<String>.from(map['skills'] as List<String>)
          : null,
      educations: map['educations'] != null
          ? List<String>.from(map['educations'] as List<String>)
          : null,
      userLinks: map['userLinks'] != null
          ? List<String>.from(map['userLinks'] as List<String>)
          : null,
      licenses: map['licenses'] != null
          ? List<String>.from(map['licenses'] as List<String>)
          : null,
      certifications: map['certifications'] != null
          ? List<String>.from(map['certifications'] as List<String>)
          : null,
      cvRef: map['cvRef'] != null ? map['cvRef'] as String : null,
      profileUrl:
          map['profileUrl'] != null ? map['profileUrl'] as String : null,
      dateJoined: map['dateJoined'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateJoined'] as int)
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
    return 'User(uid: $uid, fname: $fname, lname: $lname, headline: $headline, about: $about, skills: $skills, educations: $educations, userLinks: $userLinks, licenses: $licenses, certifications: $certifications, cvRef: $cvRef, profileUrl: $profileUrl, dateJoined: $dateJoined, experience: $experience)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.uid == uid &&
        other.fname == fname &&
        other.lname == lname &&
        other.headline == headline &&
        other.about == about &&
        listEquals(other.skills, skills) &&
        listEquals(other.educations, educations) &&
        listEquals(other.userLinks, userLinks) &&
        listEquals(other.licenses, licenses) &&
        listEquals(other.certifications, certifications) &&
        other.cvRef == cvRef &&
        other.profileUrl == profileUrl &&
        other.dateJoined == dateJoined &&
        other.experience == experience;
  }

  @override
  int get hashCode {
    return uid.hashCode ^
        fname.hashCode ^
        lname.hashCode ^
        headline.hashCode ^
        about.hashCode ^
        skills.hashCode ^
        educations.hashCode ^
        userLinks.hashCode ^
        licenses.hashCode ^
        certifications.hashCode ^
        cvRef.hashCode ^
        profileUrl.hashCode ^
        dateJoined.hashCode ^
        experience.hashCode;
  }
}
