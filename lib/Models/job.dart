// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Job {
  String title;
  String workplace;
  String location;
  String type;
  String owner;
  DateTime date;
  String deadline;
  String? time;
  String description;
  String experience;
  String? proImgUrl;

  Job({
    required this.title,
    required this.workplace,
    required this.location,
    required this.type,
    required this.owner,
    required this.date,
    required this.deadline,
    this.time,
    required this.description,
    required this.experience,
    this.proImgUrl,
  });

  Job copyWith({
    String? title,
    String? workplace,
    String? location,
    String? type,
    String? owner,
    DateTime? date,
    String? deadline,
    String? time,
    String? description,
    String? experience,
    String? proImgUrl,
  }) {
    return Job(
      title: title ?? this.title,
      workplace: workplace ?? this.workplace,
      location: location ?? this.location,
      type: type ?? this.type,
      owner: owner ?? this.owner,
      date: date ?? this.date,
      deadline: deadline ?? this.deadline,
      time: time ?? this.time,
      description: description ?? this.description,
      experience: experience ?? this.experience,
      proImgUrl: proImgUrl ?? this.proImgUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'workplace': workplace,
      'location': location,
      'type': type,
      'owner': owner,
      'date': date.millisecondsSinceEpoch,
      'deadline': deadline,
      'time': time,
      'description': description,
      'experience': experience,
      'proImgUrl': proImgUrl,
    };
  }

  factory Job.fromMap(Map<String, dynamic> map) {
    return Job(
      title: map['title'] as String,
      workplace: map['workplace'] as String,
      location: map['location'] as String,
      type: map['type'] as String,
      owner: map['owner'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      deadline: map['deadline'] as String,
      time: map['time'] != null ? map['time'] as String : null,
      description: map['description'] as String,
      experience: map['experience'] as String,
      proImgUrl: map['proImgUrl'] != null ? map['proImgUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Job.fromJson(String source) =>
      Job.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Job(title: $title, workplace: $workplace, location: $location, type: $type, owner: $owner, date: $date, deadline: $deadline, time: $time, description: $description, experience: $experience, proImgUrl: $proImgUrl)';
  }

  @override
  bool operator ==(covariant Job other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.workplace == workplace &&
        other.location == location &&
        other.type == type &&
        other.owner == owner &&
        other.date == date &&
        other.deadline == deadline &&
        other.time == time &&
        other.description == description &&
        other.experience == experience &&
        other.proImgUrl == proImgUrl;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        workplace.hashCode ^
        location.hashCode ^
        type.hashCode ^
        owner.hashCode ^
        date.hashCode ^
        deadline.hashCode ^
        time.hashCode ^
        description.hashCode ^
        experience.hashCode ^
        proImgUrl.hashCode;
  }
}
