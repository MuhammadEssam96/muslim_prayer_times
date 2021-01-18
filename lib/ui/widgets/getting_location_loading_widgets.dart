import 'package:flutter/material.dart';

class GettingLocationLoadingWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "Getting location..",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
          ),
          CircularProgressIndicator(strokeWidth: 5.0)
        ],
      ),
    );
  }
}