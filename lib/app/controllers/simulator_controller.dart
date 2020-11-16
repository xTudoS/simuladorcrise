class SimulatorController {
  SimulatorController._(){
    var date = DateTime.now();
    var prevMonth;
    print(data);
    for (var i=2; i >= 0; i--){
      prevMonth = new DateTime(date.year, date.month - i, date.day);
      print(prevMonth);
      month.add(
      prevMonth.month - 1
      );
    }
    print(month.toString());
  }
  static SimulatorController instance = SimulatorController._();

  get monthName => MONTHS[month[monthIndex]];

  String monthNameFromIndex(int i) => MONTHS[month[i]];

  static final List<String> MONTHS = [
    "Janeiro",
    "Fevereiro",
    "Março",
    "Abril",
    "Maio",
    "Junho",
    "Julho",
    "Agosto",
    "Setembro",
    "Outubro",
    "Novembro",
    "Dezembro",
  ];

  int monthIndex = 0;
  List data = [];
  List month = [];

  void addMother(double receita, double despesas, double investimento, double lucro){
    Map<String, dynamic> dict = {
      "month": month[monthIndex],
      "receita": receita,
      "despesas": despesas,
      "investimento": investimento,
      "lucro": lucro,

    };
    data.add(dict);
  }

  double percent = 1.0;
  double receita;

  calcPercent(){
    double m1 = (results[1] / results[0]);
    double m2 = (results[2] / m1) / 100;

    percent = m2;
    receita = (data[1]["receita"]-data[0]["receita"]);
    receita = data[2]["receita"] - receita;
    if (receita == 0){
      receita = 1;
    }
    receita = ((data[1]["receita"]-data[0]["receita"]) / receita)/100;
  }

  List<double> valuesLucro = [];
  List<double> valuesLucroEsperado = [];
  double countLucro = 3;
  double countLucroEsperado = 3;

  List<double> results = [];

  generateData(){
    valuesLucro.clear();
    valuesLucroEsperado.clear();
    results.clear();
    double result;
    double resultLucro;
    for(var d in data){
      result = d["receita"] - d["despesas"] - d["investimento"];
      results.add(result == 0 ? 1 : result);
      if (result >= d["lucro"]){
        countLucro ++;
      }else {
        countLucro --;
      }
      resultLucro = d["lucro"];
      if (result >= resultLucro){
        countLucroEsperado ++;
      }else {
        countLucroEsperado --;
      }
      valuesLucro.add(countLucro);
      valuesLucroEsperado.add(countLucroEsperado);
    }

  }

}
