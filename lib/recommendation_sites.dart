import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RecommendationSites extends StatelessWidget {
  Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url); // Convert String to Uri
    if (!await launchUrl(uri)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daftar Situs Rekomendasi')),
      body: ListView(
        children: [
          ListTile(
            leading: Image.network('https://example.com/image1.jpg'),
            title: Text('Site 1'),
            onTap: () => _launchURL('https://example.com'),
          ),
          ListTile(
            leading: Image.network('https://example.com/image2.jpg'),
            title: Text('Site 2'),
            onTap: () => _launchURL('https://example.com'),
          ),
        ],
      ),
    );
  }
}
