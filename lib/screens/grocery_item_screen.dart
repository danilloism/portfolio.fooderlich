import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../components/grocery_tile.dart';
import '../models/models.dart';
import '../utils.dart';

class GroceryItemScreen extends StatefulWidget {
  const GroceryItemScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
    this.index = -1,
  })  : isUpdating = (originalItem != null),
        super(key: key);

  const GroceryItemScreen.create({
    Key? key,
    required this.onCreate,
    //TODO: Refactor index definition on create constructor
  })  : isUpdating = false,
        originalItem = null,
        onUpdate = null,
        index = -1,
        super(key: key);

  const GroceryItemScreen.update({
    Key? key,
    required this.onUpdate,
    required this.originalItem,
    required this.index,
  })  : isUpdating = true,
        onCreate = null,
        super(key: key);

  final Function(GroceryItem)? onCreate;
  final Function(GroceryItem, int)? onUpdate;
  final GroceryItem? originalItem;
  final int index;
  final bool isUpdating;

  static MaterialPage pageOnCreate({
    required Function(GroceryItem) onCreate,
  }) {
    return MaterialPage(
      name: FooderlichPages.groceryItemDetails,
      key: ValueKey(FooderlichPages.groceryItemDetails),
      child: GroceryItemScreen.create(onCreate: onCreate),
    );
  }

  static MaterialPage pageOnUpdate({
    required Function(GroceryItem, int) onUpdate,
    required int index,
    required GroceryItem item,
  }) {
    return MaterialPage(
      name: FooderlichPages.groceryItemDetails,
      key: ValueKey(FooderlichPages.groceryItemDetails),
      child: GroceryItemScreen.update(
        onUpdate: onUpdate,
        originalItem: item,
        index: index,
      ),
    );
  }

  @override
  _GroceryItemScreenState createState() => _GroceryItemScreenState();
}

class _GroceryItemScreenState extends State<GroceryItemScreen> {
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.lightGreen;
  int _currentSliderValue = 0;
  bool _isComplete = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: _currentColor),
        backgroundColor: _currentColor.withOpacity(0.5),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            color: _currentColor,
            onPressed: () {
              final groceryItem = GroceryItem(
                id: widget.isUpdating
                    ? widget.originalItem!.id
                    : const Uuid().v1(),
                name: _nameController.text,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                isComplete: _isComplete,
                date: DateTime(
                  _dueDate.year,
                  _dueDate.month,
                  _dueDate.day,
                  _timeOfDay.hour,
                  _timeOfDay.minute,
                ),
              );

              if (widget.isUpdating) {
                widget.onUpdate!(
                  groceryItem,
                  widget.index,
                );
              } else {
                widget.onCreate!(groceryItem);
              }
            },
          )
        ],
        elevation: 0.0,
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            buildNameField(),
            buildImportanceField(),
            buildDateField(context),
            buildTimeField(context),
            Gap.h16,
            buildColorPicker(context),
            Gap.h16,
            buildQuantityField(),
            Gap.h16,
            GroceryTile(
              item: GroceryItem(
                id: 'previewMode',
                name: _name,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                isComplete: _isComplete,
                date: DateTime(
                  _dueDate.year,
                  _dueDate.month,
                  _dueDate.day,
                  _timeOfDay.hour,
                  _timeOfDay.minute,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item Name',
          style: GoogleFonts.lato(
            fontSize: 28.0,
          ),
        ),
        TextField(
          controller: _nameController,
          cursorColor: _currentColor,
          decoration: InputDecoration(
            hintText: 'E.g. Apples, Banana, 1 Bag of salt',
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: _currentColor,
              ),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(
                color: _currentColor,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImportanceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Importance',
          style: GoogleFonts.lato(fontSize: 28.0),
        ),
        Gap.h16,
        Wrap(
          spacing: 10.0,
          children: [
            ChoiceChip(
              selectedColor: _currentColor,
              selected: _importance == Importance.low,
              label: const Text(
                'low',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                setState(() => _importance = Importance.low);
              },
            ),
            ChoiceChip(
              selectedColor: _currentColor,
              selected: _importance == Importance.medium,
              label: const Text(
                'medium',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                setState(() => _importance = Importance.medium);
              },
            ),
            ChoiceChip(
              selectedColor: _currentColor,
              selected: _importance == Importance.high,
              label: const Text(
                'high',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) {
                setState(() => _importance = Importance.high);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: Text(
                'Select',
                style: TextStyle(color: _currentColor),
              ),
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );

                setState(() {
                  if (selectedDate != null) {
                    _dueDate = selectedDate;
                  }
                });
              },
            ),
          ],
        ),
        Text(DateFormat('yyyy-MM-dd').format(_dueDate)),
        Gap.h16,
      ],
    );
  }

  Widget buildTimeField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time of Day',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            TextButton(
              child: Text(
                'Select',
                style: TextStyle(color: _currentColor),
              ),
              onPressed: () async {
                final timeOfDay = await showTimePicker(
                  initialTime: TimeOfDay.now(),
                  context: context,
                );

                setState(() {
                  if (timeOfDay != null) {
                    _timeOfDay = timeOfDay;
                  }
                });
              },
            ),
          ],
        ),
        Text(_timeOfDay.format(context)),
        Gap.h16,
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 10,
              color: _currentColor,
            ),
            Gap.w8,
            Text(
              'Color',
              style: GoogleFonts.lato(fontSize: 28),
            ),
          ],
        ),
        TextButton(
          child: Text(
            'Select',
            style: TextStyle(color: _currentColor),
          ),
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: BlockPicker(
                    pickerColor: Colors.white,
                    onColorChanged: (color) {
                      setState(() => _currentColor = color);
                    },
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Save'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
          },
        ),
      ],
    );
  }

  Widget buildQuantityField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Gap.h16,
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              'Quantity',
              style: GoogleFonts.lato(fontSize: 28.0),
            ),
            Gap.w16,
            Text(
              _currentSliderValue.toInt().toString(),
              style: GoogleFonts.lato(fontSize: 18.0),
            ),
          ],
        ),
        Slider(
          inactiveColor: _currentColor.withOpacity(0.5),
          activeColor: _currentColor,
          value: _currentSliderValue.toDouble(),
          min: 0.0,
          max: 100.0,
          divisions: 100,
          label: _currentSliderValue.toInt().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value.toInt();
            });
          },
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _name = originalItem.name;
      _nameController.text = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      final date = originalItem.date;
      _timeOfDay = TimeOfDay(hour: date.hour, minute: date.minute);
      _dueDate = date;
      _isComplete = originalItem.isComplete;
    }

    _nameController.addListener(() {
      setState(() {
        _name = _nameController.text;
      });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
