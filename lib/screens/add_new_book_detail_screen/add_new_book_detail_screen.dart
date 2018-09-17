import 'package:flutter/material.dart';
import './widgets/add_new_book_form/add_new_book_form.dart';
import 'package:book_penguin/models/book.dart';

class AddNewBookDetailScreen extends StatelessWidget {

  // NOTE: This is how tutorial set the path so it can be called from anywhere
  static const String routeName = '/addNewBookDetailScreen';

  final Book book;

  AddNewBookDetailScreen(
    this.book
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('コレクション追加')
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: AddNewBookForm(book)
      )
    );
  }
}