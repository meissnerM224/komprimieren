/*
import 'dart:io';
print('Gib eine Buchstabenkette ein: ');
  final unkomprimiert = stdin.readLineSync() ?? '';*/

// import 'dart:ffi';
// import 'dart:svg';

void main(List<String> args) {
  const String unkomprimiert = 'xxxxabbccccca';
  final komprimiertSingle = compressSingle(unkomprimiert);
  print('Single: $komprimiertSingle');
  final komprimiertDouble = compressDouble(unkomprimiert);
  print('Double: $komprimiertDouble');
  final komprimiertArray = compressInArray(unkomprimiert);
  print('Array : $komprimiertArray');
}

String compressOneLetter(String letter, int howMany) {
  if (howMany < 1) {
    return '';
  } else if (howMany < 3) {
    var result = '';
    for (var i = 0; i < howMany; i++) {
      result += letter;
    }
    return result;
  } else {
    return '$letter$howMany';
  }
}

String compressSingle(String unkomprimiert) {
  var count = 1;
  var result = '';
  for (var i = 0; i < unkomprimiert.length - 1; i++) {
    final current = unkomprimiert.substring(i, i + 1);
    final next = unkomprimiert.substring(i + 1, i + 2);
    if (current == next) {
      count++;
    } else {
      result += compressOneLetter(current, count);
      count = 1;
    }
  }
  result += compressOneLetter(unkomprimiert[unkomprimiert.length - 1], count);
  return result;
}

String compressDouble(String unkomprimiert) {
  var result = '';
  var indexBasis = 0;
  //ist der aktuelle Buchstabe noch innerhalb des String?
  while (indexBasis < unkomprimiert.length) {
    final charBasis = unkomprimiert.substring(indexBasis, indexBasis + 1);
    var charVergleich = charBasis;
    var indexVergleich = indexBasis;
    var count = 0;
    // print('StringBeginn: $stringBegin');
    while (charBasis == charVergleich) {
      count++;
      indexVergleich++;
      if (indexVergleich < unkomprimiert.length) {
        // ist indexVergleich noch im gültigen bereich?
        charVergleich = unkomprimiert.substring(
            indexVergleich,
            indexVergleich +
                1); // JA, ist im gültigen bereich. Also nimm den nächsten.
      } else {
        charVergleich =
            ''; // NEIN, ist nicht im gültigen bereich. also nimm: ''
      }
      // print('stringBeginn / stringNext: $stringBegin / $stringNext');
    }
    result += compressOneLetter(charBasis, count);
    //print('Der Buchstabe $stringBegin wurde $count mal gefunden');
    indexBasis = indexVergleich;
  }
  return result;
} // char = a

String compressInArray(String unkomprimiert) {
  var result = '';
  final resultArray = <int>[0];
  for (var i = 0; i < unkomprimiert.length - 1; i++) {
    final current = unkomprimiert.substring(i, i + 1);
    final next = unkomprimiert.substring(i + 1, i + 2);
    if (current == next) {
    } else {
      resultArray.add(i + 1);
    }
  }
  resultArray.add(unkomprimiert.length);
  for (var i = 0; i < resultArray.length - 1; i++) {
    result += compressOneLetter(
        unkomprimiert[resultArray[i]], resultArray[i + 1] - resultArray[i]);
  }
  return result;
}
