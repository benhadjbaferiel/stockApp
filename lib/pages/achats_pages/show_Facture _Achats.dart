import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_dz_app/providers/fournisseure_provider.dart';
import 'package:stock_dz_app/widgets.dart/Custom_Date.dart';

class ShowFactureAchats extends StatefulWidget {
  const ShowFactureAchats({super.key});

  @override
  State<ShowFactureAchats> createState() => _ShowFactureAchatsState();
}

class _ShowFactureAchatsState extends State<ShowFactureAchats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("عرض فواتير المشتريات"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 176, 171, 86),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: CustomSearchDelegate(),
                );
              },
              icon: const Icon(Icons.search)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CustomDate(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "الى",
                  style: TextStyle(fontSize: 21),
                ),
                CustomDate(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "من",
                  style: TextStyle(fontSize: 21),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Clear the search query
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Close the search
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Get the FournisseureProvider
    final fournisseurProvider =
        Provider.of<FournisseureProvider>(context, listen: false);

    // Filter the fournisseurs based on the query
    final results = fournisseurProvider.getFournisseures.where((fournisseure) {
      return fournisseure.nameF.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final fournisseure = results[index];
        return ListTile(
          title: Text(fournisseure.nameF),
          onTap: () {
            // Handle the tap event, e.g., close the search and return the selected fournisseur
            close(context, fournisseure);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Get the FournisseureProvider
    final fournisseurProvider = Provider.of<FournisseureProvider>(context);

    // Filter the fournisseurs based on the query
    final suggestions =
        fournisseurProvider.getFournisseures.where((fournisseure) {
      return fournisseure.nameF.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final fournisseure = suggestions[index];
        return ListTile(
          title: Text(fournisseure.nameF),
          onTap: () {
            /// here i have to add logique to show his invoive             close(context, fournisseure);
          },
        );
      },
    );
  }
}
