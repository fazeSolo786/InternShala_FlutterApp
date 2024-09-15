import 'package:flutter/material.dart';
import '../service/api_service.dart';

class InternshipSearchDelegate extends SearchDelegate<Internship?> {
  final List<Internship> internships;

  InternshipSearchDelegate(this.internships);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
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
  Widget buildResults(BuildContext context) {
    final List<Internship> results = internships
        .where(
          (internship) => internship.title.toLowerCase().contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final internship = results[index];
        return ListTile(
          title: Text(internship.title),
          subtitle: Text(internship.companyName),
          onTap: () {
            close(context, internship);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Internship> suggestions = internships
        .where((internship) =>
            internship.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final internship = suggestions[index];
        return ListTile(
          title: Text(internship.title),
          subtitle: Text(internship.companyName),
          onTap: () {
            query = internship.title;
            showResults(context);
          },
        );
      },
    );
  }
}
