import 'package:flutter/material.dart';

class DetailPost extends StatelessWidget {
  const DetailPost({
    Key key,
    @required this.userId,
    @required this.id,
    @required this.title,
    @required this.body,
  }) : super(key: key);

  final int userId;
  final int id;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text(
            'User ID : ' + userId.toString() + 'dengan ID : ' + id.toString()),
      ),
      body: Container(
        child: Column(
          children: [
            Text(title),
            SizedBox(
              height: 10,
            ),
            Text(
              body,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
