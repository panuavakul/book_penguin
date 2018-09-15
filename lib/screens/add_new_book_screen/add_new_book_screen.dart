import 'package:flutter/material.dart';

import 'package:book_penguin/screens/add_new_book_screen/widgets/search_books_view.dart';

class AddNewBookScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('コレクション追加')
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: SearchBooksView()
      )
    );
  }
}