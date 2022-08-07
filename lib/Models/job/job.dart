import 'dart:convert';

import 'package:collection/collection.dart';

class Job {
  String? title;
  String? workplace;
  String? location;
  String? type;
  String? owner;
  String? date;
  String? deadline;
  String? time;
  String? description;
  String? experience;
  String? proImgUrl;

  Job(
      {this.title,
      this.workplace,
      this.description,
      this.owner,
      this.date,
      this.deadline,
      this.time,
      this.location,
      this.type,
      this.experience,
      this.proImgUrl});

  factory Job.fromMap(Map<String, dynamic> data) => Job(
      title: data['title'] as String?,
      description: data['description'] as String?,
      workplace: data['workplace'] as String?,
      owner: data['owner'] as String?,
      date: data['date'] as String?,
      deadline: data['deadline'] as String?,
      time: data['time'] as String?,
      location: data['location'] as String?,
      type: data['type'] as String?,
      experience: data['experience'] as String?,
      proImgUrl: data['proImgUrl'] as String?);

  Map<String, dynamic> toMap() => {
        'title': title,
        'description': description,
        'workplace': workplace,
        'owner': owner,
        'date': date,
        'deadline': deadline,
        'time': time,
        'location': location,
        'type': type,
        'experience': experience,
        'proImgUrl': proImgUrl
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Job].
  factory Job.fromJson(String data) {
    return Job.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Job] to a JSON string.
  String toJson() => json.encode(toMap());

  Job copyWith(
      {String? title,
      String? description,
      String? workplace,
      String? owner,
      String? date,
      String? deadline,
      String? time,
      String? location,
      String? type,
      String? experience,
      String? proImgUrl}) {
    return Job(
        title: title ?? this.title,
        workplace: workplace ?? this.workplace,
        description: description ?? this.description,
        owner: owner ?? this.owner,
        date: date ?? this.date,
        deadline: deadline ?? this.deadline,
        time: time ?? this.time,
        location: location ?? this.location,
        type: type ?? this.type,
        experience: experience ?? this.experience,
        proImgUrl: proImgUrl ?? this.proImgUrl);
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Job) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      title.hashCode ^
      description.hashCode ^
      workplace.hashCode ^
      owner.hashCode ^
      date.hashCode ^
      deadline.hashCode ^
      time.hashCode ^
      location.hashCode ^
      type.hashCode ^
      experience.hashCode ^
      proImgUrl.hashCode;
}
