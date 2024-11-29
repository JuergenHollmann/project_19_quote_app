import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_19_quote_app/quotes_random.dart';
import 'package:project_19_quote_app/quotes_repo.dart';

class GetUriFromAPI extends StatefulWidget {
  const GetUriFromAPI({super.key});

  @override
  State<GetUriFromAPI> createState() => _GetUriFromAPIState();
}

class _GetUriFromAPIState extends State<GetUriFromAPI> {
  @override
  void initState() {
    super.initState();
  }

  Future<QuotesRepo?> getQuote() async {
    const uriString = "https://api.api-ninjas.com/v1/quotes?category=birthday";
    // Die Anfrage an den Server wird mit "await get(Uri.parse(uriString));" gestellt.
    // Als Antwort kommt die "reponse" zurück.
    final response = await http.get(Uri.parse(uriString),
        // Bei "api.api-ninjas.com" benötigt man noch einen "X-API-Key" - dieser wird hier hinzugefügt:
        headers: {"X-API-Key": "l+CE1RR3ZW0yIo6dhwc0HQ==aY0laKm7ph0Yud7n"});
    // Wenn der "response.statusCode" = 200 ist, war die Anfrage erfolgreich.
    if (response.statusCode == 200) {
      // Die Daten sind im "response.body" als JSON-String, der umgewandelt werden muss.
      // Dafür wird die Funktion "jsonDecode()"" verwendet.
      final List<dynamic> decodedJson = jsonDecode(response.body);
      log("0098 - $decodedJson");
      log(decodedJson[0]["category"]);
      final quote = QuotesRepo.fromJson(decodedJson[0]);
      return quote;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
            future: getQuote(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Fehlermeldung: ${snapshot.error}',
                  ),
                );
              } else if (!snapshot.hasData) {
                return Center(
                  child: Text(
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 82, 149),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                    '$getQuote',
                  ),
                );
              }
              return QuotesRandom(
                quote: snapshot.data!,
              );
            }),
        const SizedBox(height: 32),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.blue),
          ),
          onPressed: () async {
            setState(() {
              getQuote();
            });
          },
          child: const Text(
            "Neues Zitat zeigen",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
      ],
    );
  }
}
