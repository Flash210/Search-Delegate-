// import 'package:flutter/material.dart';
// import 'package:front/core/common_widget/my_costum_sizedbox.dart';
// import 'package:front/core/constants/colors.dart';
// import 'package:front/features/fantasy/Model/player.dart';
// import 'package:front/features/fantasy/View/f.dart';
// import 'package:front/features/fantasy/ViewModel/player_provider.dart';
// import 'package:front/features/fantasy/utils/player_widget.dart';
// import 'package:google_fonts/google_fonts.dart';

// import 'package:provider/provider.dart';

// class FantasyScreenContent extends StatefulWidget {
//   const FantasyScreenContent({super.key});

//   @override
//   State<FantasyScreenContent> createState() => _FantasyScreenContentState();
// }

// class _FantasyScreenContentState extends State<FantasyScreenContent> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<PlayerProvider>(
//       builder: (context, playerProvider, child) {
//         final slectedPlayerFromMap = playerProvider.selectedPlayersMap;

//         final List<int> forwards = [
//           slectedPlayerFromMap["st1"]?.id ?? 0,
//           slectedPlayerFromMap["st2"]?.id ?? 0,
//           slectedPlayerFromMap["bench1"]?.id ?? 0,
//           slectedPlayerFromMap["bench2"]?.id ?? 0,
//         ];

//         final List<int> midfielders = [
//           slectedPlayerFromMap["mid1"]?.id ?? 0,
//           slectedPlayerFromMap["mid2"]?.id ?? 0,
//           slectedPlayerFromMap["mid3"]?.id ?? 0,
//           slectedPlayerFromMap["mid4"]?.id ?? 0,
//           slectedPlayerFromMap["bench3"]?.id ?? 0,
//           slectedPlayerFromMap["bench4"]?.id ?? 0,
//         ];

//         final List<int> defenders = [
//           slectedPlayerFromMap["def1"]?.id ?? 0,
//           slectedPlayerFromMap["def2"]?.id ?? 0,
//           slectedPlayerFromMap["def3"]?.id ?? 0,
//           slectedPlayerFromMap["def4"]?.id ?? 0,
//         ];

//         final List<int> goalkeepers = [
//           slectedPlayerFromMap["Goal"]?.id ?? 0,
//         ];
//         final playerPositions = {
//           "Goal": 1,
//           "def": 4,
//           "mid": 4,
//           "st": 2,
//           "bench": 4,
//         };
//         final moneyRemaining = 50;
//         final int playersSelected = 15;

//         return Column(children: [
//           const MySizedBox(height: 15),

//           // // ! GoalKeeper
//           buildPlayer(
//               title: slectedPlayerFromMap["Goal"] != null
//                   ? slectedPlayerFromMap["Goal"]!.name ?? "Goal"
//                   : "Goal",
//               position: "Goal",
//               context: context),
//           const MySizedBox(
//             height: 15,
//           ),

//           // // ! Defenders Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               buildPlayer(
//                   title: slectedPlayerFromMap["def1"] != null
//                       ? slectedPlayerFromMap["def1"]!.name ?? "def1"
//                       : "def1",
//                   position: "def1",
//                   context: context),
//               buildPlayer(
//                   title: slectedPlayerFromMap["def2"] != null
//                       ? slectedPlayerFromMap["def2"]!.name ?? "def2"
//                       : "def2",
//                   position: "def2",
//                   context: context),
//               buildPlayer(
//                   title: slectedPlayerFromMap["def3"] != null
//                       ? playerProvider.selectedPlayersMap["def3"]!.name ??
//                           "def3"
//                       : "def3",
//                   position: "def3",
//                   context: context),
//               buildPlayer(
//                   title: slectedPlayerFromMap["def4"] != null
//                       ? slectedPlayerFromMap["def4"]!.name ?? "def4"
//                       : "def4",
//                   position: "def4",
//                   context: context),
//             ],
//           ),

