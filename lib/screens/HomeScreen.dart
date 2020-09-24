import 'package:flutter/material.dart';
import 'package:new_app/data/User_Data.dart';
import 'package:new_app/models/Inverstor_model.dart';
import 'package:new_app/widgets/FilteringIcons.dart';
import 'package:new_app/widgets/InverstorsProfiles.dart';
import 'package:new_app/widgets/SearchButton.dart';
import 'package:new_app/widgets/widgets.dart';
import 'package:new_app/data/ScrollableIcons.dart';
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        /*title: Text('facebook',
          style: TextStyle(
            color: Colors.blue,
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            letterSpacing: -1.2,
          ),
        ),*/
        actions: [
          SearchButton(),
          //LabelledButtons(icon: Icons.search, iconSize: 28.0, onPressed: ()=> print('search'), label: ''),
          //LabelledButtons(icon: Icons.message, iconSize: 28.0, onPressed: ()=> print('messenger') , label: ''),
        ],

      ),
      body: Column(
        children: [
          const SizedBox(height: 10.0,),
          FilteringIcons( scrollableIcons : scrollableIcons ),
          Expanded(
            child: _CustomScrollView(),
          )
        ],
      ),

    );
  }
}

/*

 */

class _CustomScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /*SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: FilteringIcons( scrollableIcons : scrollableIcons ),
          ),
        ),*/

        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverToBoxAdapter(
            child: CompanyCard(currentUser : currentUser, availableInvestors: availableInvestors),
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context,index){
                final Investors availableInvestor = availableInvestors[index];
                return InverstorsProfiles(availableInvestor: availableInvestor);
              },
                childCount: availableInvestors.length,
              )
          ),
        ),
      ],
    );
  }
}
