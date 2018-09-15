import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:book_penguin/models/book.dart';

Future<List<Book>> searchBook(String keyword, String key) async {
  final reqeustUrl = 'https://www.googleapis.com/books/v1/volumes?q=$keyword&key=$key';
  final response = await http.get(reqeustUrl);

    if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    return _jsonToBooks(json.decode(response.body));
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

List<Book> _jsonToBooks(Map<String, dynamic> json) {
  var books = List<Book>();
  final items = json['items'];
  for (final item in items) {
    final volumeInfo = item['volumeInfo'];
    print(volumeInfo);
    print(volumeInfo['authors']);
    var authors = new List<String>();
    if (volumeInfo['authors'] != null) {
      for (var author in volumeInfo['authors']) {
        authors.add(author);
      }
    }
    var imageLinks = ImageLinks(
      smallThumbnail:  '',
      thumbnail: '',
      small: '',
      medium: '',
      large: '',
      extraLarge: ''
    );
    if (volumeInfo['imageLinks'] != null) {
      imageLinks = ImageLinks(
          smallThumbnail: volumeInfo['imageLinks']['smallThumbnail'] ?? '',
          thumbnail: volumeInfo['imageLinks']['thumbnail'] ?? '',
          small: volumeInfo['imageLinks']['thumbnail'] ?? '',
          medium: volumeInfo['imageLinks']['thumbnail'] ?? '',
          large: volumeInfo['imageLinks']['thumbnail'] ?? '',
          extraLarge: volumeInfo['imageLinks']['thumbnail'] ?? ''
        );
    }


    books.add(
      Book (
        title: volumeInfo['title'] ?? '',
        subtitle: volumeInfo['subtitle'] ?? '',
        authors: authors,
        publisher: volumeInfo['publiser'] ?? '',
        publishedDate: volumeInfo['publishedDate'] ?? '',
        description: volumeInfo['description'] ?? '',
        imageLinks: imageLinks,
        language: volumeInfo['language'] ?? '',
        previewLink: volumeInfo['previewLink'] ?? '',
        infoLink: volumeInfo['infoLink'] ?? '',
        canonicalVolumeLink: volumeInfo['canonicalVolumeLink'] ?? ''
      )
    );
  }
  return books;
}