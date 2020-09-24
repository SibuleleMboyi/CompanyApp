import 'package:flutter/material.dart';
import 'package:new_app/widgets/LabelledButtons.dart';


   final List<LabelledButtons> scrollableIcons = [
     LabelledButtons(icon: Icons.search, iconSize: 30.0, onPressed: ()=> print('search'), label: 'Search'),
     LabelledButtons(icon: Icons.add, iconSize: 30.0, onPressed: ()=> print('add'), label: 'Add'),
     LabelledButtons(icon: Icons.camera, iconSize: 30.0, onPressed: ()=> print('camera'),label: 'Camera'),
     LabelledButtons(icon: Icons.description, iconSize: 30.0, onPressed: ()=> print('description'), label:  'Description'),
     LabelledButtons(icon: Icons.location_city, iconSize: 30.0, onPressed: ()=> print('location_city'), label: 'Video Calls'),
     LabelledButtons(icon: Icons.video_call, iconSize: 30.0, onPressed: ()=> print('video_call'), label: 'Video Calls',),
     LabelledButtons(icon: Icons.info_rounded, iconSize: 30.0, onPressed: ()=> print('info_rounded'), label : 'info rounded'),
     LabelledButtons(icon: Icons.search, iconSize: 30.0, onPressed: ()=> print('search'),label: 'Search'),
  ];
