


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:search/custom_search.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Delegate "),
        actions: [
          IconButton(onPressed: (){
            showSearch(context: context, delegate: CustomSearch());
          }, icon: Icon(Icons.search))
        ],
      ),
      body:ListView(
        children: [

        ],
      )
    );
  }
}
