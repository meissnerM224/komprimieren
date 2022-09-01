import 'package:komprimieren/komprimieren.dart';
import 'package:test/test.dart';

void main() {
  test('compressDouble', () {
    expect(compressDouble("aaaabbcddd"), "a4bbcd3");
    expect(compressDouble("aaaaabbbbbbxxxxxchhhtzzaab"), "a5b6x5ch3tzzaab");
    expect(compressDouble("aaaaabbbbbbc"), "a5b6c");
    expect(compressDouble("xxxxabbccc"), "x4abbc3");
    expect(compressDouble("fffffhgggwwww"), "f5hg3w4");
    expect(compressDouble("mnnopqrst"), "mnnopqrst");
    expect(compressDouble('mnnopqrstt'), 'mnnopqrstt');
  });
  test('compressSingle', () {
    expect(compressSingle("aaaabbcddd"), "a4bbcd3");
    expect(compressSingle("aaaaabbbbbbxxxxxchhhtzzaab"), "a5b6x5ch3tzzaab");
    expect(compressSingle("aaaaabbbbbbc"), "a5b6c");
    expect(compressSingle("xxxxabbccc"), "x4abbc3");
    expect(compressSingle("fffffhgggwwww"), "f5hg3w4");
    expect(compressSingle("mnopqrst"), "mnopqrst");
    expect(compressSingle('mnnopqrstt'), 'mnnopqrstt');
  });

  test('compressInArray', () {
    expect(compressInArray('aaaabbcddd'), "a4bbcd3");
    expect(compressInArray('aaaaabbbbbbxxxxxchhhtzzaab'), 'a5b6x5ch3tzzaab');
    expect(compressInArray('aaaaabbbbbbc'), 'a5b6c');
    expect(compressInArray("xxxxabbccc"), "x4abbc3");
    expect(compressInArray('fffffhgggwwww'), 'f5hg3w4');
    expect(compressInArray('mnnopqrst'), 'mnnopqrst');
    expect(compressInArray('mnnopqrstt'), 'mnnopqrstt');
  });
}
