import 'dart:io';
import 'package:video_compress/video_compress.dart';

class VideoCompressApi{
  static Future<MediaInfo?> compressVideo(File file) async {
    try {
      print('entrando al compressapi');
      await VideoCompress.setLogLevel(0);
      print(file.path);
      return VideoCompress.compressVideo(
        file.path,
        quality: VideoQuality.LowQuality,
        includeAudio: true,
      );
    } catch (e) {
      print('imprimiendo en el error de videocompressapi $e');
      VideoCompress.cancelCompression();
      return null;
    }
  }
}