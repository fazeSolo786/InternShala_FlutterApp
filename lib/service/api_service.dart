import 'dart:convert';
import 'package:http/http.dart' as http;

class Internship {
  final int id;
  final String title;
  final String companyName;
  final String location;
  final String stipend;
  final String startDate;
  final String profileName;
  final String postedOn;
  final String duration;

  Internship({
    required this.id,
    required this.title,
    required this.companyName,
    required this.location,
    required this.stipend,
    required this.startDate,
    required this.profileName,
    required this.postedOn,
    required this.duration,
  });

  factory Internship.fromJson(Map<String, dynamic> json) {
    return Internship(
        id: json['id'],
        title: json['title'],
        companyName: json['company_name'],
        location: json['location_names'].isNotEmpty
            ? json['location_names'][0]
            : 'N/A',
        stipend: json['stipend']?['salary'] ?? 'N/A',
        startDate: json['start_date'] ?? 'N/A',
        profileName: json['profile_name'] ?? 'N/A',
        postedOn: json['posted_on'],
        duration: json['duration']);
  }
}

Future<List<Internship>> fetchInternships() async {
  const url = 'https://internshala.com/flutter_hiring/search';
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      Map<String, dynamic> internshipsMeta = data['internships_meta'];
      List<Internship> internships = internshipsMeta.entries
          .map((entry) => Internship.fromJson(entry.value))
          .toList();

      return internships;
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
