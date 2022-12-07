import 'package:covid_19_with_api/Component/pie_card.dart';
import 'package:flutter/material.dart';

import '../../Component/country_details_card.dart';

class Country_Details extends StatefulWidget {
  final String continent;
  final String country;
  final String iso3;
  final String flag;
  final dynamic updated,
      cases,
      todayCases,
      deaths,
      todayDeaths,
      recovered,
      todayRecovered,
      active,
      critical,
      casesPerOneMillion,
      deathsPerOneMillion,
      tests,
      testsPerOneMillion,
      population,
      oneCasePerPeople,
      oneDeathPerPeople,
      oneTestPerPeople;
  final dynamic activePerOneMillion;
  final dynamic recoveredPerOneMillion;
  final dynamic criticalPerOneMillion;

  const Country_Details({
    required this.continent,
    required this.country,
    required this.iso3,
    required this.flag,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.updated,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
  });

  @override
  State<Country_Details> createState() => _Country_DetailsState();
}

class _Country_DetailsState extends State<Country_Details> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(size.height*.01),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                            size.height * .03,
                          ),
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  colors: [Colors.grey, Colors.grey.shade300],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                _CustomsCard(title: "COUNTRY", value: widget.country, fontsize: size.height*.02, fontbold: FontWeight.bold, fontcolor: Colors.black),
                                Divider(
                                  color: Colors.deepOrange,
                                  thickness: 3,
                                ),
                                _CustomsCard(title: "POPULATION", value: widget.population.toString(), fontsize: size.height*.02, fontbold: FontWeight.bold, fontcolor: Colors.black),
                                _CustomsCard(title: "CONTINENT", value: widget.continent, fontsize: size.height*.02, fontbold: FontWeight.bold, fontcolor: Colors.black),
                                _CustomsCard(title: "UPDATED", value: widget.updated.toString(), fontsize: size.height*.02, fontbold: FontWeight.bold, fontcolor: Colors.black),
                              ],
                            ),
                          ),
                        ),
                        CircleAvatar(
                          radius: size.width * .12,
                          backgroundImage: NetworkImage(widget.flag),
                        ),
                      ],
                    ),
                    CountryDetailsCard(title: "CASES", value: widget.cases.toString(), iconImage: 'asset/image/driver-license.png'),
                    CountryDetailsCard(title: "TODAY CASES", value: widget.todayCases.toString(), iconImage: 'asset/image/virus (1).png'),
                    CountryDetailsCard(title: "DEATHS", value: widget.deaths.toString(), iconImage: 'asset/image/deaths.png'),
                    CountryDetailsCard(title: "TODAY DEATHS", value: widget.todayDeaths.toString(), iconImage: 'asset/image/deaths.png'),
                    CountryDetailsCard(title: "RECOVERED", value: widget.recovered.toString(), iconImage: 'asset/image/recovered.png'),
                    CountryDetailsCard(title: "TODAY RECOVERED", value: widget.todayRecovered.toString(), iconImage: 'asset/image/todayRecovered.png'),
                    CountryDetailsCard(title: "ACTIVE", value: widget.active.toString(), iconImage: 'asset/image/active.png'),
                    CountryDetailsCard(title: "CRITICAL", value: widget.critical.toString(), iconImage: 'asset/image/critical.png'),
                    CountryDetailsCard(title: "TESTS", value: widget.tests.toString(), iconImage: 'asset/image/tests.png'),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _CustomsCard(
      {required String title,
      required String value,
      required fontsize,
      required fontbold,
      required fontcolor,
      }) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: fontsize, fontWeight: fontbold, color: fontcolor),
          ),
          Text(
            value,
            style: TextStyle(
                fontSize: fontsize, fontWeight: fontbold, color: fontcolor),
          ),
        ],
      ),
    );
  }
}



