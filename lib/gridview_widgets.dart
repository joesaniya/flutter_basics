import 'package:flutter/material.dart';

class GridViewCountWidgets extends StatelessWidget {
  const GridViewCountWidgets({super.key});
  

  @override
  Widget build(BuildContext context) {
    List fruits=['apple','Banana','Straw','mango','gova'];
    return Scaffold(
      appBar: AppBar(title: Text('gridview count')),
      body: ListView(
        children: [
          SizedBox(
            height: 500,
            child: GridView.count(
              padding: EdgeInsets.all(10),
              crossAxisCount: 3, //horizontal
              crossAxisSpacing: 8,
              mainAxisSpacing: 5,
              children: List.generate(6, (index) {
                return Container(
                  decoration: BoxDecoration(color: Color(0xFF109D59)),
                );
              }),
            ),
          ),

          SizedBox(
            height: 200,
            child: GridView.extent(
              padding: EdgeInsets.all(10),
              maxCrossAxisExtent: 100,
              crossAxisSpacing: 8,
              mainAxisSpacing: 5,
              children: List.generate(6, (index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 157, 16, 37),
                  ),
                );
              }),
            ),
          ),

          //gridviewbuilder
          SizedBox(
            height: 500,
            child: GridView.builder(
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(color: Color(0xFF3A50D3)),
                  child:Center(child:Text(fruits[index],))
                  
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 5,
              ),
              itemCount: fruits.length,
            ),
            // child: GridView.builder(
            //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 4,
            //     crossAxisSpacing: 8,
            //     mainAxisSpacing: 5,
            //   ),
            //   itemCount: 8,
            //   itemBuilder: (context, index) {
            //     return Container(
            //       decoration: BoxDecoration(
            //         color: Color(0xFF3A50D3),
            //       ),
            //     );
            //   },
            // ),
          ),
        ],
      ),
    );
  }
}