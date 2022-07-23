import 'dart:convert';

import 'package:covid19_test/models/ConfirmedCase.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConfirmedCases with ChangeNotifier {
  List<ConfirmedCase> _confirmedCountriesList = [];
  int _totalConfirmed = 0;

  List<ConfirmedCase> get confirmedCountriesList {
    return [..._confirmedCountriesList];
  }

  Future<void> fetchCasesList() async {
    print('Calling...');
    var response =
        await http.get(Uri.parse('https://api.covid19api.com/summary'));

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      if (responseData == null) {
        return;
      }
      print(responseData['Countries']);

      final List<ConfirmedCase> loadedCases = [];
      _totalConfirmed = responseData['Global']['TotalConfirmed'];

      // to get all around the world
      loadedCases.add(
        ConfirmedCase(
          ID: 'world',
          Country: 'World',
          TotalConfirmed: _totalConfirmed,
        ),
      );

      responseData['Countries'].forEach((countryData) {
        loadedCases.add(ConfirmedCase(
          ID: countryData['ID'],
          Country: countryData['Country'],
          TotalConfirmed: countryData['TotalConfirmed'],
          NewConfirmed: countryData['NewConfirmed'],
          NewDeaths: countryData['NewDeaths'],
          NewRecovered: countryData['NewRecovered'],
          TotalDeaths: countryData['TotalDeaths'],
          TotalRecovered: countryData['TotalRecovered'],
        ));
      });
      _confirmedCountriesList = loadedCases;

      notifyListeners();
    } else {
      print(response.reasonPhrase);
    }
  }
}
