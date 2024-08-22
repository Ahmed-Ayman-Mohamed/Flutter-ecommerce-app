import 'package:flutter/material.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About E-commerce App'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome to Our E-commerce App',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Our e-commerce app is designed to provide you with a seamless shopping experience. Whether you are looking for the latest fashion trends, electronics, or home essentials, we have got you covered.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 20.0),
            Text(
              'Key Features:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Wide range of products'),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Secure payment options'),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Fast and reliable shipping'),
            ),
            ListTile(
              leading: Icon(Icons.check),
              title: Text('Easy returns and refunds'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Contact Us:',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'If you have any questions or need assistance, feel free to contact our support team at support@ecommerceapp.com.',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}