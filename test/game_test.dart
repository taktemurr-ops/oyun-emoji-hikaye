import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_emoji_hikaye/oyun_emoji_hikaye.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(emojiHikayeConfig.title.length, 33);
    expect(emojiHikayeConfig.tagline.length, 33);
    for (final s in emojiHikayeConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(emojiHikayeConfig.gameId, emojiHikayeId);
    expect(emojiHikayeRules.gameId, emojiHikayeId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(emojiHikayeRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: emojiHikayeId, optionalMechanics: emojiHikayeRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(emojiHikayeRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
