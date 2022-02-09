import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:fooderlich/components/components.dart';
import 'package:fooderlich/models/models.dart';
import 'package:fooderlich/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GroceryItemPage extends StatefulWidget {
  const GroceryItemPage({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : isUpdating = (originalItem != null),
        super(key: key);
  const GroceryItemPage.create({
    Key? key,
    required this.onCreate,
  })  : isUpdating = false,
        originalItem = null,
        onUpdate = null,
        super(key: key);

  const GroceryItemPage.update(
      {Key? key, required this.onUpdate, required this.originalItem})
      : isUpdating = true,
        onCreate = null,
        super(key: key);

  final Function(GroceryItem)? onCreate;
  final Function(GroceryItem)? onUpdate;
  final GroceryItem? originalItem;
  final bool isUpdating;

  @override
  _GroceryItemPageState createState() => _GroceryItemPageState();
}

class _GroceryItemPageState extends State<GroceryItemPage> {
  final _nameController = TextEditingController();
  String _name = '';
  Importance _importance = Importance.low;
  DateTime _dueDate = DateTime.now();
  TimeOfDay _timeOfDay = TimeOfDay.now();
  Color _currentColor = Colors.lightGreen;
  int _currentSliderValue = 0;

  @override
  void initState() {
    if (widget.isUpdating) {
      final originalItem = widget.originalItem!;
      _nameController.text = originalItem.name;
      _name = originalItem.name;
      _currentSliderValue = originalItem.quantity;
      _importance = originalItem.importance;
      _currentColor = originalItem.color;
      _dueDate = originalItem.date;
      _timeOfDay = TimeOfDay(hour: _dueDate.hour, minute: _dueDate.minute);
    }

    _nameController.addListener(
      () => setState(
        () => _nameController.text,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {}, //TODO: add callback handler
            icon: const Icon(Icons.check),
          ),
        ],
        title: Text(
          'Grocery Item',
          style: GoogleFonts.lato(fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: PaddingEdgeInsets.all16,
        child: ListView(
          children: [
            _buildNameField(),
            _buildImportanceField(),
            _buildDateField(context),
            _buildTimeField(context),
            _buildColorPicker(context),
            _buildQuantityField(),
            GroceryTile(
              item: GroceryItem(
                id: 'previewMode',
                name: _name,
                importance: _importance,
                color: _currentColor,
                quantity: _currentSliderValue,
                date: DateTime(
                  _dueDate.year,
                  _dueDate.month,
                  _dueDate.day,
                  _timeOfDay.hour,
                  _timeOfDay.minute,
                ),
                isComplete: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  final _labelFontStyle = GoogleFonts.lato(fontSize: 28);

  Widget _buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Item Name',
          style: _labelFontStyle,
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
              borderSide: BorderSide(color: _currentColor),
            ),
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: _currentColor),
            ),
          ),
        ),
        Gap.h16,
      ],
    );
  }

  Widget _buildImportanceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Importance',
          style: _labelFontStyle,
        ),
        Gap.h16,
        Wrap(
          spacing: 10,
          children: [
            ChoiceChip(
              selectedColor: Colors.lightGreen.shade400,
              selected: _importance == Importance.low,
              label: const Text(
                'low',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) => setState(
                () => _importance = Importance.low,
              ),
            ),
            ChoiceChip(
              selectedColor: Colors.lightGreen.shade400,
              selected: _importance == Importance.medium,
              label: const Text(
                'medium',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) => setState(
                () => _importance = Importance.medium,
              ),
            ),
            ChoiceChip(
              selectedColor: Colors.lightGreen.shade400,
              selected: _importance == Importance.high,
              label: const Text(
                'high',
                style: TextStyle(color: Colors.white),
              ),
              onSelected: (selected) => setState(
                () => _importance = Importance.high,
              ),
            ),
          ],
        ),
        Gap.h16,
      ],
    );
  }

  Widget _buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Date',
              style: _labelFontStyle,
            ),
            TextButton(
              onPressed: () async {
                final currentDate = DateTime.now();
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: currentDate,
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(
                  () {
                    if (selectedDate != null) {
                      _dueDate = selectedDate;
                    }
                  },
                );
              },
              child: const Text('Select'),
            ),
          ],
        ),
        Gap.h16,
        Text(
          DateFormat('yyyy-MM-dd').format(_dueDate),
        ),
        Gap.h16,
      ],
    );
  }

  Widget _buildTimeField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time of Day',
              style: _labelFontStyle,
            ),
            TextButton(
              onPressed: () async {
                final timeOfDay = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                setState(() {
                  if (timeOfDay != null) {
                    _timeOfDay = timeOfDay;
                  }
                });
              },
              child: const Text('Select'),
            ),
          ],
        ),
        Gap.h16,
        Text(
          _timeOfDay.format(context),
        ),
        Gap.h16,
      ],
    );
  }

  Widget _buildColorPicker(BuildContext context) {
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
            Text('Color', style: _labelFontStyle),
          ],
        ),
        TextButton(
          child: const Text('Select'),
          onPressed: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: BlockPicker(
                pickerColor: Colors.white,
                onColorChanged: (color) => setState(
                  () => _currentColor = color,
                ),
              ),
              actions: [
                TextButton(
                  child: const Text('Save'),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityField() {
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
              style: _labelFontStyle,
            ),
            Gap.w16,
            Text(
              _currentSliderValue.toInt().toString(),
              style: GoogleFonts.lato(fontSize: 18),
            ),
          ],
        ),
        Gap.h16,
        Slider(
          inactiveColor: _currentColor.withOpacity(0.5),
          activeColor: _currentColor,
          value: _currentSliderValue.toDouble(),
          min: 0,
          max: 100,
          divisions: 100,
          label: _currentSliderValue.toInt().toString(),
          onChanged: (value) => setState(
            () => _currentSliderValue = value.toInt(),
          ),
        ),
      ],
    );
  }
}
