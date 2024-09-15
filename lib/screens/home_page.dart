import 'package:flutter/material.dart';
import 'package:internshala_by_faizan/search/search_page.dart';
import 'package:internshala_by_faizan/service/api_service.dart';
import 'package:internshala_by_faizan/widgets/filters.dart';
import 'package:internshala_by_faizan/widgets/internship_list.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Internship>> futureInternships;
  List<Internship> internships = [];
  List<Internship> filteredInternships = [];
  List<String> selectedFilters = [];

  @override
  void initState() {
    super.initState();
    futureInternships = fetchInternships();
    futureInternships.then((data) {
      setState(() {
        internships = data;
        filteredInternships = applyFilters(data);
      });
    });
  }

  List<Internship> applyFilters(List<Internship> internships) {
    List<Internship> filteredList = internships;

    if (selectedFilters.isNotEmpty) {
      filteredList = internships.where((internship) {
        bool matches = false;
        for (var filter in selectedFilters) {
          if (internship.profileName.contains(filter) ||
              internship.location.contains(filter) ||
              internship.duration.contains(filter)) {
            matches = true;
            break;
          }
        }
        return matches;
      }).toList();
    }

    return filteredList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/internshalaAppBar.png',
          height: 200,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final selectedInternship = await showSearch<Internship?>(
                context: context,
                delegate: InternshipSearchDelegate(internships),
              );

              if (selectedInternship != null) {
                setState(() {
                  filteredInternships = [selectedInternship];
                });
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Filters(
            selectedFilters: selectedFilters,
            onFilterSelected: (filter, selected) {
              setState(() {
                if (selected) {
                  selectedFilters.add(filter);
                } else {
                  selectedFilters.remove(filter);
                }
                filteredInternships = applyFilters(internships);
              });
            },
          ),
          Expanded(
            child: FutureBuilder<List<Internship>>(
              future: futureInternships,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (snapshot.hasData) {
                  return InternshipList(internships: filteredInternships);
                } else {
                  return Center(child: Text('No data available'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
