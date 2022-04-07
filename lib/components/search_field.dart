import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget{

  final String hintText;

  const SearchField({Key? key, required this.hintText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
     padding: const EdgeInsets.symmetric(horizontal: 20),
     height: 50,
     child: Row(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
          const Icon(Icons.search),
          TextField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: const TextStyle(
                fontFamily: 'Red Rose',
                fontWeight: FontWeight.w500
              ),
            )
          )
        ],
     ),
   );
  }
}