var komprimiert = 'kjabwdchcb6n2kq567a';

void main(List<String> args) {
  // xxxxabbccccca
  final deCompresst = decompress(komprimiert);
  print('der enkomprimierte string ist: $deCompresst');
}

bool isNumber(String string) {
  final test = int.tryParse(string);
  if (test == null) {
    // test == null => true
    // test == null => false
    return false;
  }
  return true;
}
// bool isNumber(String string) {
//   return int.tryParse(string) != null;
// }
// bool isNumber(String string) => int.tryParse(string) != null;

String decompress(String komprimiert) {
  var result = '';
  final resultArray = <int>[];
  final codeArray = <String>[];
  var previous = '';
  for (var i = 0; i <= komprimiert.length - 1; i++) {
    var current = komprimiert.substring(i, i + 1);
    if (previous == current) {
    } else {
      if (!isNumber(current)) {
        // print(i);
        resultArray.add(i);
      } else {}
    }
    previous = current;
  }
  resultArray.add(komprimiert.length);
  // print(resultArray);
  for (var i = 0; i < resultArray.length - 1; i++) {
    codeArray.add(komprimiert.substring(resultArray[i], resultArray[i + 1]));
  }
  // print(codeArray);
  for (var i = 0; i < codeArray.length; i++) {
    result += decompressOneLetter(kompressedLetter: codeArray[i]); //["a3","bb",...]
  }
  return result;
}

decompressOneLetter({required String kompressedLetter}) {
  // 1. durchgang:    kompressedLetter =  codeArray[0] entspricht "a3"
  var decompressed = '';
  if (kompressedLetter.length == 1) {
    return kompressedLetter;
  }
  if (kompressedLetter.length == 2) {
    if (!isNumber(kompressedLetter.substring(1, 2))) {
      return kompressedLetter;
    }
  }

  var letter = kompressedLetter.substring(0, 1);
  var howMany = kompressedLetter.substring(1, kompressedLetter.length);
  var repeat = int.parse(howMany);

  for (var i = 0; i < repeat; i++) {
    decompressed += letter;
  }

  return decompressed;

  ///kompressedLetter => decompressed
  ///a3 => aaa
  ///bb => bb
  ///m => m
  ///u12 => uuuuuuuuuuuu
}

// while (isNumber(next)) {
//           var sum = [];
//           sum.add(next);
//           indexVergleich++;
//           if (indexVergleich < komprimiert.length) {
//             next = komprimiert.substring(indexBasis, indexBasis + 1);
//           } else {
//             next = '';
//           }
//           sum = sum.toString();
//           sumresult.add(sum);
//         }

// decompress(komprimiert) {
//   var result = '';
//   var indexBasis = 0;
//   while (indexBasis < komprimiert.length) {
//     final charBasis = komprimiert.substring(indexBasis, indexBasis + 1);
//     var charVergleich = komprimiert.substring(indexBasis + 1, indexBasis + 2);
//     var indexVergleich = indexBasis;
//     while (charBasis != charVergleich) {
//       indexVergleich++;
//       if (charVergleich == isNumber(komprimiert)) {
//         charVergleich =
//             komprimiert.substring(indexVergleich, indexVergleich + 1);

//         if (indexVergleich < komprimiert.length) {
//           charVergleich = komprimiert.substring(indexBasis, indexBasis + 1);
//           result = charBasis;
//         }
//       }
//     }
//     return result;
//   }
// }

//   /*
// Ich muss in dem Compresst string character für character vergleichen!
// wenn der nächste character .
// wenn der gesamte "INT" erreicht wurde kann ich mit dieser anzahl den vorherigen Buchstabe mit sich selbst addieren.
// */
//   var count = 1;
//   var result = '';
//   for (var i = 0; i < komprimiert.length - 1; i++) {
//     final current = komprimiert.substring(i, i + 1);
//     final next = komprimiert.substring(i + 1, i + 2);
//     if (current == next) {
//       count++;
//     } else {
//       result += compressOneLetter(current, count);
//       count = 1;
//   result += compressOneLetter(komprimiert[komprimiert.length - 1], count);
//   return result;
