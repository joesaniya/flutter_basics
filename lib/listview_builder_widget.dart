import 'package:flutter/material.dart';

class ListviewBuilderWidget extends StatelessWidget {
  ListviewBuilderWidget({super.key});
  List offerList = [
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLZ1V8L7NTAe5ywJjaYgOr27RmzXa3hGdmCA&s',
      'title': 'Home Decor',
      'discount': '50%-80% off',
      'action': 'Shop Now',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLZ1V8L7NTAe5ywJjaYgOr27RmzXa3hGdmCA&s',
      'title': 'Accesories',
      'discount': '50%-80% off',
      'action': 'Shop Now',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLZ1V8L7NTAe5ywJjaYgOr27RmzXa3hGdmCA&s',
      'title': 'Cloths',

      'action': 'Shop Now',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLZ1V8L7NTAe5ywJjaYgOr27RmzXa3hGdmCA&s',
      'title': 'Utilities',
      'discount': '50%-80% off',
      'action': 'Shop Now',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLZ1V8L7NTAe5ywJjaYgOr27RmzXa3hGdmCA&s',
      'title': 'Courses',
      'discount': '50%-80% off',
      'action': 'Shop Now',
    },
    {
      'image':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLZ1V8L7NTAe5ywJjaYgOr27RmzXa3hGdmCA&s',
      'title': 'Gadgets',
      'discount': '50%-80% off',
      'action': 'Shop Now',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listview Builder Widget')),
      body: ListView.separated(
        itemCount: offerList.length,
        reverse: true,
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) => Divider(
          height: 2,
          color: Colors.grey,
          indent: 20.0,
          endIndent: 25.0,
        ),
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            height: 360,
            decoration: BoxDecoration(
              color: Color(0xFFFFEBE9),
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(offerList[index]['image']!),
                Container(
                  child: Column(
                    children: [
                      Text(offerList[index]['title']!),
                      Text(
                        offerList[index]['discount'] ?? 'No Discount',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      Text(offerList[index]['action']),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),

      /*   body: ListView.builder(
        itemCount: offerList.length,
        reverse: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            height: 360,
            decoration: BoxDecoration(
              color: Color(0xFFFFEBE9),
              borderRadius: BorderRadius.all(Radius.circular(2)),
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Image.network(offerList[index]['image']!),
                Container(
                  child: Column(
                    children: [
                      Text(offerList[index]['title']!),
                      Text(
                        offerList[index]['discount'] ?? 'No Discount',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      Text(offerList[index]['action']),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
   */
    );
  }
}
