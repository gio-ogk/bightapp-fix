class BightQuote {
  String quoteText;
  String quoteAuthor;

  BightQuote({
    required this.quoteText,
    required this.quoteAuthor,
  });
}

class QuoteData {
  String data;
  QuoteData({required this.data});

  factory QuoteData.fromJson(Map<String, dynamic> json){
    return QuoteData(data: json['data']);
  }
}