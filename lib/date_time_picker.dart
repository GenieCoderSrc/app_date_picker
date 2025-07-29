import 'package:flutter/material.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:app_style/app_style.dart';

class AppDatePicker extends StatefulWidget {
  final String dateFormat;
  final DateTime? initDate;

  final Function? onSelectDateTime;
  final String? title;
  final String? doneTxt;

  const AppDatePicker({
    super.key,
    this.initDate,
    this.dateFormat = 'dd-MMMM-yyyy',
    this.onSelectDateTime,
    this.title,
    this.doneTxt,
  });

  @override
  _AppDatePickerState createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  DateTime? _dateTime;

  @override
  Widget build(BuildContext context) {
    final String? initDate =
        widget.initDate != null
            ? '${widget.initDate!.day}-${widget.initDate!.month.toString().padLeft(2, '0')}-${widget.initDate!.year.toString().padLeft(2, '0')}'
            : null;
    return Padding(
      padding: EdgeInsets.all(PaddingConstant.kHPadding),
      child: InkWell(
        onTap: _showDatePicker,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Text(
                widget.title ?? "Birthday: ",
                style: AppTxtStyles.kSmallTitleBoldTextStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                _dateTime == null
                    ? initDate ?? '---'
                    : '${_dateTime!.day}-${_dateTime!.month.toString().padLeft(2, '0')}-${_dateTime!.year.toString().padLeft(2, '0')}',
                style: AppTxtStyles.kSmallTitleBoldTextStyle,
              ),
            ),
            Icon(Icons.date_range, color: Colors.blue[900]),
          ],
        ),
      ),
    );
  }

  /// Display date picker.
  void _showDatePicker() {
    final DateTime today = DateTime.now();

    final DateTime initialDateTime = today.subtract(
      const Duration(days: 365 * 18),
    );
    final DateTime minDateTime = today.subtract(
      const Duration(days: 365 * 120),
    );

    final DateTime maxDateTime = today.subtract(const Duration(days: 365 * 14));

    DatePicker.showDatePicker(
      context,
      pickerTheme: DateTimePickerTheme(
        confirm: Text(
          widget.doneTxt ?? "Done",
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w700,
            fontSize: 16.0,
          ),
        ),
        itemTextStyle: AppTxtStyles.kMidTitleTextStyle,
      ),
      initialDateTime: widget.initDate ?? initialDateTime,
      minDateTime: minDateTime,
      maxDateTime: maxDateTime,
      dateFormat: widget.dateFormat,
      onClose: () {
        if (widget.onSelectDateTime != null && _dateTime != null) {
          widget.onSelectDateTime!(_dateTime);
        }
      },
      onCancel: () => debugPrint('onCancel'),
      onChange: (DateTime dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
      onConfirm: (DateTime dateTime, List<int> index) {
        setState(() {
          _dateTime = dateTime;
        });
      },
    );
  }
}
