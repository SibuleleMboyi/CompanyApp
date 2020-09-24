import 'package:flutter/material.dart';
import 'package:new_app/screens/dummy_screen.dart';
import 'package:new_app/widgets/LabelledButtons.dart';

class SearchButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: LabelledButtons(icon : Icons.search,iconSize: 28.0,onPressed: (){
        showSearch(context: context, delegate: DataSearch());
      },label: 'Search Investor'),
    );
  }
}

class DataSearch extends SearchDelegate<String>{
  final cities = ['durban','pmb','east london', 'port elizabeth', 'joburg', 'mafikeng','pretoria','mumbai','polokwane'];
  final recentCities = ['port elizabeth', 'mafikeng','east london'];

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for the App Bar
    return [
      IconButton(icon: Icon(Icons.clear), color: Colors.black,
          onPressed: () {
           query = " ";
          })
    ];

  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of the App Bar
     return IconButton(
         icon: AnimatedIcon(

               icon: AnimatedIcons.menu_arrow,
               progress: transitionAnimation,
               //color: Colors.black,
            ),
         onPressed: (){
           close(context, null);
         },

       color: Colors.black,
     );

  }

  @override
  Widget buildResults(BuildContext context) {
    // show some results based on the selection
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        child: Card(
          color: Colors.redAccent,
          child: Center(
            child: Text(query),
            //child: Text(cities.where((element) => element.startsWith(query)).toList()),
          ),
        ),
      ),
    );

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches for something
    final suggestionList = query.isEmpty ? recentCities : cities.where((element) => element.startsWith(query)).toList();
    return ListView.builder(

        itemBuilder: (context, index)=>ListTile(

          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => Dummy_Screen()
            ),
          ),
      selected: true,
      leading: Icon(Icons.location_city),
          title: RichText(
            text : TextSpan(
              text : suggestionList[index].substring(0,query.length),
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
              ),
              children: [
                TextSpan(
                  text: suggestionList[index].substring(query.length),
                  style: TextStyle(color: Colors.grey),
                )
              ],
            )
          ),
        ),
      itemCount: suggestionList.length ,
    );
  }

}
