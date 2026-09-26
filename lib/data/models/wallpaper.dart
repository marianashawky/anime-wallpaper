enum WallpaperCategory {
  characters('Characters', 'characters', 'assets/images/categories/characters.jpg'),
  series('Series', 'series', 'assets/images/categories/series.jpg'),
  scenery('Scenery', 'scenery', 'assets/images/categories/scenery.jpg'),
  aesthetic('Aesthetic', 'aesthetic', 'assets/images/categories/aesthetic.jpg'),
  dark('Dark', 'dark', 'assets/images/categories/dark.jpg'),
  cute('Cute', 'cute', 'assets/images/categories/cute.jpg'),
  action('Action', 'action', 'assets/images/categories/action.jpg'),
  art3d('Live', 'live', 'assets/images/categories/live.jpg'),
  minimal('Minimal', 'minimal', 'assets/images/categories/minimal.jpg'),
  quotes('Quotes', 'quotes', 'assets/images/categories/quotes.jpg');

  const WallpaperCategory(this.label, this.id, this.thumbnail);
  final String label;
  final String id;
  final String thumbnail;
}

class Wallpaper {
  const Wallpaper({
    required this.id,
    required this.title,
    required this.category,
    required this.subject,
    required this.imagePath,
    required this.tags,
    this.subtitle = '',
    this.seriesName = '',
    this.featured = false,
    this.trending = false,
    this.downloads = 0,
    this.likes = 0,
    this.views = 0,
  });

  final String id;
  final String title;
  final WallpaperCategory category;
  final String subject;
  final String imagePath;
  final List<String> tags;
  final String subtitle;
  final String seriesName;
  final bool featured;
  final bool trending;
  final int downloads;
  final int likes;
  final int views;

  bool get animated => imagePath.contains('/live/') || category == WallpaperCategory.art3d;

  bool matches(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return true;
    return title.toLowerCase().contains(q) ||
        subject.toLowerCase().contains(q) ||
        subtitle.toLowerCase().contains(q) ||
        seriesName.toLowerCase().contains(q) ||
        category.label.toLowerCase().contains(q) ||
        tags.any((t) => t.toLowerCase().contains(q));
  }
}
