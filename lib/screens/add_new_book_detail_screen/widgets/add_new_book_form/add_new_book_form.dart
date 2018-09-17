import 'package:flutter/material.dart';

import 'package:book_penguin/models/book.dart';
import './add_new_book_form_view.dart';

class AddNewBookForm extends StatefulWidget {
  final Book book;

  AddNewBookForm(
    this.book
  );

  @override
  AddNewBookFormView createState() => new AddNewBookFormView(book);
}