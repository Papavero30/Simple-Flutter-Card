import 'package:flutter/material.dart';
import 'course.dart';
import 'course_card.dart';
import 'course_form.dart';

void main() => runApp(MaterialApp(
  title: 'Portal Page',
  theme: ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.grey[200],
  ),
  home: CourseList(),
));

class CourseList extends StatefulWidget {
  @override
  _CourseListState createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  List<Course> courses = [

  ];

  void _showAddCourseForm() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Tambah Matakuliah Baru'),
        content: Container(
          width: double.maxFinite,
          child: CourseForm(
            onSubmit: (course) {
              setState(() {
                courses.add(course);
              });
            },
          ),
        ),
      ),
    );
  }

  void _showEditCourseForm(Course course) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Edit Matakuliah'),
        content: Container(
          width: double.maxFinite,
          child: CourseForm(
            course: course,
            onSubmit: (updatedCourse) {
              setState(() {
                int index = courses.indexWhere((c) => c.id == updatedCourse.id);
                if (index != -1) {
                  courses[index] = updatedCourse;
                }
              });
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Portal Page Admin '),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              // Just a placeholder to simulate data refresh
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Mata kuliah diperbaharui')),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30,
                    child: Icon(Icons.person, size: 30, color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Admin Portal',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    'Mengelola Mata Kuliah',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Mata Kuliah'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Mahasiswa'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Masih OTW')),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Masih OTW')),
                );
              },
            ),
          ],
        ),
      ),
      body: courses.isEmpty 
          ? Center(
              child: Text(
                'Matakuliah masih kosong.\nSilahkan tambahkan matakuliah baru.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.0, color: Colors.grey[600]),
              ),
            ) 
          : ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return CourseCard(
                  course: courses[index],
                  delete: () {
                    setState(() {
                      courses.removeAt(index);
                    });
                  },
                  edit: () {
                    _showEditCourseForm(courses[index]);
                  },
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddCourseForm,
        backgroundColor: Colors.blue,
        child: Icon(Icons.add),
        tooltip: 'Tambah Matakuliah',
      ),
    );
  }
}





