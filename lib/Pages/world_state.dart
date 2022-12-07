import 'package:covid_19_with_api/Component/pie_card.dart';
import 'package:covid_19_with_api/Models/World_Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import '../Services/fatch_api.dart';
import 'County_Page/countries_state.dart';

class world_state extends StatefulWidget {
  const world_state({Key? key}) : super(key: key);

  @override
  State<world_state> createState() => _world_stateState();
}

class _world_stateState extends State<world_state>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    Colors.lightBlueAccent,
    Colors.deepOrange,
    Colors.black,
  ];
  @override
  Widget build(BuildContext context) {
    Stateservices stateservices = Stateservices();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:
            const Center(child: Text("C O V I D - 19",style: TextStyle(color: Colors.black54),)),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("Minhaz"),
              SizedBox(
                height: size.height * .02,
              ),
              FutureBuilder(
                  future: stateservices.fatchworldstateRecord(),
                  builder: ((context, AsyncSnapshot<WorldModel> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          controller: _controller,
                          color: Colors.deepOrange,
                          size: 40.00,
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          PieChart(
                            dataMap: {
                              "Total": double.parse(
                                  snapshot.data!.recovered.toString()),
                              "Recover":
                                  double.parse(snapshot.data!.cases.toString()),
                              "Death": double.parse(
                                  snapshot.data!.deaths.toString()),
                            },
                            colorList: colorList,
                            animationDuration:
                                const Duration(milliseconds: 800),
                            chartType: ChartType.ring,
                            chartValuesOptions: const ChartValuesOptions(
                              showChartValuesInPercentage: true,
                            ),
                            legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left),
                            chartRadius: 170,
                            ringStrokeWidth: 25,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Card(
                              child: Column(
                                children: [
                                  Piecard(
                                    title: "Total",
                                    value: snapshot.data!.cases.toString(),
                                  ),
                                  Piecard(
                                    title: "Deaths",
                                    value: snapshot.data!.deaths.toString(),
                                  ),
                                  Piecard(
                                    title: "Actives",
                                    value: snapshot.data!.active.toString(),
                                  ),
                                  Piecard(
                                    title: "Recovered",
                                    value: snapshot.data!.recovered.toString(),
                                  ),
                                  Piecard(
                                    title: "Critical",
                                    value: snapshot.data!.critical.toString(),
                                  ),
                                  Piecard(
                                    title: "Today Deaths",
                                    value:
                                        snapshot.data!.todayDeaths.toString(),
                                  ),
                                  Piecard(
                                    title: "Today Recovered",
                                    value: snapshot.data!.todayRecovered
                                        .toString(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * .01,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Countries_state()));
                            },
                            child: Container(
                              height: size.height * .06,
                              decoration: BoxDecoration(
                                color: Colors.deepOrange,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Track Countries',
                                  style: TextStyle(
                                      fontSize: size.height * .03,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
