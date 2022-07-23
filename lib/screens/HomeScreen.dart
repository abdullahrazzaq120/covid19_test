import 'package:covid19_test/providers/ConfirmedCases.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cases = Provider.of<ConfirmedCases>(context, listen: false)
        .confirmedCountriesList;

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (ctx, index) {
        return ListTile(
          title: Text(cases[index].Country!),
          trailing: Text(cases[index].TotalConfirmed.toString()),
          shape: const Border(bottom: BorderSide()),
        );
      },
      itemCount: cases.length,
    );
  }
}
