import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MainScren extends StatefulWidget {
  @override
  _MainScrenState createState() => _MainScrenState();
}

class _MainScrenState extends State<MainScren> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          header(),
          body(),
          footer(),
        ],
      ),
    );
  }

  Widget header() {
    return Stack(
      children: <Widget>[
        ClipPath(
          child: Container(
            height: 200,
            //color: Colors.blue,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.5, 0.9],
                colors: [
                  Color(0xFF12c2e9),
                  Color(0xFFc471ed),
                  Color(0xFFf64f59),
                ]
              )
            ),
          ),
          clipper: MyCustomClip(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              child:Icon(Icons.menu, size: 36, color: Colors.white30,)
            ),
            Container(
              padding: EdgeInsets.all(12),
              child:Icon(Icons.dialpad, size: 36, color: Colors.white30,)
            ),
            
          ],
        ),
        Container(
          margin: EdgeInsets.only(top:120),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.plus_one),
              ),
              Container(
                // color: Colors.grey,
                padding: EdgeInsets.all(4),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage('assets/face.jpg'), fit: BoxFit.cover)
                  ),
                  // child: Icon(Icons.plus_one),
                ),
              ),
              
              Container(
                width: 50,
                height: 50,
                decoration: new BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.favorite),
              )
            ],
          ),
        )
        
      ],
    );
  }

  Widget body() {
    return Container();
  }

  Widget footer() {
    return Container();
  }
}


class MyCustomClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
      size.width/2, size.height-100,
      size.width, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}