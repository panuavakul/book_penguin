import 'package:flutter/material.dart';

import './add_new_book_form.dart';
import 'package:book_penguin/models/book.dart';

abstract class AddNewBookFormViewModel extends State<AddNewBookForm> {
  @protected
  Book book;

  AddNewBookFormViewModel(
    this.book
  );
  
}