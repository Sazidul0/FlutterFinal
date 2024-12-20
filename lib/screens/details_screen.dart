import 'package:flutter/material.dart';
import 'form_screen.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://picsum.photos/400/200'),
          SizedBox(height: 20),
          Text(
            'I am Sazidul Islam',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FormScreen()),
              );
            },
            child: Text('Get Started'),
          ),
        ],
      ),
    );
  }
}
