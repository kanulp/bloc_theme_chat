import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
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
          subtitle: Text('Flutter is future'),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '1 min ago',
                style: TextStyle(fontSize: 12.0),
              ),
              Container(
                margin: EdgeInsets.only(top: 5.0),
                alignment: Alignment.center,
                width: 20.0,
                height: 20.0,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(50.0)),
                child: Text(
                  '2',
                  style: TextStyle(fontSize: 10.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
