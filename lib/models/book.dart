
class Book {
  final String title;
  final String subtitle;
  final List<String> authors;
  final String publisher;
  final String publishedDate;
  final String description;
  final ImageLinks imageLinks;
  final String language;
  final String previewLink;
  final String infoLink;
  final String canonicalVolumeLink;

  int readingStatus = 0;

  Book({
    this.title,
    this.subtitle,
    this.authors,
    this.publisher,
    this.publishedDate,
    this.description,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink
  });
}

class ImageLinks {
  final String smallThumbnail;
  final String thumbnail;
  final String small;
  final String medium;
  final String large;
  final String extraLarge;

  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
    this.small,
    this.medium,
    this.large,
    this.extraLarge
  });
}
