import 'dart:developer';

import 'package:basic_1/listview_builder_widget.dart';
import 'package:flutter/material.dart';

class ListviewWidgets extends StatelessWidget {
  const ListviewWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            log('prev icon clicked');
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.deepPurple, size: 20),
        ),
        title: Text('Listview widgets'),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              log('container clicked');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ListviewBuilderWidget(),
                ),
              );
            },
            child: Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                color: Color(0xFFFFEBE9),
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLZ1V8L7NTAe5ywJjaYgOr27RmzXa3hGdmCA&s',
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text('Home Decor'),
                        Text(
                          '50%-80% off',
                          style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 20,
                          ),
                        ),
                        Text('Shop Now'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: 200,
            height: 300,
            decoration: BoxDecoration(
              color: Color(0xFFFFEBE9),
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLZ1V8L7NTAe5ywJjaYgOr27RmzXa3hGdmCA&s',
                ),
                Container(
                  child: Column(
                    children: [
                      Text('Home Decor'),
                      Text(
                        '50%-80% off',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      Text('Shop Now'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: 200,
            height: 300,
            decoration: BoxDecoration(
              color: Color(0xFFFFEBE9),
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLZ1V8L7NTAe5ywJjaYgOr27RmzXa3hGdmCA&s',
                ),
                Container(
                  child: Column(
                    children: [
                      Text('Home Decor'),
                      Text(
                        '50%-80% off',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      Text('Shop Now'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          /* ListTile(
            leading: Icon(Icons.person, color: Colors.deepPurple),
            title: Text('Person'),
            subtitle: Text('subtitle person'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
            onTap: () {
              log('person is clicked');
            },
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.deepPurple),
            title: Text('Phone'),
            subtitle: Text('subtitle phone'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
            onTap: () {
              log('phone is clicked');
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.deepPurple.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.deepPurple, width: 1),
              ),
              leading: Icon(Icons.email, color: Colors.deepPurple),
              title: Text('Email'),
              subtitle: Text('subtitle email'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
              onTap: () {
                log('email is clicked');
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.deepPurple),
            title: Text('Person'),
            subtitle: Text('subtitle person'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
            onTap: () {
              log('person is clicked');
            },
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.deepPurple),
            title: Text('Phone'),
            subtitle: Text('subtitle phone'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
            onTap: () {
              log('phone is clicked');
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.deepPurple.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.deepPurple, width: 1),
              ),
              leading: Icon(Icons.email, color: Colors.deepPurple),
              title: Text('Email'),
              subtitle: Text('subtitle email'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
              onTap: () {
                log('email is clicked');
              },
            ),
          ),

          ListTile(
            leading: Icon(Icons.person, color: Colors.deepPurple),
            title: Text('Person'),
            subtitle: Text('subtitle person'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
            onTap: () {
              log('person is clicked');
            },
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.deepPurple),
            title: Text('Phone'),
            subtitle: Text('subtitle phone'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
            onTap: () {
              log('phone is clicked');
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.deepPurple.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.deepPurple, width: 1),
              ),
              leading: Icon(Icons.email, color: Colors.deepPurple),
              title: Text('Email'),
              subtitle: Text('subtitle email'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
              onTap: () {
                log('email is clicked');
              },
            ),
          ),

          ListTile(
            leading: Icon(Icons.person, color: Colors.deepPurple),
            title: Text('Person'),
            subtitle: Text('subtitle person'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
            onTap: () {
              log('person is clicked');
            },
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.deepPurple),
            title: Text('Phone'),
            subtitle: Text('subtitle phone'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
            onTap: () {
              log('phone is clicked');
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.deepPurple.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.deepPurple, width: 1),
              ),
              leading: Icon(Icons.email, color: Colors.deepPurple),
              title: Text('Email'),
              subtitle: Text('subtitle email'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
              onTap: () {
                log('email is clicked');
              },
            ),
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.deepPurple),
            title: Text('Person'),
            subtitle: Text('subtitle person'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
            onTap: () {
              log('person is clicked');
            },
          ),
          ListTile(
            leading: Icon(Icons.phone, color: Colors.deepPurple),
            title: Text('Phone'),
            subtitle: Text('subtitle phone'),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
            onTap: () {
              log('phone is clicked');
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              tileColor: Colors.deepPurple.shade50,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(color: Colors.deepPurple, width: 1),
              ),
              leading: Icon(Icons.email, color: Colors.deepPurple),
              title: Text('Email'),
              subtitle: Text('subtitle email'),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.deepPurple),
              onTap: () {
                log('email is clicked');
              },
            ),
          ),*/
        ],
      ),
    );
  }
}
