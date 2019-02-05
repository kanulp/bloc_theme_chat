import 'package:flutter/material.dart';

class CallPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
            leading: Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.0),
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://pbs.twimg.com/profile_images/796056221241380864/A5uEVRLw_400x400.jpg'))),
            ),
            title: Text('Karan Gajjar'),
            subtitle: Text('Last call was on 31/1'),
            trailing: Icon(Icons.videocam));
      },
    );
  }
}
