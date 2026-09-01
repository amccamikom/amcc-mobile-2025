import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String id;
  String userId;
  String title;
  String date;
  bool isCompleted;
  Timestamp? createdAt;

  TaskModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.date,
    required this.isCompleted,
    this.createdAt,
  });

  factory TaskModel.fromFirestore(Map<String, dynamic> json, String documentId)
  {
    return TaskModel(
      id: documentId,
      userId: json['userId'] ?? '',
      title: json['title'] ?? '',
      date: json['date'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
      createdAt: json['createdAt'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': userId,
      'title': title,
      'date': date,
      'isCompleted': isCompleted,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }
}