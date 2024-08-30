
class QuoteModal {
  late String author, quote, category;
  bool isFavorite;

  QuoteModal({
    required this.author,
    required this.quote,
    required this.category,
     this.isFavorite=false,
  });

  factory QuoteModal.fromJson(Map<String, dynamic> json) {
    return QuoteModal(
      author: json['author'] ?? 'Unknown',
      quote: json['quote'] ?? '',
      category: json['category'] ?? 'General',
      isFavorite: json['isFavorite']==1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'quote': quote,
      'category': category,
      'isFavorite':isFavorite?0:1,
    };
  }
}