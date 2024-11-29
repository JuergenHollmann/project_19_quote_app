class QuotesRepo {
  final String quote;
  final String author;
  final String category;

  QuotesRepo({
    required this.quote,
    required this.author,
    required this.category,
  });

  factory QuotesRepo.fromJson(Map<String, dynamic> json) {
    final quote = json['quote'] as String;
    final author = json['author'] as String;
    final category = json['category'] as String;
    return QuotesRepo(
      quote: quote,
      author: author,
      category: category,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quote': quote,
      'author': author,
      'category': category,
    };
  }
}
