import 'package:covid19_test/models/ConfirmedCase.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  static const String routeName = '/detail-screen';
  List<Detail> details = [];

  @override
  Widget build(BuildContext context) {
    final country = ModalRoute.of(context)!.settings.arguments as ConfirmedCase;

    details.add(
      Detail('TOTAL CASES', country.TotalConfirmed.toString()),
    );
    details.add(
      Detail('TOTAL Deaths', country.TotalDeaths.toString()),
    );
    details.add(
      Detail('NEW CASES', country.NewConfirmed.toString()),
    );
    details.add(
      Detail('NEW DEATHS', country.NewDeaths.toString()),
    );
    details.add(
      Detail('NEW RECOVERED', country.NewRecovered.toString()),
    );
    details.add(
      Detail('TOTAL RECOVERED', country.TotalRecovered.toString()),
    );

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: double.infinity,
            alignment: Alignment.center,
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  country.Country!,
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'CORONA STATS OVERVIEW',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 4 / 2,
                ),
                itemBuilder: (ctx, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        details[index].label,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        details[index].value,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ],
                  );
                },
                padding: const EdgeInsets.all(10),
                itemCount: 6,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Detail {
  String label;
  String value;

  Detail(this.label, this.value);
}