//           // buildPosition("def", slectedPlayerFromMap, playerPositions),
//           // ! midfilders Row
//           const MySizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               buildPlayer(
//                   title: slectedPlayerFromMap["mid1"] != null
//                       ? slectedPlayerFromMap["mid1"]!.name ?? "mid1"
//                       : "mid1",
//                   position: "mid1",
//                   context: context),
//               buildPlayer(
//                   title: slectedPlayerFromMap["mid2"] != null
//                       ? slectedPlayerFromMap["mid2"]!.name ?? "mid2"
//                       : "mid2",
//                   position: "mid2",
//                   context: context),
//               buildPlayer(
//                   title: slectedPlayerFromMap["mid3"] != null
//                       ? slectedPlayerFromMap["mid3"]!.name ?? "mid3"
//                       : "mid3",
//                   position: "mid3",
//                   context: context),
//               buildPlayer(
//                   title: slectedPlayerFromMap["mid4"] != null
//                       ? slectedPlayerFromMap["mid4"]!.name ?? "mid4"
//                       : "mid4",
//                   position: "mid4",
//                   context: context),
//             ],
//           ),

//           // ! Strikers Row
//           const MySizedBox(height: 20),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               buildPlayer(
//                   title: slectedPlayerFromMap["st1"] != null
//                       ? playerProvider.selectedPlayersMap["st1"]!.name ?? "st1"
//                       : "st1",
//                   position: "st1",
//                   context: context),
//               buildPlayer(
//                   title: slectedPlayerFromMap["st2"] != null
//                       ? slectedPlayerFromMap["st2"]!.name ?? "st2"
//                       : "st2",
//                   position: "st2",
//                   context: context),
//             ],
//           ),

//           const MySizedBox(height: 10),

//           Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               color: MyColors.greyF,
//             ),
//             width: 300,
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text('Benched Players',
//                     style: GoogleFonts.rubik(
//                       textStyle: const TextStyle(
//                           color: Colors.black,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w600),
//                     )),
//                 const SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     buildPlayerBench(
//                         title: slectedPlayerFromMap["bench1"] != null
//                             ? slectedPlayerFromMap["bench1"]!.name ?? "bench1"
//                             : "bench1",
//                         position:
//                             "bench1", // Assuming "mid1" is the position for "bench1"
//                         context: context),
//                     const MySizedBox(
//                       width: 5,
//                     ),
//                     buildPlayerBench(
//                         title: slectedPlayerFromMap["bench2"] != null
//                             ? slectedPlayerFromMap["bench2"]!.name ?? "bench2"
//                             : "bench2",
//                         position:
//                             "bench2", // Assuming "mid2" is the position for "bench2"
//                         context: context),
//                     const MySizedBox(
//                       width: 5,
//                     ),
//                     buildPlayerBench(
//                         title: slectedPlayerFromMap["bench3"] != null
//                             ? slectedPlayerFromMap["bench3"]!.name ?? "bench3"
//                             : "bench3",
//                         position:
//                             "bench3", // Assuming "mid3" is the position for "bench3"
//                         context: context),
//                     const MySizedBox(
//                       width: 5,
//                     ),
//                     buildPlayerBench(
//                         title: slectedPlayerFromMap["bench4"] != null
//                             ? slectedPlayerFromMap["bench4"]!.name ?? "bench4"
//                             : "bench4",
//                         position:
//                             "bench4", // Assuming "mid4" is the position for "bench4"
//                         context: context),
//                   ],
//                 ),
//               ],
//             ),
//           ),

//           const MySizedBox(height: 10),

//           // ElevatedButton(
//           //     onPressed: () {
//           //       createTeam(
//           //           context,
//           //           TeamEdit(
//           //               defenders: defenders,
//           //               forwards: forwards,
//           //               goalkeepers: goalkeepers,
//           //               midfielders: midfielders,
//           //               moneyRemaining: moneyRemaining,
//           //               playersSelected: playersSelected));
//           //     },
//           //     child: const Text(" Create Team"))
//         ]);
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
