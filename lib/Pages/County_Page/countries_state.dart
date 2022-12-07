import 'package:covid_19_with_api/Pages/County_Page/county_details.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../Services/fatch_api.dart';

class Countries_state extends StatefulWidget {
  const Countries_state({Key? key}) : super(key: key);

  @override
  State<Countries_state> createState() => _Countries_stateState();
}

class _Countries_stateState extends State<Countries_state> {
  TextEditingController searchController = TextEditingController();
  Stateservices stateservices = Stateservices();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(size.width * .02),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchController,
                decoration: InputDecoration(
                  hintText: "Search Countries",
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: size.width * .05),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50.00)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: stateservices.fatchcountriesRecord(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {

//Shmimmer effect,,,,,,,,
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: ListView.builder(
                          itemCount: 20,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 8),
                                child: Container(
                                  height: size.height * .04,
                                  width: size.width * .15,
                                  color: Colors.grey.shade100,
                                ),
                              ),
                              subtitle: Row(
                                children: [
                                  Container(
                                    height: size.height * .01,
                                    width: size.width * .10,
                                    color: Colors.grey.shade100,
                                  ),
                                ],
                              ),
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey.shade100,
                              ),
                            );
                          }),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          String name = (snapshot.data![index]['country']);
                          if (searchController.text.isEmpty) {
                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Country_Details(
                                  country:snapshot.data![index]['country'],
                                  updated: snapshot.data![index]['updated'],
                                  iso3: snapshot.data![index]['countryInfo']['iso3'],
                                  flag: snapshot.data![index]['countryInfo']['flag'],
                                  cases: snapshot.data![index]['cases'],
                                  todayCases: snapshot.data![index]['deaths'],
                                  todayDeaths: snapshot.data![index]['todayDeaths'],
                                  deaths: snapshot.data![index]['deaths'],
                                  recovered: snapshot.data![index]['recovered'],
                                  todayRecovered: snapshot.data![index]['todayRecovered'],
                                  active: snapshot.data![index]['active'],
                                  critical: snapshot.data![index]['critical'],
                                  casesPerOneMillion: snapshot.data![index]['casesPerOneMillion'],
                                  deathsPerOneMillion: snapshot.data![index]['deathsPerOneMillion'],
                                  testsPerOneMillion: snapshot.data![index]['testsPerOneMillion'],
                                  population: snapshot.data![index]['population'],
                                  tests: snapshot.data![index]['tests'],
                                  continent: snapshot.data![index]['continent'],
                                  oneCasePerPeople: snapshot.data![index]['oneCasePerPeople'],
                                  oneDeathPerPeople: snapshot.data![index]['oneDeathPerPeople'],
                                  oneTestPerPeople: snapshot.data![index]['oneTestPerPeople'],
                                  activePerOneMillion: snapshot.data![index]['activePerOneMillion'],
                                  recoveredPerOneMillion: snapshot.data![index]['recoveredPerOneMillion'],
                                  criticalPerOneMillion: snapshot.data![index]['criticalPerOneMillion'],
                                )));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Row(
                                  children: [
                                    ImageIcon(
                                      const AssetImage('asset/image/earth.png'),
                                      size: size.height * .02,
                                    ),
                                    SizedBox(width:size.width*.02,),
                                    Text(snapshot.data![index]['continent']),
                                  ],
                                ),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot
                                      .data![index]['countryInfo']['flag']),
                                ),
                              ),
                            );
                          } else if (name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Country_Details(
                                  country:snapshot.data![index]['country'],
                                  updated: snapshot.data![index]['updated'],
                                  iso3: snapshot.data![index]['countryInfo']['iso3'],
                                  flag: snapshot.data![index]['countryInfo']['flag'],
                                  cases: snapshot.data![index]['cases'],
                                  todayCases: snapshot.data![index]['deaths'],
                                  todayDeaths: snapshot.data![index]['todayDeaths'],
                                  deaths: snapshot.data![index]['deaths'],
                                  recovered: snapshot.data![index]['recovered'],
                                  todayRecovered: snapshot.data![index]['todayRecovered'],
                                  active: snapshot.data![index]['active'],
                                  critical: snapshot.data![index]['critical'],
                                  casesPerOneMillion: snapshot.data![index]['casesPerOneMillion'],
                                  deathsPerOneMillion: snapshot.data![index]['deathsPerOneMillion'],
                                  testsPerOneMillion: snapshot.data![index]['testsPerOneMillion'],
                                  population: snapshot.data![index]['population'],
                                  tests: snapshot.data![index]['tests'],
                                  continent: snapshot.data![index]['continent'],
                                  oneCasePerPeople: snapshot.data![index]['oneCasePerPeople'],
                                  oneDeathPerPeople: snapshot.data![index]['oneDeathPerPeople'],
                                  oneTestPerPeople: snapshot.data![index]['oneTestPerPeople'],
                                  activePerOneMillion: snapshot.data![index]['activePerOneMillion'],
                                  recoveredPerOneMillion: snapshot.data![index]['recoveredPerOneMillion'],
                                  criticalPerOneMillion: snapshot.data![index]['criticalPerOneMillion'],
                                )));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Row(
                                  children: [
                                    ImageIcon(
                                      const AssetImage(
                                          'asset/image/driver-license.png'),
                                      size: size.height * .02,
                                    ),
                                    SizedBox(
                                      width: size.width * .02,
                                    ),
                                    Text(snapshot.data![index]['countryInfo']
                                    ['_id']
                                        .toString()),
                                  ],
                                ),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(snapshot
                                      .data![index]['countryInfo']['flag']),
                                ),
                                trailing: const Icon(Icons.arrow_forward_ios),
                              ),
                            );
                          } else {
                            return Container();
                          }
                        });
                  }
                },
              ),
            ),
          ],
        )
      ),
    );
  }
}
