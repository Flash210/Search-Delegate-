/*
import 'package:flutter/material.dart';
import 'package:front/core/common_widget/custom_text.dart';
import 'package:front/core/constants/app_constants.dart';
import 'package:front/core/constants/colors.dart';
import 'package:front/core/services/injection_container.dart';
import 'package:front/features/fantasy/Model/player.dart';
import 'package:front/features/filter/View/widgets/widgets.dart';

import 'package:front/features/filter/utils/functions.dart';
import 'package:front/features/filter/ViewModel/filter_provider.dart';
import 'package:provider/provider.dart';

class FilteredPage extends StatefulWidget {
  final List<Player> listOfPlayers;
  const FilteredPage({
    super.key,
    required this.listOfPlayers,
  });

  @override
  FilteredPageState createState() => FilteredPageState();
}

class FilteredPageState extends State<FilteredPage> {
  late RangeValues _values;
  bool _isStrikerSelected = false;
  bool _isMidfielderSelected = false;
  bool _isDefenderSelected = false;
  bool _isGoalkeeperSelected = false;

  @override
  void initState() {
    super.initState();
    _values = const RangeValues(4, 12);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF2E1),
      appBar: AppBar(
        title: const MyCustomText(
          text: "Filter",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        actions: [buildResetText()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // ! filter by teams
            buildFilterByTeam(context),

            const SizedBox(height: 5),

            //! filter by price

            Container(
              decoration: const BoxDecoration(
                color: MyColors.kWhite,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MyCustomText(
                    text: "Price Range",
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(height: 5.0),
                  RangeSlider(
                    overlayColor: MaterialStateProperty.all(Colors.green),
                    activeColor: MyColors.kSecondaryColor,
                    values: _values,
                    min: 4,
                    max: 12,
                    divisions: 12 - 4,
                    onChanged: (RangeValues values) {
                      setState(() {
                        _values = values;
                        sl<FilterProvider>().filterPlayerByPriceF(
                            _values.start.toInt(), _values.end.toInt());
                      });
                    },
                    labels: RangeLabels(
                      _values.start.round().toString(),
                      _values.end.round().toString(),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 5),
            builCheckBox(),

            buildFilterButton(),
          ],
        ),
      ),
    );
  }

  Container builCheckBox() {
    return Container(
      decoration: const BoxDecoration(
        color: MyColors.kWhite,
      ),
      child: Column(
        children: [
          // ! **************

          Consumer<FilterProvider>(builder: (context, provider, _) {
            return checkboxListTitleWidget(
                title: "Striker",
                isPlayerSelected: provider.isStrikerSelected,
                onChanged: (value) {
                  sl<FilterProvider>().filterPlayersByPosition(
                      MyRes.kForward, provider.isStrikerSelected);
                  provider.updateIsStrikerSelected(value!);
                });
          }),
          // CheckboxListTile(
          //   activeColor: Colors.green,

          //   // checkColor: Colors.green,
          //   title: const Text(MyRes.kForward),
          //   value: _isStrikerSelected,
          //   onChanged: (value) {
          //     sl<FilterProvider>()
          //         .filterPlayersByPosition(MyRes.kForward, _isStrikerSelected);

          //     setState(() {
          //       _isStrikerSelected = value!;
          //     });
          //   },
          // ),
          // ! **************
          CheckboxListTile(
            activeColor: Colors.green,
            title: const Text(MyRes.kMidfilder),
            value: _isMidfielderSelected,
            onChanged: (value) {
              setState(() {
                //  sl<FilterProvider>().filterListByPositionF("Milieu");
                sl<FilterProvider>().filterPlayersByPosition(
                    MyRes.kMidfilder, _isMidfielderSelected);

                //filtredTeamByPosition("Milieu")

                _isMidfielderSelected = value!;
              });
            },
          ),
          CheckboxListTile(
            activeColor: Colors.green,
            title: const Text('Defenseur'),
            value: _isDefenderSelected,
            onChanged: (value) {
              // sl<FilterProvider>().filterListByPositionF("Defenseur");
              sl<FilterProvider>().filterPlayersByPosition(
                  MyRes.kDefender, _isDefenderSelected);

              setState(() {
                _isDefenderSelected = value!;
              });
            },
          ),
          CheckboxListTile(
            activeColor: Colors.green,
            title: const Text(MyRes.kGoalKepper),
            value: _isGoalkeeperSelected,
            onChanged: (value) {
              sl<FilterProvider>().filterPlayersByPosition(
                  MyRes.kGoalKepper, _isGoalkeeperSelected);
              //filtredTeamByPosition("Gardien")

              setState(() {
                _isGoalkeeperSelected = value!;
              });
            },
          ),
        ],
      ),
    );
  }
}

 */