import 'package:flutter/material.dart';
import 'course.dart';

class CourseCard extends StatelessWidget {
  final Course course;
  final Function() delete;
  final Function() edit;
  
  const CourseCard({
    required this.course,
    required this.delete,
    required this.edit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              course.title,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              course.description,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dosen: ${course.instructor}',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
                Text(
                  'Durasi: ${course.duration}',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(4.0),
              ),
              child: Text(
                course.level,
                style: TextStyle(color: Colors.blue[800]),
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton.icon(
                  onPressed: edit,
                  icon: Icon(Icons.edit),
                  label: Text('Edit'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue[700],
                  ),
                ),
                TextButton.icon(
                  onPressed: delete,
                  icon: Icon(Icons.delete),
                  label: Text('Hapus'),
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red[400],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
