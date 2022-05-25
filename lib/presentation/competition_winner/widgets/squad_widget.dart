import 'package:flutter/material.dart';
import 'package:football_matches/data/model/squad.dart';
import 'package:football_matches/presentation/competition_winner/widgets/header_widget.dart';

class SquadWidget extends StatelessWidget {
  final List<Squad>? squad;
  const SquadWidget({Key? key,required this.squad}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(squad!=null) {
     return HeaderWidget(
        title:"Squad members",
        child:
        SizedBox(
          height: 70,
          child: ListView.builder(
              itemCount: squad!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final item = squad![index];
                return Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).cardColor
                  ),
                    child: Padding(padding:const EdgeInsets.all(10),child: Center(child: Column(
                      children: [
                        Text(item.position!),
                        Spacer(),
                        Text("${item.shirtNumber?? ""} ${item.name!}"),
                      ],
                    ))));
              }),
        )
    );
    } else {
      return Text("No squad have been provided");
    }
  }
}
