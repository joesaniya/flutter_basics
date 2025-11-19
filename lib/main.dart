import 'package:basic_1/assignment_issue.dart';
import 'package:basic_1/form_screen.dart';
import 'package:basic_1/gridview_widgets.dart';
import 'package:basic_1/listview_widgets.dart';
import 'package:basic_1/page_switcher.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent),
      ),
      home: FormScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  final String title = 'Flutter Demo Home Page';

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: Icon(Icons.arrow_back_ios, color: Colors.deepPurple, size: 20),
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print('person is clicked');
            },
            icon: Icon(Icons.person),
          ),

          IconButton(
            onPressed: () {
              log('logout is clicked');
            },
            icon: Icon(Icons.logout),
          ),
          SizedBox(width: 6),
          GestureDetector(
            onTap: () {
              log('image is clicked');
            },
            child: Image.network(
              'https://images.unsplash.com/photo-1511895426328-dc8714191300?w=400',
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //column
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

            //row
            Container(
              width: 400,
              height: 300,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFEBE9),
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLZ1V8L7NTAe5ywJjaYgOr27RmzXa3hGdmCA&s',
                  ),
                  SizedBox(width: 20),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
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
            CircleAvatar(
              backgroundColor: Colors.deepPurple,
              radius: 200,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6ebxI3YHH2PKN2pl0qVph8uwex7A3Qd-HmQ&s',
                ),
                radius: 180,
              ),
            ),

            SizedBox(height: 20),
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                borderRadius: BorderRadius.all(Radius.circular(200)),
              ),
              padding: EdgeInsets.all(20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6ebxI3YHH2PKN2pl0qVph8uwex7A3Qd-HmQ&s',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                log('Inkwell is clicked');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListviewWidgets()),
                );
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (context) => ListviewWidgets()),
                //   (route) => false,
                // );
              },
              splashColor: Colors.purple,
              hoverColor: Colors.purple.shade100,

              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Inkwell',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
