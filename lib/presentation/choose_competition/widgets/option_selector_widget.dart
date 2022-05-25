import 'package:flutter/material.dart';
import 'package:football_matches/domain/entities/item_dropdown.dart';

class OptionSelector extends StatelessWidget {
  final String title;
  final Function(String? value) onChanged;
  final Function() onPressed;
  final String buttonTitle;
  final String valueSelected;
  final List<ItemDropdown> items;
  const OptionSelector(
      {Key? key,
      required this.title,
      required this.onChanged,
      required this.onPressed,
      required this.buttonTitle,
      required this.items,
      required this.valueSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text(title, style: Theme.of(context).textTheme.headline5),
        Container(height: 20,),
        DropdownButton(
          value: valueSelected,
            alignment: Alignment.center,
            items: List.generate(
                items.length,
                (index) => DropdownMenuItem<String>(
                      child: Text(
                        items[index].value,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      value: items[index].id.toString(),
                    )),
            onChanged: onChanged),
        Container(height: 20,),
        ElevatedButton(
            onPressed: onPressed,
            child: Text(
              buttonTitle,
              style: Theme.of(context).textTheme.headline6,
            ))
      ],
    );
  }
}
