import 'package:student_records/db/functions/db_functions.dart';
import 'package:student_records/screens/widgets/add_student.dart';
import 'package:student_records/screens/widgets/list_student.dart';
import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/profile_7.png'),
        ),
        title: Text(
          'Admin',
          style: TextStyle(color: Colors.indigo),
        ),
        // actions: [
        //   IconButton(
        //       onPressed: () {
        //         showSearch(context: context, delegate: CustomSearchDelegate());
        //       },
        //       icon: Icon(Icons.search))
        // ],
      ),
      body: SafeArea(
          child: Column(
        children: [AddStudentWidget(), Expanded(child: ListStudentWidget())],
      )),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Apple',
    'Banana',
    'Pear',
    'Watermelon',
    'Orange',
    'Blueberry',
    'Strawberry',
    'Raspberry'
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: TextStyle(fontSize: 64, fontWeight: FontWeight.w700),
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }

    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
            onTap: () {
              query = result;
              buildResults(context);
            },
          );
        });
  }
}
