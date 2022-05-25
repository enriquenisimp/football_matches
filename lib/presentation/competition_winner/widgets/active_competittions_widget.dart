import 'package:flutter/material.dart';
import 'package:football_matches/data/model/team_details.dart';
import 'package:football_matches/presentation/competition_winner/widgets/header_widget.dart';

class ActiveCompetitionsWidget extends StatelessWidget {
  final List<ActiveCompetitions> competitions;
  const ActiveCompetitionsWidget({Key? key,required  this.competitions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeaderWidget(title: "Active Competitions",
        child:
        SizedBox(
        height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
              itemCount: competitions.length,
              itemBuilder: (context, index){
            return Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Theme.of(context).cardColor
              ),
              child: Padding(padding:const EdgeInsets.all(10),child: Text(competitions[index].name!)),
            );
          }),
        ));
  }
}
