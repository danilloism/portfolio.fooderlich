import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GroceryTile extends StatelessWidget {
  GroceryTile({Key? key, required this.item, this.onComplete})
      : textDecoration =
            item.isComplete ? TextDecoration.lineThrough : TextDecoration.none,
        super(key: key);

  final GroceryItem item;
  final Function(bool?)? onComplete;
  final TextDecoration textDecoration;

  @override
  Widget build(BuildContext context) {
    //TODO: change this widget
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 5,
                color: item.color,
              ),
              Gap.w8,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    item.name,
                    style: GoogleFonts.lato(
                        decoration: textDecoration,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  Gap.h8,
                  _buildDate(),
                  Gap.h8,
                  _buildImportance(),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Text(
                item.quantity.toString(),
                style:
                    GoogleFonts.lato(decoration: textDecoration, fontSize: 21),
              ),
              _buildCheckBox(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImportance() {
    switch (item.importance) {
      case Importance.low:
        return Text(
          'Low',
          style: GoogleFonts.lato(decoration: textDecoration),
        );
      case Importance.medium:
        return Text(
          'Medium',
          style: GoogleFonts.lato(
            decoration: textDecoration,
            fontWeight: FontWeight.w800,
          ),
        );
      case Importance.high:
        return Text(
          'High',
          style: GoogleFonts.lato(
            color: Colors.red,
            decoration: textDecoration,
            fontWeight: FontWeight.w800,
          ),
        );
      default:
        throw Exception('This importance doesn\'t exist.');
    }
  }

  Widget _buildDate() {
    final _dateFormater = DateFormat('MMMM dd h:mm a');
    final _dateString = _dateFormater.format(item.date);
    return Text(
      _dateString,
      style: TextStyle(decoration: textDecoration),
    );
  }

  Widget _buildCheckBox() {
    return Checkbox(
      value: item.isComplete,
      onChanged: onComplete,
    );
  }
}
