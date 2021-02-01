
import 'package:flutter/material.dart';

///we pass in a width to handle the horizontal spacing between
/// components with this

class HMargin extends StatelessWidget {
final double h;
const  HMargin(this.h);
  @override
  Widget build(BuildContext context) {
    return SizedBox(width:h);
  }
}
///we pass in a hieght to handle the vertical spacing between
/// components with this
class VMargin extends StatelessWidget {
final double v;
const  VMargin(this.v);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width:v);
  }
}


///setup to maintain device screen height.
double screenHeight (BuildContext context,{double percent})=>
  MediaQuery.of(context).size.height*percent;

///setup to maintaing device screen width
double screenWidth(BuildContext context,{double percent})=>
  MediaQuery.of(context).size.width*percent;