import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
            ),
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/nahid.png'),
              radius: 50.0,
            ),
            const Text(
              'Nahid Hasan Noyon',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              'Flutter Developer',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),
            ),
            const SizedBox(
              width: 300,
              child: Divider(
                thickness: 3,
              ),
            ),
            const Card(
              margin: EdgeInsets.all(15),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.phone,
                  size: 25,
                  color: Colors.teal,
                ),
                title: Text(
                  '01627465928',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
            const Card(
              margin: EdgeInsets.all(15),
              color: Colors.white,
              child: ListTile(
                leading: Icon(
                  Icons.email,
                  size: 25,
                  color: Colors.teal,
                ),
                title: Text(
                  'nahidhasannoyon20@gmail.com',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
