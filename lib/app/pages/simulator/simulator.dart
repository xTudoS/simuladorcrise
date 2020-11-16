import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../controllers/simulator_controller.dart';
import 'components/currencyinputformatter.dart';
import '../../routers/page_router.dart';
import '../relatorio/relatorio.dart';

class Simulator extends StatefulWidget {
  @override
  _SimulatorState createState() => _SimulatorState();
}

class _SimulatorState extends State<Simulator>  with TickerProviderStateMixin {
  SimulatorController controller = SimulatorController.instance;
  TextEditingController _receitaController = TextEditingController();
  TextEditingController _despesasController = TextEditingController();
  TextEditingController _investimentoController = TextEditingController();
  TextEditingController _lucroController = TextEditingController();
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

      _tabController =
          TabController(vsync: this, length: 3);

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3, child: Scaffold(
      backgroundColor: Color.fromARGB(210, 255, 255, 255),

      appBar: AppBar(
        title: Text("Simulador de Crise"),
        backgroundColor: Color(0xFF245393),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Dados do seu negócio", style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 30
            ),
              textAlign: TextAlign.left,),
            Divider(
              height: 10,
              color: Colors.transparent,
            ),
            Text("Para inciar, precisaremos de dados dos 3 últimos meses sobre o seu negócio.", textAlign: TextAlign.left, style: TextStyle(fontSize: 20),),
            RichText(text: TextSpan(
                text: "\nUse um ",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20
                ),
                children: [
                  TextSpan(
                    text: "valor médio mensal ",
                    style: TextStyle(
                      color: Color(0xFF245393),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextSpan(
                      text: "para as respostas"
                  ),
                ]
            )),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: List.generate(3, (index) => RaisedButton(
                     elevation: 10,
                     padding: EdgeInsets.all(10),
                     color: index == _tabController.index ? Color(0xFFFF6D70) : null,
                     onPressed: (){},
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10.0),
                         side: BorderSide(color: Color(0xFFFF6D70), width: 2)
                     ),
                     child: Text(
                       controller.monthNameFromIndex(index),
                       style: TextStyle(
                           color: index == _tabController.index ? Colors.white : Color(0xFFFF6D70),
                           fontSize: 15,
                           fontWeight: FontWeight.w500
                       ),
                     ),
                   ),),

                 ),
                  Divider(
                    height: 30,
                    color: Colors.transparent,
                  ),
                 Expanded(
                   child: TabBarView(
                     physics: NeverScrollableScrollPhysics(),
                       controller: _tabController,
                       children: List.generate(3, (index) => ListView(
                         children: [
                           RichText(text: TextSpan(
                               text: "Qual é a sua ",
                               style: TextStyle(
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                               children: [
                                 TextSpan(
                                     text: "receita",
                                     style: TextStyle(color: Colors.teal)
                                 ),
                                 TextSpan(
                                     text: "?",
                                 ),
                               ]
                           ),
                           ),
                           TextFormField(
                             keyboardType: TextInputType.number,
                             controller: _receitaController,
                             inputFormatters: [
                               FilteringTextInputFormatter.digitsOnly,
                               // Fit the validating format.
                               //fazer o formater para dinheiro
                               CurrencyInputFormatter()
                             ],
                             style: TextStyle(
                                 fontSize: 20
                             ),
                           ),
                           Divider(
                             height: 30,
                             color: Colors.transparent,
                           ),
                           RichText(text: TextSpan(
                               text: "Quanto você gasta em ",
                               style: TextStyle(
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                               children: [
                                 TextSpan(
                                     text: "despesas",
                                     style: TextStyle(color: Colors.redAccent)
                                 ),
                                 TextSpan(
                                   text: "?",
                                 ),
                               ]
                           ),
                           ),
                           TextFormField(
                             keyboardType: TextInputType.number,
                             controller: _despesasController,
                             inputFormatters: [
                               FilteringTextInputFormatter.digitsOnly,
                               // Fit the validating format.
                               //fazer o formater para dinheiro
                               CurrencyInputFormatter()
                             ],
                             style: TextStyle(
                                 fontSize: 20
                             ),
                           ),
                           Divider(
                             height: 30,
                             color: Colors.transparent,
                           ),
                           RichText(text: TextSpan(
                               text: "Quanto você ",
                               style: TextStyle(
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                               children: [
                                 TextSpan(
                                     text: "investe",
                                     style: TextStyle(color: Colors.blueAccent)
                                 ),
                                 TextSpan(
                                   text: " no negócio?",
                                 ),
                               ]
                           ),
                           ),
                           TextFormField(
                             keyboardType: TextInputType.number,
                             controller: _investimentoController,
                             inputFormatters: [
                               FilteringTextInputFormatter.digitsOnly,
                               // Fit the validating format.
                               //fazer o formater para dinheiro
                               CurrencyInputFormatter()
                             ],
                             style: TextStyle(
                                 fontSize: 20
                             ),
                           ),
                           Divider(
                             height: 30,
                             color: Colors.transparent,
                           ),
                           RichText(text: TextSpan(
                               text: "Qual a sua pretenção de ",
                               style: TextStyle(
                                 color: Colors.black,
                                 fontSize: 20,
                               ),
                               children: [
                                 TextSpan(
                                     text: "lucro",
                                     style: TextStyle(color: Colors.indigoAccent)
                                 ),
                                 TextSpan(
                                   text: "?",
                                 ),
                               ]
                           ),
                           ),
                           TextFormField(
                             keyboardType: TextInputType.number,
                             controller: _lucroController,
                             inputFormatters: [
                               FilteringTextInputFormatter.digitsOnly,
                               // Fit the validating format.
                               //fazer o formater para dinheiro
                               CurrencyInputFormatter()
                             ],
                             style: TextStyle(
                                 fontSize: 20
                             ),
                           ),
                           Divider(
                             height: 50,
                             color: Colors.transparent,
                           ),
                           Center(
                             child: SizedBox(
                               height: 50,
                               width: 200,
                               child: RaisedButton(
                                 elevation: 5,
                                 padding: EdgeInsets.all(10),
                                 onPressed: ()=>setState((){
                                   addValues();
                                  if (_tabController.index < 2){
                                    _tabController.index++;
                                  }else {
                                    controller.monthIndex = 0;
                                    controller.countLucro = 3;
                                    controller.countLucroEsperado = 3;
                                    controller.generateData();
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(PageRouter(Relatorio()));
                                  }
                                 }),
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(40.0),
                                     side: BorderSide(color: Color(0xFFFF6D70), width: 1)
                                 ),
                                 child: Text(
                                   _tabController.index == 2 ? "Gerar relatório" : "Próximo mês",
                                   style: TextStyle(
                                       color: Color(0xFFFF6D70),
                                       fontSize: 15,
                                       fontWeight: FontWeight.w500
                                   ),
                                 ),
                               ),
                             ),
                           )
                         ],
                       ))

                      )
                 )],
             )
        ),
    ),);
  }
  addValues(){
    double receita = double.parse(_receitaController.value.text.substring(3).replaceAll(".", "").replaceAll(",", "."));
    double despesas = double.parse(_despesasController.value.text.substring(3).replaceAll(".", "").replaceAll(",", "."));
    double investimento = double.parse(_investimentoController.value.text.substring(3).replaceAll(".", "").replaceAll(",", "."));
    double lucro = double.parse(_lucroController.value.text.substring(3).replaceAll(".", "").replaceAll(",", "."));
    if (controller.monthIndex == 0) {
      controller.data.clear();
    }
    controller.addMother(receita, despesas, investimento, lucro);
    controller.monthIndex++;
    disposeTextField();
  }

  disposeTextField(){
    _receitaController.text = "";
    _despesasController.text = "";
    _investimentoController.text = "";
    _lucroController.text = "";

  }
}
