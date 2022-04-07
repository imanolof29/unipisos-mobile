import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unipisos/constants.dart';

class Location extends StatelessWidget{
  const Location({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            child: Image.asset('assets/images/barcelona.jpeg')
          ),
          Positioned(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.5)
              ),
              height: size.height*0.05,
              child: Row(
                children: [
                  Text(
                    'Barcelona',
                    style: TextStyle(
                      fontSize: 18,
                      color: HexColor(blanco),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Desde 350€/persona',
                  style: TextStyle(
                    fontSize: 18,
                    color: HexColor(blanco),
                  ),
                )
              ],
            ),
          )
        ),
      ],
    );
  }
}