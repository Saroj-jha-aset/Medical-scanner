import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiService {

  Future<String> uploadReport(File imageFile) async {

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('http://10.0.2.2:8000/upload-report'),
    );

    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        imageFile.path,
      ),
    );

    var streamedResponse = await request.send();
    var response = await http.Response.fromStream(streamedResponse);

    if (response.statusCode == 200) {

      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/report.xlsx';

      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      print("Saved at: $filePath");

      // ✅ RETURN path instead of opening
      return filePath;

    } else {
      throw Exception("Upload failed: ${response.statusCode}");
    }
  }
}