import 'package:flutter/material.dart';
class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: [

            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CircleAvatar(child: Image.network('https://firebasestorage.googleapis.com/v0/b/shine-of-coins-601fb.appspot.com/o/download%20(1).jpg?alt=media&token=312bbe95-8888-4f8e-aac5-2b9a724f6b23'),)),
          ListTile(leading: Icon(Icons.email), title: Text('shubhkaran828@gmail.com'),),
            ListTile(leading: Icon(Icons.phone),title: Text('7527910117'),)
          ],
        ),
      ),
    );
  }
}
