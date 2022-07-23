import 'package:covid19_test/screens/DetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/ConfirmedCase.dart';
import '../providers/ConfirmedCases.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final cases = Provider.of<ConfirmedCases>(context, listen: false)
        .confirmedCountriesList;

    return Container(
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Autocomplete<ConfirmedCase>(
          optionsBuilder: (TextEditingValue textEditingValue) {
            return cases
                .where((ConfirmedCase country) => country.Country!
                    .toLowerCase()
                    .startsWith(textEditingValue.text.toLowerCase()))
                .toList();
          },
          fieldViewBuilder: (
            BuildContext context,
            TextEditingController fieldTextEditingController,
            FocusNode fieldFocusNode,
            VoidCallback onFieldSubmitted,
          ) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              child: TextField(
                controller: fieldTextEditingController,
                focusNode: fieldFocusNode,
              ),
            );
          },
          optionsViewBuilder: (
            BuildContext context,
            AutocompleteOnSelected<ConfirmedCase> onSelected,
            Iterable<ConfirmedCase> options,
          ) {
            return Align(
              alignment: Alignment.center,
              child: Material(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final ConfirmedCase option = options.elementAt(index);

                    return GestureDetector(
                      onTap: () {
                        onSelected(option);
                        FocusScope.of(context).requestFocus(FocusNode());
                      },
                      child: ListTile(
                        title: Text(option.Country!),
                        trailing: Text(option.TotalConfirmed.toString()),
                        shape: const Border(bottom: BorderSide()),
                      ),
                    );
                  },
                ),
              ),
            );
          },
          displayStringForOption: (ConfirmedCase option) => option.Country!,
          onSelected: (ConfirmedCase selection) {
            if (selection.ID == 'world') {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('Please Select a valid country')));
              return;
            }

            print('Selected: ${selection.Country}');
            Navigator.of(context).pushNamed(
              DetailScreen.routeName,
              arguments: selection,
            );
          },
        ));
  }
}
