import 'package:url_launcher/url_launcher.dart';

Future<void> mylaunchUrl(String lat, String lng) async {
  Uri url =
      Uri.parse('https://www.google.com/maps/place/$lat,$lng/@$lat,$lng,14z');
  if (!await launchUrl(url)) {
    throw 'Could not launch $url';
  }
}
