import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_app/config/palette.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final hasBorder;

  const ProfileAvatar({
    Key key,
    @required this.imageUrl,
    this.isActive = false,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
         CircleAvatar(
         radius:  45.0,
         backgroundColor: Colors.grey[100],
         backgroundImage: CachedNetworkImageProvider(imageUrl),
         //backgroundImage: AssetImage('Assets/profile_photo.jpg'),
        ),


      isActive ? Positioned(
         bottom: 0.0,
         right: 0.0,
         child: Container(
           height: 15.0,
           width: 15.0,
           decoration: BoxDecoration(
             shape: BoxShape.circle,
             color: Palette.online,
             border: Border.all(
               color: Colors.white,
               width: 2.0,
             )
           ),
         ),
       ) : const SizedBox.shrink(),
      ],
    );
  }
}
