/*
import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:provider/provider.dart';

void showListOfPlayers22(
    {required BuildContext context, required String position}) async {
  final List<Player> listOfPlayersFromApi =
      await sl<PlayerProvider>().fetchPlayerss();
  final List<Team> teams = await sl<PlayerProvider>().fetchTeams();

  List<int> selc = context
      .read<PlayerProvider>()
      .selectedPlayersMap
      .values
      .map((e) => e.id)
      .toList();
  List<Player> filteredPlayers = List.from(listOfPlayersFromApi)
      .cast<Player>()
      .where(
        (element) => !selc.contains(element.id),
      )
      .toList(); // Copy all players initially

  String searchCriteria = 'Search by Player Name'; // Default search criteria

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return DraggableScrollableSheet(
            initialChildSize: 0.4,
            maxChildSize: 1.0,
            minChildSize: 0.2,
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            onChanged: (value) {
                              setState(() {
                                filteredPlayers = _filterPlayers(
                                    value,
                                    searchCriteria,
                                    listOfPlayersFromApi,
                                    teams);
                              });
                            },
                            decoration: InputDecoration(
                              labelText: searchCriteria,
                              prefixIcon: const Icon(Icons.search),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.filter_list),
                          onPressed: () async {
                            String? selectedCriteria =
                                await _showSearchCriteriaDialog(context);
                            if (selectedCriteria != null) {
                              setState(() {
                                searchCriteria = selectedCriteria;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListWheelScrollView(
                      controller: scrollController,
                      itemExtent: 100, // Adjust the height of each item
                      children: List.generate(filteredPlayers.length, (index) {
                        final player = filteredPlayers[index];
                        final team = teams.firstWhere(
                          (team) => team.id == player.teamId,
                          orElse: () => Team(
                            id: 0,
                            name: 'Unknown',
                            logo: '',
                          ),
                        );
                        return ListTile(
                          onTap: () {
                            // context.read<PlayerProvider>().addSelectedPlayerToMap(position: position, player: player);
                            Navigator.pop(context);
                          },
                          leading: Image.network(team.logo!),
                          title: Column(
                            children: [
                              Text(player.name),
                              const SizedBox(width: 10),
                              Text(
                                '£${player.price}m',
                                style: const TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          trailing: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 66,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: player.position == 'Milieu'
                                  ? Colors.blue
                                  : player.position == 'Defenseur'
                                      ? Colors.green
                                      : player.position == 'Attaquant'
                                          ? const Color.fromARGB(
                                              255, 138, 126, 21)
                                          : Colors.red,
                            ),
                            child: MyCustomText(
                              text: player.position,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              );
            },
          );
        },
      );
    },
  );
}

Future<String?> _showSearchCriteriaDialog(BuildContext context) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Select Search Criteria'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('Player Name'),
              onTap: () {
                Navigator.pop(context, 'Search by Player Name');
              },
            ),
            ListTile(
              title: const Text('Player Position'),
              onTap: () {
                Navigator.pop(context, 'Search by Player Position');
              },
            ),
            ListTile(
              title: const Text('Player Price'),
              onTap: () {
                Navigator.pop(context, 'Search by Player Price');
              },
            ),
            ListTile(
              title: const Text('Team Name'),
              onTap: () {
                Navigator.pop(context, 'Search by Team Name');
              },
            ),
          ],
        ),
      );
    },
  );
}

List<Player> _filterPlayers(String value, String searchCriteria,
    List<Player> listOfPlayers, List<Team> teams) {
  switch (searchCriteria) {
    case 'Search by Player Name':
      return listOfPlayers
          .where((player) =>
              player.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    case 'Search by Player Position':
      return listOfPlayers
          .where((player) =>
              player.position.toLowerCase().contains(value.toLowerCase()))
          .toList();
    case 'Search by Player Price':
      return listOfPlayers
          .where((player) => player.price
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();

    case 'Search by Team Name':
      return listOfPlayers
          .where((player) => teams.any((team) =>
              team.id == player.teamId &&
              team.name!.toLowerCase().contains(value.toLowerCase())))
          .toList();
    default:
      return listOfPlayers;
  }
}

 */