import 'package:komprimieren/dekomprimieren.dart';
import 'package:test/test.dart';

void main() {
  test('decompress', () {
    expect(decompress('a4bbcd3'), 'aaaabbcddd');
    expect(decompress('a5b6x5ch3tzzaab'), 'aaaaabbbbbbxxxxxchhhtzzaab');
    expect(decompress('a5b6c'), 'aaaaabbbbbbc');
    expect(decompress('x4abbc3'), 'xxxxabbccc');
    expect(decompress('f5hg3w4'), 'fffffhgggwwww');
    expect(decompress('mnnopqrst'), 'mnnopqrst');
    expect(decompress('mnnopqrstt'), 'mnnopqrstt');
  });
}
