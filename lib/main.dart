import 'package:flutter/material.dart';
import 'package:project_19_quote_app/get_uri_from_api.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "Zitate-App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: const Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GetUriFromAPI(),
            /*--------------------------------- *** ---*/
          ],
        )),
      ),
    );
  }
}

/*--------------------------------------------------------------------------------------------*
Projekt 19 - (5.4.1-5.4.5) - Zitate-App
√ https://docs.google.com/document/d/1Sehd4haowgndEbZL3dCXvsQGg6xzVux3r8EBEvh0-sc/edit?tab=t.0
*---------------------------------------------------------------------------------------------*
√ Erstelle ein neues GitHub-Repository, das für dein Projekt gedacht ist.
√ https://github.com/JuergenHollmann/project_19_quote_app
*---------------------------------------------------------------------------------------------*
√ API-Textdaten abrufen und anzeigen
√ Nun sollst du Daten von einer bestimmten API abrufen.
√ Erstelle dir einen Account bei API-Ninjas und erzeuge einen API-Key.
√ Verwende Thunder oder etwas Ähnliches, um eine GET-Anfrage an die “Quotes API” zu senden.
√ Die URL der API ist: https://api-ninjas.com/api/quotes 
√ Führe die Anfrage durch und untersuche den JSON-Body, der das Zitat und den Autor enthält.
*---------------------------------------------------------------------------------------------*
√ Die Flutter-UI implementieren
√ Erstelle eine Flutter-App, die mindestens ein Text-Widget für ein Zitat und einen Button enthält.
√ Der Button muss noch nichts machen, sondern wird später ausgebaut.
*---------------------------------------------------------------------------------------------*
√ Erstelle ein Flutter-Projekt.
√ Füge ein Text-Widget mit einem Beispiel-Zitat hinzu.
√ Füge einen Button hinzu.
√ Mache commit und push.
*---------------------------------------------------------------------------------------------*
√ Ein einfaches Textzitat anzeigen
√ Nachdem die UI jetzt steht, kann das Abrufen von Daten eingebaut werden.
√ Baue die App so um, dass sie bei einem Knopfdruck ein zufälliges Zitat von der “Quotes API” abruft und auf dem Bildschirm anzeigt.
√ Verwende die http-Bibliothek, um eine GET-Anfrage zu stellen, und zeige das Zitat und den Autor in einem Text-Widget an.
√ Anmerkung: Vergiss nicht, deinen API-Key einzutragen 🙂
*---------------------------------------------------------------------------------------------*
Letztes Zitat speichern
Das letzte Zitat, das geholt wurde, soll nun gespeichert werden, damit beim App-Start gleich etwas angezeigt werden kann.
Füge das “SharedPreferences” Package zu deiner App hinzu.
Sorge dafür, dass ein geholtes Zitat immer auch in den SharedPreferences gespeichert wird.
Beim App-Start soll immer ein Zitat aus den SharedPreferences geholt werden und dieses angezeigt werden.
Hier musst du den Fall beachten, dass es noch kein gespeichertes Zitat gibt.
Baue zudem einen Button ein, um das letzte Zitat zu löschen.
*---------------------------------------------------------------------------------------------*
BONUS-Aufgaben:
*---------------------------------------------------------------------------------------------*
Kategorie von Zitaten anzeigen lassen
Füge ein Dropdown-Menü zu deiner Flutter-App hinzu, mit dem der Benutzer eine bestimmte Kategorie von Zitaten auswählen kann (z.B. “Inspirational”, “Love”).
Die Zitate können auch von der API geholt werden. Dies muss beim App-Start passieren. Baue dies ein.
Verändere die App so, dass Zitate basierend auf der Auswahl geladen werden.
Baue einen Button für das Zurücksetzen der Zitat-Kategorie ein.
*---------------------------------------------------------------------------------------------*
Ausgewählte Zitate-Kategorie speichern
Speichere auch die Zitate-Kategorie über den App-Start hinweg.
*---------------------------------------------------------------------------------------------*
Woher kommen die Daten?
https://api.api-ninjas.com/v1/quotes?category=birthday
X-Api-Key  erforderlich = mit dem Konto verknüpfter API-Schlüssel:
API-Key: l+CE1RR3ZW0yIo6dhwc0HQ==aY0laKm7ph0Yud7n
*---------------------------------------------------------------------------------------------*
        /*--------------------------------- response-Beispiel von api-ninjas ---*/
        // [
        // {
        // "quote": "I'm amazed. When I was 40, I thought I'd never make 50. (usw.)",
        // "author": "Gloria Stuart",
        // "category": "birthday"
        // }
        // ]
        /*--------------------------------- response-Beispiel von api-ninjas - ENDE ---*/
*---------------------------------------------------------------------------------------------*
var headersList = {
 'Accept': 'application/json',
 'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
 'X-Api-Key': 'l+CE1RR3ZW0yIo6dhwc0HQ==aY0laKm7ph0Yud7n' 
};
var url = Uri.parse('https://api-ninjas.com/api/quotes');

var req = http.Request('GET', url);
req.headers.addAll(headersList);

var res = await req.send();
final resBody = await res.stream.bytesToString();

if (res.statusCode >= 200 && res.statusCode < 300) {
  print(resBody);
}
else {
  print(res.reasonPhrase);
}
*---------------------------------------------------------------------------------------------*
Auswahl der Kategorien:
age
alone
amazing
anger
architecture
art
attitude
beauty
best
birthday
business
car
change
communication
computers
cool
courage
dad
dating
death
design
dreams
education
environmental
equality
experience
failure
faith
family
famous
fear
fitness
food
forgiveness
freedom
friendship
funny
future
god
good
government
graduation
great
happiness
health
history
home
hope
humor
imagination
inspirational
intelligence
jealousy
knowledge
leadership
learning
legal
life
love
marriage
medical
men
mom
money
morning
movies
success
*--------------------------------------------------------------------------------------------*/
