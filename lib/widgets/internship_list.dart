import 'package:flutter/material.dart';
import '../service/api_service.dart';

class InternshipList extends StatelessWidget {
  final List<Internship> internships;

  InternshipList({required this.internships});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: internships.length,
      itemBuilder: (context, index) {
        return InternshipCard(internship: internships[index]);
      },
    );
  }
}

class InternshipCard extends StatelessWidget {
  final Internship internship;

  InternshipCard({required this.internship});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      elevation: 6.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and company name with icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    internship.title,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis, // To prevent overflow
                  ),
                ),
                Icon(
                  Icons.business_center,
                  color: Colors.black,
                  size: 24.0,
                ),
              ],
            ),
            SizedBox(height: 8.0),

            Text(
              internship.companyName,
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey[600],
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Divider(color: Colors.grey[300]),

            // Details section with icons
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.blueAccent, size: 20.0),
                SizedBox(width: 6.0),
                Expanded(
                  child: Text(
                    internship.location,
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[800]),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.0),

            Row(
              children: [
                Icon(Icons.attach_money, color: Colors.green, size: 20.0),
                SizedBox(width: 6.0),
                Expanded(
                  child: Text(
                    'Stipend: ${internship.stipend}',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[800]),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.0),

            Row(
              children: [
                Icon(Icons.date_range, color: Colors.orangeAccent, size: 20.0),
                SizedBox(width: 6.0),
                Expanded(
                  child: Text(
                    'Start Date: ${internship.startDate}',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[800]),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.0),

            Row(
              children: [
                Icon(Icons.schedule,
                    color: Colors.deepPurpleAccent, size: 20.0),
                SizedBox(width: 6.0),
                Expanded(
                  child: Text(
                    'Duration: ${internship.duration}',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[800]),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.0),

            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.blue, size: 20.0),
                SizedBox(width: 6.0),
                Expanded(
                  child: Text(
                    'Posted On: ${internship.postedOn}',
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[800]),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
