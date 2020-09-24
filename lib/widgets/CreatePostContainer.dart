import 'package:flutter/material.dart';
import 'package:new_app/models/models.dart';
import 'package:new_app/widgets/widgets.dart';


class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key key,
    @required this.currentUser
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              ProfileAvatar(imageUrl: currentUser.imageUrl),
              const SizedBox(width: 15.0),
              Expanded(
                child: Container(
                  height: 35.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(25.0),
                    border: Border.all(
                      color: Colors.grey[400],
                      width : 1.0,
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration.collapsed(hintText: 'What\'s on your mind ?'),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(height: 10.0, thickness: 0.5),
          Container(
            height: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(onPressed: ()=>print('Live'), icon: const Icon(Icons.videocam,color: Colors.red),label: Text('Live')),
                const VerticalDivider(width: 8.0),
                FlatButton.icon(onPressed: ()=>print('Photo'), icon: const Icon(Icons.photo_library,color: Colors.green),label: Text('Photo')),
                const VerticalDivider(width: 8.0),
                FlatButton.icon(onPressed: ()=>print('Room'), icon: const Icon(Icons.video_call,color: Colors.purpleAccent),label: Text('Room')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}