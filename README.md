# App Date Picker

A simple, customizable Flutter widget for selecting dates using a Cupertino-style date picker.

---

## Features

- Lightweight and easy to integrate.
- Displays a tappable field showing a formatted date.
- Uses a beautiful Cupertino-style picker.
- Highly customizable with:
    - Date format
    - Initial selected date
    - Title text
    - Done button text
    - Custom callback when date is selected

---

## Getting Started

Add the following to your `pubspec.yaml`:

```yaml
resolution: workspace

dependencies:
  app_date_picker: latest
```

Then run:

```bash
flutter pub get
```

---

## Usage

```dart
import 'package:app_date_picker/app_date_picker.dart';

AppDatePicker(
  title: 'Select your birthday:',
  dateFormat: 'dd-MMMM-yyyy',
  initDate: DateTime(2000, 1, 1),
  doneTxt: 'Confirm',
  onSelectDateTime: (selectedDate) {
    print('Selected date: \$selectedDate');
  },
)
```

---

## API Reference

### AppDatePicker
- `dateFormat`: *(String)* Format of the displayed date. Default is `'dd-MMMM-yyyy'`.
- `initDate`: *(DateTime?)* Initial selected date.
- `onSelectDateTime`: *(Function?)* Callback triggered when a date is selected.
- `title`: *(String?)* Label shown before the date.
- `doneTxt`: *(String?)* Text for the confirm button.

---

## Example

```dart
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppDatePicker Example')),
      body: Center(
        child: AppDatePicker(
          title: 'Birthday',
          initDate: DateTime(1995, 5, 15),
          onSelectDateTime: (date) {
            debugPrint('Selected Date: \$date');
          },
        ),
      ),
    );
  }
}
```

---

## License

This project is licensed under the MIT License.

---

## Contributions

Contributions and suggestions are welcome!

Feel free to open an issue or create a pull request.

---

## Author

Developed by Shohidul islam.

---

Enjoy using `app_date_picker`! 🎈

