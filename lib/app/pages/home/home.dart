import 'package:flutter/material.dart';
import 'package:simulador_crise/app/pages/consultor/consultor.dart';
import 'components/button.dart';
import '../../routers/page_router.dart';
import '../simulator/simulator.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(210, 255, 255, 255),
      appBar: AppBar(
        title: Text("Prever Crise"),
        backgroundColor: Color(0xFF245393),
      ),
      body:  GridView.count(
          primary: false,
          padding: EdgeInsets.all(20),
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
  childAspectRatio: 2,
          children: [
            Button(label: "Simulador", icon: Icons.addchart_outlined, onPressed: ()=>Navigator.of(context).push(PageRouter(Simulator())),),
            Button(label: "Seu Consultor", icon: Icons.nat,onPressed: ()=>Navigator.of(context).push(PageRouter(Consultor())),),
            Button(label: "Comunidade", icon: Icons.group,onPressed: (){},),
            Button(label: "Relatórios", icon: Icons.analytics_outlined,onPressed: (){},),
          ],
        ),

    );
  }
}
