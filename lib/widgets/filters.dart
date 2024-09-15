import 'package:flutter/material.dart';

class Filters extends StatelessWidget {
  final List<String> selectedFilters;
  final Function(String, bool) onFilterSelected;

  Filters({
    required this.selectedFilters,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <String>[
            'Product Management',
            'Android App Development Intern',
            'Data Science Intern',
            'Delhi',
            'Mumbai',
            'Gurgaon',
            '3 Months',
            '2 Months',
            '5 Months'
          ]
              .map((filter) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    // Space between chips
                    child: FilterChip(
                      label: Text(
                        filter,
                        style: TextStyle(fontSize: 14.0, color: Colors.black87),
                      ),
                      selected: selectedFilters.contains(filter),
                      checkmarkColor: Colors.black,
                      onSelected: (bool selected) {
                        onFilterSelected(filter, selected);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                          color: selectedFilters.contains(filter)
                              ? Colors.black
                              : Colors.black,
                          width: 1.5,
                        ),
                      ),
                      elevation: 2.0,
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
