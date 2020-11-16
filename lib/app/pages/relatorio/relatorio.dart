import 'package:flutter/material.dart';
import '../../controllers/simulator_controller.dart';
import 'chart/line_chart1.dart';

class Relatorio extends StatefulWidget {
  @override
  _RelatorioState createState() => _RelatorioState();
}

class _RelatorioState extends State<Relatorio>  with TickerProviderStateMixin {
  SimulatorController controller = SimulatorController.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    controller.calcPercent();
    print(controller.percent);
    print(controller.receita);
    return Scaffold(
      backgroundColor: Color.fromARGB(210, 255, 255, 255),
      appBar: AppBar(
        title: Text("Resultados da Simulação"),
        backgroundColor: Color(0xFF245393),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Analise de cenários", style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30
            ),
              textAlign: TextAlign.left,),
            Divider(
              height: 10,
              color: Colors.transparent,
            ),
            RichText(text: TextSpan(
              text: "Seu negócio vai ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
              children: [
                TextSpan(
                  text: controller.percent >= 0 && controller.receita >= 0 ? "bem" : "mal",
                  style: TextStyle(
                    color: controller.percent >= 0 && controller.receita >= 0 ? Colors.teal : Colors.red,
                  )
                ),
                TextSpan(
                  text: ", pois o lucro teve uma variação de ",
                ),
                TextSpan(
                    text: "${controller.percent.toStringAsFixed(2)}%",
                    style: TextStyle(
                      color: controller.percent >= 0 ? Colors.teal : Colors.red,
                    )
                ),
                TextSpan(
                  text: " e sua receita ",
                ),
                TextSpan(
                    text: controller.receita >= 0 ? "cresceu" : "diminuiu",
                    style: TextStyle(
                      color: controller.receita >= 0 ? Colors.teal : Colors.red,
                    )
                ),
                TextSpan(
                    text: " ${controller.receita.toStringAsFixed(2)}%",
                    style: TextStyle(
                      color: controller.receita >= 0 ? Colors.teal : Colors.red,
                    )
                ),
                TextSpan(
                  text: " nos últimos meses.",
                ),
              ]
            )),

            Divider(
              height: 10,
              color: Colors.transparent,
            ),
            Text("Legenda:", style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),),
    RichText(text: TextSpan(
                text: "Vermelho: ",
                style: TextStyle(
                color: Colors.redAccent,
                fontSize: 20,
                ),
                children: [
                TextSpan(
                text: "Lucro esperado",
                style: TextStyle(
                color: Colors.black,
                )
                ),])),
            RichText(text: TextSpan(
                text: "Verde: ",
                style: TextStyle(
                  color: Colors.teal,
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                      text: "Lucro conseguido",
                      style: TextStyle(
                        color: Colors.black,
                      )
                  ),])),

            Divider(
              height: 10,
              color: Colors.transparent,
            ),

            LineChartSample1(),

            Divider(
              height: 10,
              color: Colors.transparent,
            ),

          ],
        ),
    ));
  }

}
