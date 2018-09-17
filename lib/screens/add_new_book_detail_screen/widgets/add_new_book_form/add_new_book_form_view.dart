import 'package:flutter/material.dart';

import './add_new_book_form.dart';
import './add_new_book_form_view_model.dart';
import 'package:book_penguin/models/book.dart';
import 'package:book_penguin/widgets/placeholder_image_view.dart';

class AddNewBookFormView extends AddNewBookFormViewModel {

  // NOTE: Subclass constructor
  AddNewBookFormView(Book book) : super(book);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PlaceholderImageView(
          imageUrl: book.imageLinks.thumbnail,
          placeholderIcon: Icons.book,
          height: 150.0
        ),
        // タイトル
        _createTextFormField(
          'タイトル',
          Icons.sort_by_alpha,
          book.title
        ),
        // 作者
        _createTextFormField(
          '作者',
          Icons.person,
          book.authors.join(' ')
        )
      ]
    );
  }

  Widget _createTextFormField(
    String hintText,
    IconData icon,
    String initialText
  ) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(icon),
        hintText: hintText
      ),
      initialValue: initialText
    );
  }
}