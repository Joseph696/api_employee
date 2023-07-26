import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class SearchUser extends StatelessWidget {
  const SearchUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
        
      ),
      body: Center(
        child: Text("Search"),
      ),
    );
  }
}

class CustomSearch extends SearchDelegate{
  @override
   List<String> datalist = [
    "Leanne Graham",
    "Ervin Howell",
    "Clementine Bauch",
    "Patricia Lebsack",
    "Chelsey Dietrich"
  ];

  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          //Navigator.pop(context);
          query = '';
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
  return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
        // Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
        List<String> matchQuery = [];

    for (var data in datalist) {
      if (data.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(data);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return
         ListTile(title: Text(matchQuery[index]),);
      });
  
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    for (var data in datalist) {
      if (data.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(data);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        return
         ListTile(title: Text(matchQuery[index]),);
      });
  }


}