import 'package:flutter/material.dart';


class BottomSheetWidgetClass{
  BottomSheetWidget(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Container(
          margin: EdgeInsets.only(left: 20, right: 20),
          height: 200,
          color: Colors.white,
          child: Center(
            child: Row(
              children: [
                Text('This is a bottom sheet'),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.close),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}