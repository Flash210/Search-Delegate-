/*
// class FantasyScreenContent extends StatefulWidget {
//   const FantasyScreenContent({Key? key}) : super(key: key);

//   @override
//   State<FantasyScreenContent> createState() => _FantasyScreenContentState();
// }

// class _FantasyScreenContentState extends State<FantasyScreenContent> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PlayerProvider>(
//       builder: (context, playerProvider, child) {
//         final selectedPlayersMap = playerProvider.selectedPlayersMap;

//         final playerPositions = {
//           "Goal": 1,
//           "def": 4,
//           "mid": 4,
//           "st": 2,
//           "bench": 4,
//         };

//         final moneyRemaining = 50;
//         final playersSelected = 15;

//         return Column(
//           children: [
//             const MySizedBox(height: 20),
//             // ! GoalKeeper
//             buildPosition("Goal", selectedPlayersMap, playerPositions),
//             const MySizedBox(height: 50),
//             // ! Defenders Row
//             buildPosition("def", selectedPlayersMap, playerPositions),
//             const MySizedBox(height: ScreenUtils.kSizedBoxHeight),
//             // ! Midfielders Row

//             buildPosition("mid", selectedPlayersMap, playerPositions),
//             const MySizedBox(height: 30),
//             // ! forwards Row

//             buildPosition("st", selectedPlayersMap, playerPositions),
//             const MySizedBox(height: ScreenUtils.kSizedBoxHeight),
//             // ! bench Row

//             buildPosition("bench", selectedPlayersMap, playerPositions),
//             const MySizedBox(height: ScreenUtils.kSizedBoxHeight),
//             ElevatedButton(
//               onPressed: () {
//                 TeamEdit team = TeamEdit(
//                   // ! defenders list
//                   defenders: List.generate(
//                       playerPositions["def"]!,
//                       (index) =>
//                           selectedPlayersMap["def${index + 1}"]?.id ?? 0),

//                   // ! forwars list
//                   forwards: List.generate(playerPositions["st"]!,
//                       (index) => selectedPlayersMap["st${index + 1}"]?.id ?? 0),

//                   //! GoalKeeper list
//                   goalkeepers: [
//                     selectedPlayersMap["Goal"]?.id ?? 0,
//                   ],
//                   //! midfielders list
//                   midfielders: List.generate(
//                       playerPositions["mid"]!,
//                       (index) =>
//                           selectedPlayersMap["mid${index + 1}"]?.id ?? 0),
//                   moneyRemaining: moneyRemaining,
//                   playersSelected: playersSelected,
//                 );

//                 print("Defenders " + team.defenders.toString());
//                 print("Forwards " + team.forwards.toString());
//                 print("Midfielders " + team.midfielders.toString());
//                 print("Goalkeepers " + team.goalkeepers.toString());
//                 print("Money Remaining " + team.moneyRemaining.toString());
//                 print("Players Selected " + team.playersSelected.toString());

//                 createTeam(context, team);
//               },
//               child: const Text("Create Team"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   Widget buildPosition(
//       String positionPrefix,
//       Map<String, Player> selectedPlayersMap,
//       Map<String, int> playerPositions) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: List.generate(
//         playerPositions[positionPrefix]!,
//         (index) {
//           // ! positionPrefix = def or st or bench or mid
//           //! For example, if positionPrefix is "def" and index is 0, then position = "def" + (0 + 1).toString()
//           //results in position = "def1"
//           final position = positionPrefix + (index + 1).toString();

//           final player = selectedPlayersMap[position];
//           final playerName = player?.name ?? position;
//           return buildPlayer(
//             title: playerName,
//             position: position,
//             context: context,
//           );
//         },
//       ),
//     );
//   }
// }

 */