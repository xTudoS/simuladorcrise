import 'package:flutter/material.dart';
import 'package:simulador_crise/app/pages/home/components/button.dart';
import 'package:simulador_crise/app/pages/simulator/simulator.dart';
import 'package:simulador_crise/app/routers/page_router.dart';

class Consultor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(210, 255, 255, 255),
      appBar: AppBar(
        title: Text("Seu Consultor"),
        backgroundColor: Color(0xFF245393),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child: Column(
                children: [
                  Icon(Icons.person, size: 200,),
                  Text("Fábio Sardena", style: TextStyle(
                    color: Color(0xFF245393),
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),),
                  Text("Consultor Linker", style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),),
                ],
              ),
            ),
           Expanded(
             child:  GridView.count(
               primary: false,
               padding: EdgeInsets.all(20),
               mainAxisSpacing: 10,
               crossAxisSpacing: 10,
               crossAxisCount: 2,
               childAspectRatio: 2,
               children: [
                 Button(label: "Plano de crise", icon: Icons.addchart_outlined, onPressed: ()=>Navigator.of(context).push(PageRouter(Simulator())),),
                 Button(label: "Mentoria", icon: Icons.nat,onPressed: ()=>Navigator.of(context).push(PageRouter(Consultor())),),
                 Button(label: "Inspeção", icon: Icons.group,onPressed: (){},),
                 Button(label: "Relatórios", icon: Icons.analytics_outlined,onPressed: (){},),
               ],
             ),
           )
          ],
        ),
      ),
    );
  }
}
