import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:new_app/models/Inverstor_model.dart';

import 'CardButtons.dart';
class InverstorsProfiles extends StatelessWidget {
  final Investors availableInvestor;

  const InverstorsProfiles({
    Key key,
    @required this.availableInvestor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
      Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        //height: 500.0,
        color: Colors.black12,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              child: Text(
                availableInvestor.investorName,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                availableInvestor.description,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12.0
                ),
                maxLines:  4,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const SizedBox(height: 20),
            CachedNetworkImage(
              imageUrl: availableInvestor.imageUrl,
              imageBuilder: (context,imageProvider) => Container(
                height: 350.0,
                //width: 300,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    //colorFilter: ColorFilter.mode(Colors.red,BlendMode.colorBurn)
                  ),
                ),
              ),
              placeholder: (context,url) => CircularProgressIndicator(),
              errorWidget: (context,url,error) => Icon(Icons.error),
            ),
            const Divider(),
            Row(
              children: [

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
                InvestorStats(
                  likes : availableInvestor.likes,
                  //reviews : availableInvestor.reviews,
                  dislikes : availableInvestor.dislikes,
                ),
              ],
            ),
          ],
        ),
      ),
     ],
    );
  }
}

class InvestorStats extends StatelessWidget {

  final int likes;
  //final String reviews;
  final dislikes;

  const InvestorStats({Key key,
    this.likes,
    //this.reviews,
    this.dislikes
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
