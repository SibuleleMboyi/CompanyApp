import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_app/models/Inverstor_model.dart';
import 'package:new_app/models/User__.dart';
import 'package:new_app/widgets/CardButtons.dart';
import 'package:new_app/widgets/ProfileAvatar.dart';

class CompanyCard extends StatelessWidget {
  final User currentUser;
  final List<Investors>availableInvestors;

  const CompanyCard({
    Key key,
    @required this.currentUser,
    @required  this.availableInvestors
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      color: Colors.black12,
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          scrollDirection: Axis.horizontal,
          itemCount:  availableInvestors.length,
          itemBuilder: (BuildContext context, int index){

            Investors availableInvestor = availableInvestors[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: PostCard( availableInvestor : availableInvestor),
            );
          }
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  final Investors availableInvestor;

  const PostCard({
    Key key,
    @required this.availableInvestor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Container(
            height: double.infinity,
            width: 110.0,
            color: Colors.white,
          ),
        ),

        Positioned(
          top: 8.0,
          left: 8.0,
          right : 8.0,
          child: Column(
            children: [
              Text(
                availableInvestor.investorName,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6.0),
              Text(
                availableInvestor.description,
                    style: const TextStyle(
                    color: Colors.black,
                     fontSize: 12.0
                ),
              maxLines: availableInvestor.investorName.length > 14 ? 2 :  3,
              overflow: TextOverflow.ellipsis,
             ),
              CardButtons(
                height: 31.0,
                icon : Icon(
                  MdiIcons.information,
                  color: Colors.blue,
                  size: 15.0,
                ),
                label: '',
                onTap : ()=> print('info'),
              ),

              //const SizedBox(height: 2.0),
              ProfileAvatar(imageUrl: availableInvestor.imageUrl),
            ],
          ),
        ),

        Positioned(
            bottom: 2.0 ,
            left: 8.0,
         child : Row(
           children :[
           CardButtons(
                 height: 31.0,
                 icon : Icon(
                   MdiIcons.thumbUpOutline,
                   color: Colors.blue,
                   size: 15.0,
                 ),
                 label : '${availableInvestor.likes}',
                 onTap : ()=> print('Liked') // when pressed, an inverstors description information gets displayed
             ),


             CardButtons(
                 height: 31.0,
                 icon : Icon(
                   MdiIcons.thumbDownOutline,
                   color: Colors.blue,
                   size: 15.0,
                 ),
                 label : '${availableInvestor.dislikes}',
                 onTap : ()=> print('Disliked')
             ),
           ],
         )
        ),
      ],
    );
  }
}

