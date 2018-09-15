import 'package:flutter/material.dart';
import 'package:book_penguin/services/search_books.dart';

import 'package:book_penguin/models/book.dart';

class SearchBooksView extends StatefulWidget {
  @override
  _SearchBooksViewState createState() => new _SearchBooksViewState();
}

class _SearchBooksViewState extends State<SearchBooksView> {
  // States
  List<Book> searchResults = List<Book>();

  FocusNode _searchTextFocus = new FocusNode();

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
      onTap: () {},
    );
  }

  _didFinishTyping() async {
    if (_searchTextFocus.hasFocus == false) {
      final searchResults = await searchBook('食戟20', 'AIzaSyD2EEI7bsbCD3cEOx5CqHypZjdn6QEXcdI');
      setState(() {
        this.searchResults = searchResults;
      });
    }
  }
}