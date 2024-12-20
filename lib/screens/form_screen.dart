import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'contact_screen.dart';

class FormScreen extends StatefulWidget {
  final String? initialName;
  final String? initialEmail;
  final String? initialContact;
  final bool isEditing;

  FormScreen({
    this.initialName,
    this.initialEmail,
    this.initialContact,
    this.isEditing = false,
  });

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _contactController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName ?? '');
    _emailController = TextEditingController(text: widget.initialEmail ?? '');
    _contactController = TextEditingController(text: widget.initialContact ?? '');
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _nameController.text);
    await prefs.setString('email', _emailController.text);
    await prefs.setString('contact', _contactController.text);

    if (widget.isEditing) {
      // Return to ContactScreen if editing
      Navigator.pop(context, true);
    } else {
      // Navigate to ContactScreen if saving for the first time
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ContactScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _contactController,
              decoration: InputDecoration(labelText: 'Contact'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveData,
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
