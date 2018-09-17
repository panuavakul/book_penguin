import 'package:flutter/material.dart';
import 'package:book_penguin/services/search_books.dart';
import 'dart:ui';

import 'package:book_penguin/models/book.dart';
import 'package:book_penguin/screens/add_new_book_detail_screen/add_new_book_detail_screen.dart';

class SearchBooksView extends StatefulWidget {
  @override
  _SearchBooksViewState createState() => new _SearchBooksViewState();
}

class _SearchBooksViewState extends State<SearchBooksView> {
  // States
  List<Book> searchResults = List<Book>();

  FocusNode _searchTextFocus = new FocusNode();
  TextEditingController _textEditingController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchTextFocus.addListener(_didFinishTyping);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _createSearchTextField(),
        new Expanded(
          child: _createSearchResultTextField()
        )
      ]
    );
  }

  // Move this to factory constructor
  Widget _createSearchTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        icon: Icon(Icons.search),
        hintText: "タイトルから検索"
      ),
      focusNode: _searchTextFocus,
      controller: _textEditingController
    );
  }

  Widget _createSearchResultTextField() {
    // TODO: Change to ListView.builder
    // https://flutter.io/cookbook/navigation/passing-data/
    List<Widget> childrens = List<Widget>();
    for (var result in searchResults) {
      childrens.add(_createBookTile(result));
    }
    return ListView(
      children: childrens
    );
  }

  Widget _createBookTile(Book book) {
    Widget coverImage;
    if (book.imageLinks.thumbnail == '') {
      coverImage = Icon(Icons.book);
    } else {
      coverImage = Image.network(
        book.imageLinks.thumbnail,
        fit: BoxFit.scaleDown,
        height: 50.0,
      );
    }
    final authorsString = book.authors.join(' ');
    return ListTile(
      leading: coverImage,
      title: Text(book.title),
      subtitle: Text(authorsString),
      onTap: _didTapCell(context, book),
    );
  }

  _didFinishTyping() async {
    if (_searchTextFocus.hasFocus == false) {
      print(_textEditingController.text);
      final searchResults = await searchBook(_textEditingController.text, 'AIzaSyD2EEI7bsbCD3cEOx5CqHypZjdn6QEXcdI');
      setState(() {
        this.searchResults = searchResults;
      });
    }
  }

  VoidCallback _didTapCell(BuildContext context, Book book) {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddNewBookDetailScreen(book)
        )
      );
    };
  }
}