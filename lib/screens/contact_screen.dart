import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'form_screen.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  String name = '';
  String email = '';
  String contact = '';

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString('name') ?? 'No Name';
      email = prefs.getString('email') ?? 'No Email';
      contact = prefs.getString('contact') ?? 'No Contact';
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: $name', style: TextStyle(fontSize: 16)),
            Text('Email: $email', style: TextStyle(fontSize: 16)),
            Text('Contact: $contact', style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Navigate back to the FormScreen to edit data
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FormScreen(
                      initialName: name,
                      initialEmail: email,
                      initialContact: contact,
                    ),
                  ),
                );
                // Reload data if it was updated
                if (result == true) {
                  loadData();
                }
              },
              child: Text('Edit'),
            ),
          ],
        ),
      ),
    );
  }
}
