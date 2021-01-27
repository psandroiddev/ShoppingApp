import 'package:flutter/material.dart';

class Discount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network('https://london.bridestory.com/images/c_fill,dpr_1.0,f_auto,fl_progressive,pg_1,q_80,w_680/v1/assets/17495330_299414077159762_5371646680061968384_n_1_rxl6ih/vco-jewellery_seven-days-left-diamond-ring-and-jewellery-discount_1.jpg',
      fit: BoxFit.fill,
      height: MediaQuery.of(context).size.height,),
    );
  }
}
