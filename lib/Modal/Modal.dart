
class QuoteModal {
  final int? id;
  String author, quote, category;
  int isFavorite;

  QuoteModal({
    this.id,
    required this.author,
    required this.quote,
    required this.category,
    required this.isFavorite,
  });

  factory QuoteModal.fromJson(Map json) {
    return QuoteModal(
      id: json['id'],
      author: json['author'] ,
      quote: json['quote'] ,
      category: json['category'],
      isFavorite: json['isFavorite'],
    );
  }


  }
