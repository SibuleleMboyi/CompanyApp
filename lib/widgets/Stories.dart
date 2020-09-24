import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:new_app/widgets/widgets.dart';
import 'package:new_app/config/palette.dart';
import 'package:new_app/models/models.dart';
import 'package:new_app/widgets/ProfileAvatar.dart';

class Stories extends StatelessWidget {

  final User currentUser;
  final List<Story> stories;

  const Stories({
    Key key,
    @required this.currentUser,
    @required this.stories
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      color: Colors.white,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + stories.length,
          itemBuilder: (BuildContext context, int index){
            if(index == 0){
              return Padding(padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: StoryCard(
                    isAddStory : true,
                    currentUser : currentUser
                ),
              );
            }
            final Story story = stories[index-1];

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: StoryCard(story : story),
            );
          }),
    );
  }
}

class StoryCard extends StatelessWidget {
  final Story story;
  final User currentUser;
  final bool isAddStory ;

  const StoryCard({
    Key key,
    this.story,
    this.currentUser,
    this.isAddStory = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
              imageUrl:  isAddStory ?
              currentUser.imageUrl
                  : story.imageUrl,
              height : double.infinity, width: 110.0, fit: BoxFit.cover
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12.0)
          ),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,

          child: isAddStory ? Container(
            height: 40.0,
            width: 40.0,

            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              //padding: EdgeInsets.zero,
                icon: const Icon(Icons.add),
                color: Palette.facebookBlue,
                onPressed: ()=> print('Add to Story')
            ),
          ) : ProfileAvatar(
              imageUrl: story.user.imageUrl,
              hasBorder : !story.isViewed
          ),
        ),
        Positioned(
          bottom: 8.0,
          right: 8.0,
          child: Text(
            isAddStory ? 'Add to Story': story.user.name,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

      ],
    );
  }
}