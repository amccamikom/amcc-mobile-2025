import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edutrack_app/models/task_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TaskService {
  final CollectionReference _taskCollection = FirebaseFirestore.instance
      .collection('tasks');

  // create task
  Future<void> addTask(String title, String date) async {
    try {
      final String currentUserId = FirebaseAuth.instance.currentUser!.uid;

      await _taskCollection.add({
        'userId': currentUserId,
        'title': title,
        'date': date,
        'isCompleted': false,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Gagal menambahkan task.');
    }
  }

  // read
  Stream<List<TaskModel>> getTasks() {
    final String currentUserId = FirebaseAuth.instance.currentUser!.uid;

    return _taskCollection
        .where('userId', isEqualTo: currentUserId)
        .snapshots()
        .map((snapshot) {
          final tasks = snapshot.docs.map((doc) {
            return TaskModel.fromFirestore(
              doc.data() as Map<String, dynamic>,
              doc.id,
            );
          }).toList();
          tasks.sort((a, b) {
            if (a.createdAt == null && b.createdAt == null) return 0;
            if (a.createdAt == null) return 1;
            if (b.createdAt == null) return -1;
            return b.createdAt!.compareTo(a.createdAt!);
          });
          return tasks;
        });
  }

  // update
  Future<void> updateTask(String id, bool newStatus) async {
    try {
      await _taskCollection.doc(id).update({'isCompleted': newStatus});
    } catch (e) {
      print('Gagal memperbarui status task.');
    }
  }

  // delete
  Future<void> deleteTask(String id) async {
    try {
      await _taskCollection.doc(id).delete();
    } catch (e) {
      print('Gagal menghapus task.');
    }
  }
}
