import 'package:http/http.dart' as http;

class FormDataParams {
  Map<String, dynamic>? body;
  List<http.MultipartFile>? images;

  FormDataParams({
    this.body,
    this.images,
  });
}
