import 'dart:math';
import 'package:bmi_end/core/class/shared_prefrences.dart';

void setBmiValue(int value) {
  int counter = SharedPreferencesHelper.getInt("counter") ?? 0;
  String? date = calculate_date();

  switch (counter) {
    case 0:
      SharedPreferencesHelper.sharedPreferences.remove("column1");
      SharedPreferencesHelper.sharedPreferences.remove("column1date");
      SharedPreferencesHelper.setInt("column1", value);
      SharedPreferencesHelper.setString("column1date", date);
      break;
    case 1:
      SharedPreferencesHelper.sharedPreferences.remove("column2");
      SharedPreferencesHelper.sharedPreferences.remove("column2date");
      SharedPreferencesHelper.setInt("column2", value);
      SharedPreferencesHelper.setString("column2date", date);
      break;
    case 2:
      SharedPreferencesHelper.sharedPreferences.remove("column3");
      SharedPreferencesHelper.sharedPreferences.remove("column3date");
      SharedPreferencesHelper.setInt("column3", value);
      SharedPreferencesHelper.setString("column3date", date);
      break;
    case 3:
      SharedPreferencesHelper.sharedPreferences.remove("column4");
      SharedPreferencesHelper.sharedPreferences.remove("column4date");
      SharedPreferencesHelper.setInt("column4", value);
      SharedPreferencesHelper.setString("column4date", date);
      break;
    case 4:
      SharedPreferencesHelper.sharedPreferences.remove("column5");
      SharedPreferencesHelper.sharedPreferences.remove("column5date");
      SharedPreferencesHelper.setInt("column5", value);
      SharedPreferencesHelper.setString("column5date", date);
      break;
    case 5:
      SharedPreferencesHelper.sharedPreferences.remove("column6");
      SharedPreferencesHelper.sharedPreferences.remove("column6date");
      SharedPreferencesHelper.setInt("column6", value);
      SharedPreferencesHelper.setString("column6date", date);
      break;
  }
  counter = (counter + 1) % 6;
  SharedPreferencesHelper.setInt("counter", counter);
  getAllSharedPreferences();
}

String calculate_date() {
  DateTime dateTime = DateTime.now();
  int day = dateTime.day;
  int month = dateTime.month;
  int year = dateTime.year;
  String formattedDate =
      '$day/${month.toString().padLeft(2, '0')}/$year';
  return formattedDate;
}

Future<Map<String, dynamic>> getAllSharedPreferences() async {
  Map<String, dynamic> allColumnValues = {};
  Set<String> keys =
      SharedPreferencesHelper.sharedPreferences.getKeys();

  for (var key in keys) {
    if (key.startsWith("column") && !key.endsWith("date")) {
      dynamic value =
          SharedPreferencesHelper.sharedPreferences.get(key);
      allColumnValues[key] = value;
    }
  }

  if (keys.isEmpty) {
    allColumnValues = {
      "column1": 0,
      "column2": 0,
      "column3": 0,
      "column4": 0,
      "column5": 0,
      "column6": 0,
    };
  }

  return allColumnValues;
}

Future<Map<String, dynamic>> getAllDateTimeSharedPreferences() async {
  Map<String, dynamic> allDateTimeValues = {};
  Set<String> keys =
      SharedPreferencesHelper.sharedPreferences.getKeys();

  for (var key in keys) {
    if (key.endsWith("date")) {
      dynamic value =
          SharedPreferencesHelper.sharedPreferences.get(key);
      String columnKey = key.substring(0, key.length - 4);
      allDateTimeValues[columnKey] = value;
    }
  }

  return allDateTimeValues;
}

double calculateBmiBar(dynamic bmiValue) {
  if (bmiValue <= 10.0) {
    return 10.0;
  } else if (bmiValue <= 15) {
    return 8.0;
  } else if (bmiValue <= 18.5) {
    return (bmiValue * 0.45).abs();
  } else if (bmiValue <= 22.0) {
    return (bmiValue * 0.45).abs();
  } else if (bmiValue <= 24.2) {
    return (bmiValue * 0.35).abs();
  } else if (bmiValue <= 26) {
    return (bmiValue * 0.22).abs();
  } else if (bmiValue <= 30) {
    return (bmiValue * 0.11).abs();
  } else if (bmiValue <= 35) {
    return (bmiValue * 0.05).abs();
  }
  return 0.0;
}

double calculatePBF(double bmi, int age, String gender) {
  double genderFactor = (gender.toLowerCase() == 'male') ? 0 : 1;
  double pbf = 1.20 * bmi + 0.23 * age - 10.8 * genderFactor - 5.4;
  if (pbf < 0) {
    return 0;
  } else if (pbf > 100) {
    return 95;
  }
  return pbf;
}

double calculateBSA(int height, int weight) {
  double bsa = 0.007184 * pow(height, 0.725) * pow(weight, 0.425);
  if (bsa < 0) {
    return 0;
  } else if (bsa > 100) {
    return 95;
  }
  return bsa;
}

double calculateBmi(double bmiValue) {
  if (bmiValue < 13.5) {
    return (bmiValue * 0.75).clamp(1.0, 99.0);
  } else if (bmiValue < 18.5) {
    return (bmiValue * 1.5).clamp(1.0, 99.0);
  } else if (bmiValue < 20.5) {
    return (bmiValue * 2).clamp(1.0, 99.0);
  } else if (bmiValue < 24.9) {
    return (bmiValue * 2.70).clamp(1.0, 99.0);
  } else if (bmiValue < 26.2) {
    return (bmiValue * 2.80).clamp(1.0, 99.0);
  } else if (bmiValue < 30) {
    return (bmiValue * 3.0).clamp(1.0, 99.0);
  } else if (bmiValue < 35) {
    return (bmiValue * 2.75).clamp(1.0, 99.0);
  }
  return 99.0;
}
