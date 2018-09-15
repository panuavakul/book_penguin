import 'package:flutter/material.dart';

import 'package:book_penguin/models/book.dart';

class BookListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Book Penguin')
    );
    final body = ListView(
      children: <Widget>[
        _createListTile(),
        _createListTile(),
        _createListTile(),
        _createListTile(),
        _createListTile()
      ]
    );
    final addButton = FloatingActionButton(
      child: Icon(Icons.add),
      tooltip: 'Add new books',
      onPressed: () {Navigator.of(context).pushNamed('/AddNewBookScreen');}
    );

    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton: addButton,
    );
  }

  Widget _createListTile() {
    return ListTile(
      leading: const Icon(Icons.book),
      title: const Text('食戟のソーマ'),
      subtitle: const Text('１巻'),
    );
  }
}