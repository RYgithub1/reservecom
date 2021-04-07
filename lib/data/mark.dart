import 'dart:convert';

import 'package:flutter/material.dart';


class MarkResult {
  final List<Mark> marks;
  final bool isMarkedToThisProperty;
  MarkResult({
    this.marks,
    this.isMarkedToThisProperty,
  });
}


class Mark {
  int markId;
  int propertyId;
  int markUserId;
  DateTime markDateTime;
  Mark({
    @required this.markId,
    @required this.propertyId,
    @required this.markUserId,
    @required this.markDateTime,
  });

  Mark copyWith({
    int markId,
    int propertyId,
    int markUserId,
    DateTime markDateTime,
  }) {
    return Mark(
      markId: markId ?? this.markId,
      propertyId: propertyId ?? this.propertyId,
      markUserId: markUserId ?? this.markUserId,
      markDateTime: markDateTime ?? this.markDateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'markId': markId,
      'propertyId': propertyId,
      'markUserId': markUserId,
      // 'markDateTime': markDateTime.millisecondsSinceEpoch,
      'markDateTime': markDateTime.toIso8601String(),
    };
  }

  factory Mark.fromMap(Map<String, dynamic> map) {
    return Mark(
      markId: map['markId'],
      propertyId: map['propertyId'],
      markUserId: map['markUserId'],
      // markDateTime: DateTime.fromMillisecondsSinceEpoch(map['markDateTime']),
      markDateTime: map['markDateTime'] == null
          ? null
          : DateTime.parse(map['markDateTime'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Mark.fromJson(String source) => Mark.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Mark(markId: $markId, propertyId: $propertyId, markUserId: $markUserId, markDateTime: $markDateTime)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Mark &&
      other.markId == markId &&
      other.propertyId == propertyId &&
      other.markUserId == markUserId &&
      other.markDateTime == markDateTime;
  }

  @override
  int get hashCode {
    return markId.hashCode ^
      propertyId.hashCode ^
      markUserId.hashCode ^
      markDateTime.hashCode;
  }
}
