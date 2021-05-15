import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';
import '../../../interfaces/serialization/excercise_interface.dart';
import '../../../providers/workout_provider.dart';

class ExcerciseCard extends StatefulWidget {
  final int index;
  // ignore: overridden_fields
  final Key key;
  final List<Excercise> listItems;

  const ExcerciseCard(this.listItems, this.index, this.key);

  @override
  _ListViewCard createState() => _ListViewCard();
}

class _ListViewCard extends State<ExcerciseCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(4),
      color: Colors.white,
      child: InkWell(
        splashColor: Colors.blue,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${widget.listItems[widget.index].name}',
                      style: AppTextStyles.regularCopyBold
                          .copyWith(color: Colors.black),
                      textAlign: TextAlign.left,
                      maxLines: 5,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${widget.listItems[widget.index].durationInS} s',
                      style: AppTextStyles.regularCopy
                          .copyWith(color: Colors.black),
                      textAlign: TextAlign.left,
                      maxLines: 5,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: IconButton(
                icon: Icon(
                  Icons.remove_circle_outline,
                  color: AppColors.red,
                  size: 24.0,
                ),
                onPressed: () =>
                    Provider.of<WorkoutProvider>(context, listen: false)
                        .removeExcercise(widget.listItems[widget.index]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Icon(
                Icons.reorder,
                color: Colors.black,
                size: 24.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
