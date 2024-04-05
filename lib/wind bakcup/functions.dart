/*
import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/fantasy/Model/team.dart';
import 'package:front/features/fantasy/ViewModel/player_provider.dart';
import 'package:provider/provider.dart';

void showListOfPlayers(
    {required BuildContext context, required String position}) async {
  final List<Player> listOfPlayersFromApi =
      await sl<PlayerProvider>().fetchPlayerss();
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

  final List<Team> teams = await sl<PlayerProvider>().fetchTeams();
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
                    child: TextField(
                      onChanged: (value) {
                        // sl<PlayerProvider>().updateFilteredPlayers(value.toLowerCase());

                        setState(() {
                          filteredPlayers = listOfPlayersFromApi
                              .where((player) => player.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                      decoration: const InputDecoration(
                        labelText: 'Search players',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Consumer<PlayerProvider>(
                      builder: (context, provider, _) {
                        final filteredPlayers2 = provider.filteredPlayers;
                        //print("List of filtred2 : ${filteredPlayers2.length}");
                        final teams2 = provider.teams;
                        // print("List of teams2 : ${teams2.length}");
                        return ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          controller: scrollController,
                          itemCount: filteredPlayers.length,
                          itemBuilder: (BuildContext context, int index) {
                            final player = filteredPlayers[index];
                            final team = teams2.firstWhere(
                              (team) => team.id == player.teamId,
                              orElse: () => Team(
                                id: 0,
                                name: 'Unknown',
                                logo: '',
                              ),
                            );

                            return ListTile(
                              onTap: () {
                                // provider.addSelectedPlayerToMap(
                                //     position: position, player: player);
                                // filteredPlayers.removeAt(index);

                                Navigator.pop(context);
                              },
                              leading: Image.network(team.logo!),

                              // ! first solution

                              // Image.network(
                              //     'https://www.sport365.fr/static/sport/bddimages/Teams/3/' +
                              //         team.imagePlayer!),
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
                          },
                        );
                      },
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

 */