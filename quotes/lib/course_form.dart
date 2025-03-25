import 'package:flutter/material.dart';
import 'course.dart';

class CourseForm extends StatefulWidget {
  final Function(Course) onSubmit;
  final Course? course;

  const CourseForm({required this.onSubmit, this.course});

  @override
  _CourseFormState createState() => _CourseFormState();
}

class _CourseFormState extends State<CourseForm> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final instructorController = TextEditingController();
  final durationController = TextEditingController();
  String levelValue = 'S1';

  @override
  void initState() {
    super.initState();
    if (widget.course != null) {
      titleController.text = widget.course!.title;
      descriptionController.text = widget.course!.description;
      instructorController.text = widget.course!.instructor;
      durationController.text = widget.course!.duration;
      levelValue = widget.course!.level;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    instructorController.dispose();
    durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: 'Mata Kuliah',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Tolong masukkan nama mata kuliah';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: descriptionController,
            decoration: InputDecoration(
              labelText: 'deskripsi',
              border: OutlineInputBorder(),
            ),
            maxLines: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Tolong masukkan deskripsi';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: instructorController,
            decoration: InputDecoration(
              labelText: 'Dosen',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Tolong masukkan nama dosen';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          TextFormField(
            controller: durationController,
            decoration: InputDecoration(
              labelText: 'Durasi',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Tolong masukkan durasi';
              }
              return null;
            },
          ),
          SizedBox(height: 16.0),
          DropdownButtonFormField<String>(
            decoration: InputDecoration(
              labelText: 'Level',
              border: OutlineInputBorder(),
            ),
            value: levelValue,
            items: ['S1', 'S2', 'S3']
                .map((level) => DropdownMenuItem(
                    value: level, child: Text(level)))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() {
                  levelValue = value;
                });
              }
            },
          ),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                final course = Course(
                  id: widget.course?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
                  title: titleController.text,
                  description: descriptionController.text,
                  instructor: instructorController.text,
                  duration: durationController.text,
                  level: levelValue,
                );
                widget.onSubmit(course);
                Navigator.pop(context);
              }
            },
            child: Text(widget.course == null ? 'Tambah Matkul' : 'Update Matkul'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
