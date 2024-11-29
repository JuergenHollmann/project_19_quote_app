import 'package:flutter/material.dart';
import 'package:project_19_quote_app/quotes_repo.dart';

class QuotesRandom extends StatelessWidget {
  const QuotesRandom({
    super.key,
    required this.quote,
  });

  final QuotesRepo quote;
  Padding quotesRandom({required String label, required String data}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Divider(color: Colors.blue,thickness: 5,),
          Text(
            label,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          // const SizedBox(height: 8),
          Text(
            data,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        quotesRandom(
          label: "Kategorie",
          data: quote.category,
        ),
        quotesRandom(
          label: "",
          data: quote.quote,
        ),
        quotesRandom(
          label: "",
          data: quote.author,
        )
      ],
    );
  }
}
