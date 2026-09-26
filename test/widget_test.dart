import 'package:flutter_test/flutter_test.dart';
import 'package:anime_wallpaper/data/catalog/wallpaper_catalog.dart';
import 'package:anime_wallpaper/data/models/wallpaper.dart';

void main() {
  test('each character has 5 wallpapers', () {
    final characters = wallpaperCatalog.where((w) => w.category == WallpaperCategory.characters);
    final bySubject = <String, int>{};
    for (final w in characters) {
      bySubject[w.subject] = (bySubject[w.subject] ?? 0) + 1;
    }
    expect(bySubject.length, 24);
    expect(bySubject.values.every((count) => count == 5), isTrue);
    expect(characters.length, 120);
  });

  test('every wallpaper file path is unique', () {
    final paths = wallpaperCatalog.map((w) => w.imagePath).toList();
    expect(paths.toSet().length, paths.length);
  });

  test('catalog is tagged for 4K discovery', () {
    final tagged = wallpaperCatalog.where((w) => w.tags.contains('4k')).length;
    expect(tagged, greaterThan(100));
  });
}
