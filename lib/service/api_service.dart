import 'dart:convert';
import 'dart:developer';

import 'package:basic_1/modal/post_modal.dart';
import 'package:http/http.dart';

class ApiService {
  Future<List<Post>> fetchPost() async {
    final response = await get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Content-Type': 'application/json'},
    );
    log('Response body: ${response.body}');

    if (response.statusCode == 200) {
      List<dynamic> jsonList = jsonDecode(response.body);
      log('Decoded JSON: $jsonList');
      return jsonList.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }
}
