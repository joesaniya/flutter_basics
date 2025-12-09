import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue.shade50,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 20),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                Scaffold.of(context).closeDrawer(); //closing drawer
              },
              icon: Icon(Icons.close),
            ),
          ),
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),*/
                CachedNetworkImage(
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  imageUrl:
                      'https://www.kindpng.com/picc/m/78-785827_user-profile-avatar-login-account-icon-png.png',
                  imageBuilder: (context, imageProvider) =>
                      CircleAvatar(radius: 40, backgroundImage: imageProvider),
                ),
                Text(
                  'Shinchan',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'shinchan@gmail.com',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(color: Colors.blue.shade100),
          ),
          InkWell(
            onTap: () {
              log('Menu tapped');
            },
            child: Row(
              children: [
                Icon(Icons.menu, size: 30),
                SizedBox(width: 10),
                Text(
                  'Menu',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Divider(color: Colors.grey),
          InkWell(
            onTap: () {
              log('Menu tapped');
            },
            child: Row(
              children: [
                Icon(Icons.home, size: 30),
                SizedBox(width: 10),
                Text(
                  'Home',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
