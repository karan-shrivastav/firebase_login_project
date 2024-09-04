import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = 'https://gymwise.in/api/v1/';

  Future<http.Response> apiCallTypePost(String endPoint,
      {Map<String, dynamic>? body}) async {
    var url = Uri.parse('$baseUrl$endPoint');
    var response = await http.post(
      url,
      body: body,
    );
    return response;
  }
}
