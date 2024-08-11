import 'package:flutter/material.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart'; // Ensure this package is correctly set up

class FullScreen extends StatelessWidget {
  final String imgUrl;
  final _flutterMediaDownloaderPlugin = MediaDownload(); // Fixed the missing semicolon

  FullScreen({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imgUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                // Ensure this method is correct for downloading an image
                // If using image_downloader, you might need to call ImageDownloader.downloadImage() instead
                await _flutterMediaDownloaderPlugin.downloadMedia(context, imgUrl);
              },
              child: const Text('Media Download'),
            ),
          ),
        ],
      ),
    );
  }
}
