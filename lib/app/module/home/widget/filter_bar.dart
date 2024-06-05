import 'package:flutter/material.dart';

class FilterBar extends StatelessWidget {
  final Function() onFilterTap;
  final Function(String?) onSortChange;
  final String selectedSort;

  FilterBar({
    required this.onFilterTap,
    required this.onSortChange,
    required this.selectedSort,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: onFilterTap,
              child: Row(
                children: [
                  Icon(Icons.filter_list, color: Colors.grey[700]),
                  SizedBox(width: 8),
                  Text(
                    'Filter',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Sort by',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                SizedBox(width: 8),
                DropdownButton<String>(
                  value: selectedSort,
                  onChanged: onSortChange,
                  items: <String>['Popularity', 'Price', 'Newest']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(width: 8),
                Icon(Icons.view_list, color: Colors.grey[700]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
