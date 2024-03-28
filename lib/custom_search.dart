


import 'package:flutter/material.dart';

class CustomSearch extends SearchDelegate{
  
  List listOfName=[
    "wael","basel","moahmed","yaser","Sahdy","Mohand","MAjd"
  ];

 late  List filtredList;

  @override
  List<Widget>? buildActions(BuildContext context) {
   return [
     IconButton(onPressed: () {
       query="";
     },
         icon: Icon(Icons.close))
     
   ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          close(context, null);
          // null because we dont need anything
        },
      icon:Icon(  Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {

    return Text('Ahla bik w mat7alebich ');
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    if ( query==""){
      return ListView.builder(
          itemCount: listOfName.length,
          itemBuilder:(context,index){
            return Card(

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(listOfName[index].toString()),
                ));
          });

          }else
            {
              filtredList=listOfName.where((element) => element.startsWith(query)).toList();
              return ListView.builder(
                  itemCount: filtredList.length,
                  itemBuilder:(context,index){
                    return InkWell(
                      onTap: (){
                        showResults(context);
                      },
                      child: Card(

                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(filtredList[index].toString()),
                          )),
                    );
                  });
            }



  }
  
  
  
  
}