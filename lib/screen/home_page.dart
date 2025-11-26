import 'dart:developer';
import 'dart:ffi';

import 'package:basic_1/modal/post_modal.dart';
import 'package:basic_1/service/api_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var post;
  bool isLoading = true;
  @override
  void initState() {
    fetchApi();
    super.initState();
  }

  fetchApi() async {
    log('api call');
    final datas = await ApiService().fetchPost();
    post = datas;
    isLoading = false;
    setState(() {});
    log('api call done:$post');
  }

  final addformKey = GlobalKey<FormState>();
  TextEditingController postIdController = TextEditingController();
  TextEditingController titleControler = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  void addItemUIAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add Item'),
          content: Container(
            height: 200,

            child: Form(
              key: addformKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: postIdController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Id',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter id';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: titleControler,
                    decoration: InputDecoration(
                      labelText: 'title',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    controller: bodyController,
                    decoration: InputDecoration(
                      labelText: 'body',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter body';
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (addformKey.currentState!.validate()) {
                  final parsedId = int.tryParse(postIdController.text);
                  if (parsedId == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Id must be a number')),
                    );
                    return;
                  }
                  ApiService().createPost(
                    Post(
                      userId: 90,
                      id: parsedId,
                      title: titleControler.text,
                      body: bodyController.text,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('post added was successfully!')),
                  );
                  postIdController.clear();
                  titleControler..clear();
                  bodyController..clear();
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Not validated')));
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          addItemUIAlert();
          /* ApiService()
              .createPost(
                Post(
                  userId: 1,
                  id: 101,
                  title: 'New Post',
                  body: 'This is a new post created via API',
                ),
              )
              .then((createdPost) {
                log('Created Post: ${createdPost.toJson()}');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Post Created: ${createdPost.title}')),
                );
              })
              .catchError((error) {
                log('Error creating post: $error');
              });*/
        },
        child: Icon(Icons.add),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Align(
                        alignment: AlignmentGeometry.centerRight,
                        child: IconButton(
                          onPressed: () {
                            log('Delete Id:${post[index].id}');
                            ApiService().deletePost(post[index].id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Deleted Sucessfully!!')),
                            );
                          },
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ),
                      Text(
                        post[index].title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(post[index].body),
                    ],
                  ),
                );
              },
              itemCount: post.length,
            ),
    );
  }
}
