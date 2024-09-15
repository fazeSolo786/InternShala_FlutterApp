import 'package:flutter/material.dart';
import 'package:internshala_by_faizan/search/search_page.dart';
import 'package:internshala_by_faizan/service/api_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Internship> internships;

  CustomAppBar({required this.internships});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Image.asset(
        'assets/internshalaAppBar.png',
        height: 200,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            showSearch(
              context: context,
              delegate: InternshipSearchDelegate(internships),
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
