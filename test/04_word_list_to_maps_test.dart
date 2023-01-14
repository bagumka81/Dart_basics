import 'package:test/test.dart';
import 'package:dart_basics/04_word_list_to_maps.dart' as word_list_map;

void main() {
  group('Success test', () {
    test('Convert [one,two,three,three,two,three] to"'
        ' {"one":1, "two":2, "three":3}', () {
      expect(word_list_map.WordListToMap.convert([
        "one",
        "two",
        "three",
        "three",
        "two",
        "three"
      ]), {"one":1, "two":2, "three":3});
    });
  });
}
