import 'dart:convert';
import 'dart:developer';

import 'package:basic_1/modal/post_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<Post>> fetchPost() async {
    final response = await http.get(
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

  Future<Post> createPost(Post post) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(post.toJson()),
    );
    log('Response body: ${response.body}');
    log('Status code: ${response.statusCode}');
    if (response.statusCode == 200 || response.statusCode == 201) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create post');
    }
  }

  Future deletePost(int id) async {
    final response = await http.delete(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
      headers: {'Content-Type': 'application/json'},
    );
    log('response code:${response.statusCode}');
    if (response.statusCode == 200) {
      log('deleted successfully');
    } else {
      log('not deleted');
    }
  }

  Future<dynamic> updatePost(int id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/$id'),
      headers: {'Content-Type': 'application/json'},
    );
    log('response code:${response.statusCode}');
    if (response.statusCode == 200) {
      log('updated successfully');
    } else {
      log('not updated');
    }
  }
}
