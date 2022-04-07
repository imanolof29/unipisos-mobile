import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:unipisos/components/drawer.dart';
import 'package:unipisos/constants.dart';
import 'package:unipisos/models/anuncio.dart';
import 'package:unipisos/screens/details/details.dart';
import 'package:unipisos/services/anuncio_service.dart';
import 'package:flutter_svg/svg.dart';

import 'anuncio_shimmer.dart';


class Home extends StatefulWidget{

  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState()=> _HomeState();
}


class _HomeState extends State<Home>{

  AnuncioService anuncioService = AnuncioService();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor(appBarColor),
        elevation: 0,
        title: Row(
          children: [
            Text(
              'uni',
              style: TextStyle(
                fontFamily: 'Rhodium Libre',
                fontSize: 24,
                color: HexColor(negroGris),
              ),
            ),
            Text(
              'pisos',
              style: TextStyle(
                fontFamily: 'Rhodium Libre',
                fontSize: 24,
                color: HexColor(verdePrimary)
              ),
            ),
            Text(
              '.com',
              style: TextStyle(
                fontFamily: 'Rhodium Libre',
                fontSize: 24,
                color: HexColor(blanco)
              ),
            )
          ],
        ),
        leading: IconButton(onPressed: () => Drawer(), icon: SvgPicture.asset('assets/icons/menu.svg')),
        actions: [
          IconButton(onPressed: (){}, icon: SvgPicture.asset('assets/icons/search.svg')),
        ],
      ),
      body: FutureBuilder<List<Anuncio>>(
        future: anuncioService.fetchAnuncios(anunciosURL),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          if(!snapshot.hasData){
            print(snapshot.error);
            return NewsCardSkelton();
          }
          return ListView.builder(
            itemCount: snapshot.data?.length,
            itemBuilder: (BuildContext context, int index){
              Anuncio anuncio = snapshot.data![index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Details(anuncio: anuncio)));
                },
                child:Row(
                children: [
                  Image.network(
                    'http://192.168.0.26:8000${anuncio.imagenes[0]}',
                    height: size.height*0.2,
                    width: size.width*0.4,
                    fit: BoxFit.fill
                  ),
                  Text(anuncio.titulo)
                ],
              )
              );
            }
          );
        }
      ),
    );
  }
}
//Colors.black.withOpacity(0.5)

/**
 * /*Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: Image.asset('assets/images/madrid.jpeg'),
              ),
              Positioned(
                child: Column(
                  children: [
                    Text(
                      'Encuentra un piso o residencia al instante cerca de tu universidad',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: HexColor(blanco),
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: size.height*0.05,
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
              'Explora +5000 pisos en toda España',
              textAlign: TextAlign.center
            ),
              ],
            )
          ),
          Expanded(
            child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index){
              return Location();
            },
          ),
          ),
        ],
      ),*/
 */