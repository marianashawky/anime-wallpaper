import '../models/wallpaper.dart';

Wallpaper _w({
  required String id,
  required String title,
  required WallpaperCategory category,
  required String subject,
  required String imagePath,
  required List<String> tags,
  String subtitle = '',
  String seriesName = '',
  bool featured = false,
  bool trending = false,
  int downloads = 12000,
  int likes = 4200,
  int views = 88000,
}) {
  return Wallpaper(
    id: id,
    title: title,
    category: category,
    subject: subject,
    imagePath: imagePath,
    tags: tags,
    subtitle: subtitle,
    seriesName: seriesName,
    featured: featured,
    trending: trending,
    downloads: downloads,
    likes: likes,
    views: views,
  );
}

const _p = 'assets/images/wallpapers';

const _characterLooks = <(String, String, String)>[
  ('001', '4K Portrait', '4k'),
  ('002', 'Neon Night', 'neon'),
  ('003', 'Soft Glow', 'aesthetic'),
  ('004', 'Action Frame', 'action'),
  ('005', 'Cinematic', 'cinematic'),
];

List<Wallpaper> _characterSet({
  required String slug,
  required String title,
  required String subject,
  required List<String> tags,
  required String subtitle,
  required String seriesName,
  bool featured = false,
  bool trending = false,
  int downloads = 12000,
  int likes = 4200,
  int views = 88000,
}) {
  return [
    for (var i = 0; i < _characterLooks.length; i++)
      _w(
        id: 'char_${slug}_${_characterLooks[i].$1}',
        title: title,
        category: WallpaperCategory.characters,
        subject: subject,
        imagePath: '$_p/characters/char_${slug}_${_characterLooks[i].$1}.jpg',
        tags: [...tags, _characterLooks[i].$3, '4k'],
        subtitle: i == 0 ? subtitle : _characterLooks[i].$2,
        seriesName: seriesName,
        featured: featured && i == 0,
        trending: trending && i < 2,
        downloads: (downloads * (1 - i * 0.08)).round(),
        likes: (likes * (1 - i * 0.08)).round(),
        views: (views * (1 - i * 0.08)).round(),
      ),
  ];
}

final List<Wallpaper> wallpaperCatalog = [
  ..._characterSet(slug: 'tanjiro', title: 'Tanjiro', subject: 'Tanjiro Kamado', tags: ['tanjiro', 'demon slayer', 'kimetsu'], subtitle: 'Water Breathing', seriesName: 'Demon Slayer', featured: true, trending: true, downloads: 94200, likes: 24100, views: 480000),
  ..._characterSet(slug: 'nezuko', title: 'Nezuko', subject: 'Nezuko Kamado', tags: ['nezuko', 'demon slayer', 'cute'], subtitle: 'Bamboo Smile', seriesName: 'Demon Slayer', featured: true, trending: true, downloads: 91000, likes: 26800, views: 455000),
  ..._characterSet(slug: 'gojo', title: 'Gojo', subject: 'Satoru Gojo', tags: ['gojo', 'jujutsu kaisen', 'limitless'], subtitle: 'Infinity', seriesName: 'Jujutsu Kaisen', featured: true, trending: true, downloads: 98000, likes: 29000, views: 520000),
  ..._characterSet(slug: 'itachi', title: 'Itachi', subject: 'Itachi Uchiha', tags: ['itachi', 'naruto', 'sharingan'], subtitle: 'Crow Moon', seriesName: 'Naruto', trending: true, downloads: 88000, likes: 22100, views: 410000),
  ..._characterSet(slug: 'luffy', title: 'Luffy', subject: 'Monkey D. Luffy', tags: ['luffy', 'one piece', 'pirate'], subtitle: 'Gear Fifth', seriesName: 'One Piece', featured: true, trending: true, downloads: 86000, likes: 21000, views: 395000),
  ..._characterSet(slug: 'zoro', title: 'Zoro', subject: 'Roronoa Zoro', tags: ['zoro', 'one piece', 'swordsman'], subtitle: 'Three Swords', seriesName: 'One Piece', trending: true, downloads: 72000, likes: 17800, views: 310000),
  ..._characterSet(slug: 'eren', title: 'Eren', subject: 'Eren Yeager', tags: ['eren', 'attack on titan', 'aot'], subtitle: 'Rumbling', seriesName: 'Attack on Titan', trending: true, downloads: 79000, likes: 19200, views: 360000),
  ..._characterSet(slug: 'mikasa', title: 'Mikasa', subject: 'Mikasa Ackerman', tags: ['mikasa', 'attack on titan', 'ackerman'], subtitle: 'Scarlet Scarf', seriesName: 'Attack on Titan', downloads: 68000, likes: 18500, views: 290000),
  ..._characterSet(slug: 'levi', title: 'Levi', subject: 'Levi Ackerman', tags: ['levi', 'attack on titan', 'captain'], subtitle: 'Humanity\'s Strongest', seriesName: 'Attack on Titan', trending: true, downloads: 84000, likes: 23000, views: 400000),
  ..._characterSet(slug: 'sukuna', title: 'Sukuna', subject: 'Ryomen Sukuna', tags: ['sukuna', 'jujutsu kaisen', 'curse'], subtitle: 'King of Curses', seriesName: 'Jujutsu Kaisen', trending: true, downloads: 81000, likes: 20000, views: 370000),
  ..._characterSet(slug: 'goku', title: 'Goku', subject: 'Son Goku', tags: ['goku', 'dragon ball', 'saiyan'], subtitle: 'Ultra Instinct', seriesName: 'Dragon Ball', featured: true, trending: true, downloads: 92000, likes: 25000, views: 490000),
  ..._characterSet(slug: 'vegeta', title: 'Vegeta', subject: 'Vegeta', tags: ['vegeta', 'dragon ball', 'prince'], subtitle: 'Pride of Saiyans', seriesName: 'Dragon Ball', downloads: 70000, likes: 16000, views: 280000),
  ..._characterSet(slug: 'naruto', title: 'Naruto', subject: 'Naruto Uzumaki', tags: ['naruto', 'hokage', 'rasengan'], subtitle: 'Seventh Hokage', seriesName: 'Naruto', featured: true, trending: true, downloads: 90000, likes: 24000, views: 470000),
  ..._characterSet(slug: 'sasuke', title: 'Sasuke', subject: 'Sasuke Uchiha', tags: ['sasuke', 'naruto', 'uchiha'], subtitle: 'Avenger', seriesName: 'Naruto', downloads: 76000, likes: 19000, views: 330000),
  ..._characterSet(slug: 'anya', title: 'Anya', subject: 'Anya Forger', tags: ['anya', 'spy x family', 'cute'], subtitle: 'Waku Waku', seriesName: 'Spy x Family', trending: true, downloads: 74000, likes: 22000, views: 340000),
  ..._characterSet(slug: 'yor', title: 'Yor', subject: 'Yor Forger', tags: ['yor', 'spy x family', 'assassin'], subtitle: 'Thorn Princess', seriesName: 'Spy x Family', downloads: 58000, likes: 14000, views: 220000),
  ..._characterSet(slug: 'denji', title: 'Denji', subject: 'Denji', tags: ['denji', 'chainsaw man', 'devil'], subtitle: 'Chainsaw Heart', seriesName: 'Chainsaw Man', trending: true, downloads: 69000, likes: 16500, views: 275000),
  ..._characterSet(slug: 'power', title: 'Power', subject: 'Power', tags: ['power', 'chainsaw man', 'fiend'], subtitle: 'Blood Devil', seriesName: 'Chainsaw Man', downloads: 61000, likes: 15000, views: 240000),
  ..._characterSet(slug: 'deku', title: 'Deku', subject: 'Izuku Midoriya', tags: ['deku', 'mha', 'my hero academia'], subtitle: 'One For All', seriesName: 'My Hero Academia', downloads: 64000, likes: 15500, views: 255000),
  ..._characterSet(slug: 'bakugo', title: 'Bakugo', subject: 'Katsuki Bakugo', tags: ['bakugo', 'mha', 'explosion'], subtitle: 'Great Explosion', seriesName: 'My Hero Academia', downloads: 59000, likes: 14200, views: 230000),
  ..._characterSet(slug: 'frieren', title: 'Frieren', subject: 'Frieren', tags: ['frieren', 'beyond journey\'s end', 'elf'], subtitle: 'Thousand Years', seriesName: 'Frieren', trending: true, downloads: 71000, likes: 18000, views: 300000),
  ..._characterSet(slug: 'makima', title: 'Makima', subject: 'Makima', tags: ['makima', 'chainsaw man', 'control'], subtitle: 'Control Devil', seriesName: 'Chainsaw Man', downloads: 67000, likes: 17000, views: 285000),
  ..._characterSet(slug: 'sung_jinwoo', title: 'Jinwoo', subject: 'Sung Jinwoo', tags: ['jinwoo', 'solo leveling', 'shadow'], subtitle: 'Shadow Monarch', seriesName: 'Solo Leveling', featured: true, trending: true, downloads: 95000, likes: 26000, views: 510000),
  ..._characterSet(slug: 'ichigo', title: 'Ichigo', subject: 'Ichigo Kurosaki', tags: ['ichigo', 'bleach', 'bankai'], subtitle: 'Getsuga Tensho', seriesName: 'Bleach', downloads: 62000, likes: 14800, views: 245000),

  _w(id: 'series_demon_slayer_001', title: 'Demon Slayer', category: WallpaperCategory.series, subject: 'Demon Slayer', imagePath: '$_p/series/series_demon_slayer_001.jpg', tags: ['demon slayer', 'kimetsu', '4k'], subtitle: 'Hashira Night', featured: true, trending: true, downloads: 82000, likes: 19000, views: 360000),
  _w(id: 'series_jujutsu_001', title: 'Jujutsu Kaisen', category: WallpaperCategory.series, subject: 'Jujutsu Kaisen', imagePath: '$_p/series/series_jujutsu_001.jpg', tags: ['jujutsu kaisen', 'sorcery', '4k'], subtitle: 'Cursed Energy', trending: true, downloads: 78000, likes: 18000, views: 340000),
  _w(id: 'series_one_piece_001', title: 'One Piece', category: WallpaperCategory.series, subject: 'One Piece', imagePath: '$_p/series/series_one_piece_001.jpg', tags: ['one piece', 'grand line', '4k'], subtitle: 'Grand Line', trending: true, downloads: 76000, likes: 17500, views: 330000),
  _w(id: 'series_aot_001', title: 'Attack on Titan', category: WallpaperCategory.series, subject: 'Attack on Titan', imagePath: '$_p/series/series_aot_001.jpg', tags: ['attack on titan', 'aot', '4k'], subtitle: 'Walls of Paradise', downloads: 72000, likes: 16800, views: 310000),
  _w(id: 'series_naruto_001', title: 'Naruto', category: WallpaperCategory.series, subject: 'Naruto', imagePath: '$_p/series/series_naruto_001.jpg', tags: ['naruto', 'konoha', '4k'], subtitle: 'Hidden Leaf', downloads: 70000, likes: 16000, views: 295000),
  _w(id: 'series_db_001', title: 'Dragon Ball', category: WallpaperCategory.series, subject: 'Dragon Ball', imagePath: '$_p/series/series_db_001.jpg', tags: ['dragon ball', 'saiyan', '4k'], subtitle: 'Z Warriors', downloads: 68000, likes: 15500, views: 280000),
  _w(id: 'series_chainsaw_001', title: 'Chainsaw Man', category: WallpaperCategory.series, subject: 'Chainsaw Man', imagePath: '$_p/series/series_chainsaw_001.jpg', tags: ['chainsaw man', 'devil', '4k'], subtitle: 'Devil Hunter', trending: true, downloads: 65000, likes: 15000, views: 270000),
  _w(id: 'series_spy_001', title: 'Spy x Family', category: WallpaperCategory.series, subject: 'Spy x Family', imagePath: '$_p/series/series_spy_001.jpg', tags: ['spy x family', 'forger', '4k'], subtitle: 'Forger Family', downloads: 54000, likes: 14000, views: 220000),
  _w(id: 'series_mha_001', title: 'My Hero Academia', category: WallpaperCategory.series, subject: 'My Hero Academia', imagePath: '$_p/series/series_mha_001.jpg', tags: ['mha', 'plus ultra', '4k'], subtitle: 'Plus Ultra', downloads: 52000, likes: 12500, views: 210000),
  _w(id: 'series_solo_001', title: 'Solo Leveling', category: WallpaperCategory.series, subject: 'Solo Leveling', imagePath: '$_p/series/series_solo_001.jpg', tags: ['solo leveling', 'shadow', '4k'], subtitle: 'Arise', featured: true, trending: true, downloads: 88000, likes: 21000, views: 400000),
  _w(id: 'series_frieren_001', title: 'Frieren', category: WallpaperCategory.series, subject: 'Frieren', imagePath: '$_p/series/series_frieren_001.jpg', tags: ['frieren', 'fantasy', '4k'], subtitle: 'Journey\'s End', downloads: 56000, likes: 14500, views: 235000),
  _w(id: 'series_bleach_001', title: 'Bleach', category: WallpaperCategory.series, subject: 'Bleach', imagePath: '$_p/series/series_bleach_001.jpg', tags: ['bleach', 'soul society', '4k'], subtitle: 'Soul Society', downloads: 48000, likes: 11000, views: 190000),
  _w(id: 'series_hxh_001', title: 'Hunter x Hunter', category: WallpaperCategory.series, subject: 'Hunter x Hunter', imagePath: '$_p/series/series_hxh_001.jpg', tags: ['hunter x hunter', 'nen', '4k'], subtitle: 'Hunter Exam', downloads: 45000, likes: 10500, views: 180000),
  _w(id: 'series_tokyo_ghoul_001', title: 'Tokyo Ghoul', category: WallpaperCategory.series, subject: 'Tokyo Ghoul', imagePath: '$_p/series/series_tokyo_ghoul_001.jpg', tags: ['tokyo ghoul', 'kaneki', '4k'], subtitle: 'Ghoul Night', downloads: 42000, likes: 9800, views: 165000),
  _w(id: 'series_vinland_001', title: 'Vinland Saga', category: WallpaperCategory.series, subject: 'Vinland Saga', imagePath: '$_p/series/series_vinland_001.jpg', tags: ['vinland saga', 'viking', '4k'], subtitle: 'True Warrior', downloads: 38000, likes: 9000, views: 150000),

  _w(id: 'scenery_001', title: 'Cherry Blossom Path', category: WallpaperCategory.scenery, subject: 'Sakura Path', imagePath: '$_p/scenery/scenery_001.jpg', tags: ['scenery', 'sakura', '4k', 'japan'], subtitle: 'Spring Whisper', featured: true, trending: true, downloads: 64000, likes: 15000, views: 260000),
  _w(id: 'scenery_002', title: 'Neon Tokyo Rain', category: WallpaperCategory.scenery, subject: 'Tokyo Night', imagePath: '$_p/scenery/scenery_002.jpg', tags: ['scenery', 'tokyo', 'neon', '4k'], subtitle: 'Rain Reflections', trending: true, downloads: 58000, likes: 13500, views: 240000),
  _w(id: 'scenery_003', title: 'Floating Torii', category: WallpaperCategory.scenery, subject: 'Torii Gate', imagePath: '$_p/scenery/scenery_003.jpg', tags: ['scenery', 'torii', '4k'], subtitle: 'Sacred Water', downloads: 42000, likes: 9800, views: 170000),
  _w(id: 'scenery_004', title: 'Mountain Temple', category: WallpaperCategory.scenery, subject: 'Temple', imagePath: '$_p/scenery/scenery_004.jpg', tags: ['scenery', 'temple', '4k'], subtitle: 'Mist Peak', downloads: 36000, likes: 8400, views: 145000),
  _w(id: 'scenery_005', title: 'Starlit Lake', category: WallpaperCategory.scenery, subject: 'Lake Night', imagePath: '$_p/scenery/scenery_005.jpg', tags: ['scenery', 'stars', '4k'], subtitle: 'Mirror Sky', downloads: 34000, likes: 8000, views: 138000),
  _w(id: 'scenery_006', title: 'Bamboo Forest', category: WallpaperCategory.scenery, subject: 'Bamboo', imagePath: '$_p/scenery/scenery_006.jpg', tags: ['scenery', 'bamboo', '4k'], subtitle: 'Green Silence', downloads: 30000, likes: 7200, views: 120000),
  _w(id: 'scenery_007', title: 'Sunset Pagoda', category: WallpaperCategory.scenery, subject: 'Pagoda', imagePath: '$_p/scenery/scenery_007.jpg', tags: ['scenery', 'pagoda', 'sunset', '4k'], subtitle: 'Golden Hour', downloads: 32000, likes: 7600, views: 128000),
  _w(id: 'scenery_008', title: 'Cloud Castle', category: WallpaperCategory.scenery, subject: 'Floating Castle', imagePath: '$_p/scenery/scenery_008.jpg', tags: ['scenery', 'fantasy', '4k'], subtitle: 'Above the Clouds', trending: true, downloads: 40000, likes: 9600, views: 160000),
  _w(id: 'scenery_009', title: 'Lantern Alley', category: WallpaperCategory.scenery, subject: 'Lantern Street', imagePath: '$_p/scenery/scenery_009.jpg', tags: ['scenery', 'lanterns', '4k'], subtitle: 'Festival Walk', downloads: 28000, likes: 6800, views: 112000),
  _w(id: 'scenery_010', title: 'Moon Bridge', category: WallpaperCategory.scenery, subject: 'Moon Bridge', imagePath: '$_p/scenery/scenery_010.jpg', tags: ['scenery', 'moon', '4k'], subtitle: 'Silver Crossing', downloads: 29000, likes: 7000, views: 115000),

  _w(id: 'aesthetic_001', title: 'Soft Sakura', category: WallpaperCategory.aesthetic, subject: 'Soft Aesthetic', imagePath: '$_p/aesthetic/aesthetic_001.jpg', tags: ['aesthetic', 'sakura', 'soft', '4k'], subtitle: 'Petal Dream', featured: true, trending: true, downloads: 55000, likes: 16000, views: 230000),
  _w(id: 'aesthetic_002', title: 'Pastel Sky', category: WallpaperCategory.aesthetic, subject: 'Pastel', imagePath: '$_p/aesthetic/aesthetic_002.jpg', tags: ['aesthetic', 'pastel', '4k'], subtitle: 'Cotton Clouds', downloads: 41000, likes: 12000, views: 175000),
  _w(id: 'aesthetic_003', title: 'Vapor Wave', category: WallpaperCategory.aesthetic, subject: 'Vapor', imagePath: '$_p/aesthetic/aesthetic_003.jpg', tags: ['aesthetic', 'vaporwave', '4k'], subtitle: 'Retro Glow', trending: true, downloads: 38000, likes: 11000, views: 160000),
  _w(id: 'aesthetic_004', title: 'Lo-Fi Desk', category: WallpaperCategory.aesthetic, subject: 'Lo-Fi', imagePath: '$_p/aesthetic/aesthetic_004.jpg', tags: ['aesthetic', 'lofi', '4k'], subtitle: 'Study Night', downloads: 36000, likes: 10500, views: 150000),
  _w(id: 'aesthetic_005', title: 'Pink Rain', category: WallpaperCategory.aesthetic, subject: 'Pink Rain', imagePath: '$_p/aesthetic/aesthetic_005.jpg', tags: ['aesthetic', 'rain', '4k'], subtitle: 'Soft Storm', downloads: 33000, likes: 9800, views: 140000),
  _w(id: 'aesthetic_006', title: 'Golden Hour Girl', category: WallpaperCategory.aesthetic, subject: 'Golden Hour', imagePath: '$_p/aesthetic/aesthetic_006.jpg', tags: ['aesthetic', 'golden', '4k'], subtitle: 'Warm Light', downloads: 31000, likes: 9200, views: 132000),
  _w(id: 'aesthetic_007', title: 'Blue Hour', category: WallpaperCategory.aesthetic, subject: 'Blue Hour', imagePath: '$_p/aesthetic/aesthetic_007.jpg', tags: ['aesthetic', 'blue', '4k'], subtitle: 'Quiet City', downloads: 29000, likes: 8600, views: 124000),
  _w(id: 'aesthetic_008', title: 'Film Grain', category: WallpaperCategory.aesthetic, subject: 'Film', imagePath: '$_p/aesthetic/aesthetic_008.jpg', tags: ['aesthetic', 'film', '4k'], subtitle: 'Analog Mood', downloads: 27000, likes: 8000, views: 115000),

  _w(id: 'dark_001', title: 'Void Eyes', category: WallpaperCategory.dark, subject: 'Dark Void', imagePath: '$_p/dark/dark_001.jpg', tags: ['dark', 'void', '4k'], subtitle: 'Abyss Gaze', featured: true, trending: true, downloads: 52000, likes: 14000, views: 220000),
  _w(id: 'dark_002', title: 'Blood Moon', category: WallpaperCategory.dark, subject: 'Blood Moon', imagePath: '$_p/dark/dark_002.jpg', tags: ['dark', 'moon', '4k'], subtitle: 'Crimson Night', downloads: 44000, likes: 12000, views: 185000),
  _w(id: 'dark_003', title: 'Shadow King', category: WallpaperCategory.dark, subject: 'Shadow', imagePath: '$_p/dark/dark_003.jpg', tags: ['dark', 'shadow', '4k'], subtitle: 'Arise', trending: true, downloads: 48000, likes: 13000, views: 200000),
  _w(id: 'dark_004', title: 'Cursed Seal', category: WallpaperCategory.dark, subject: 'Curse', imagePath: '$_p/dark/dark_004.jpg', tags: ['dark', 'curse', '4k'], subtitle: 'Forbidden Mark', downloads: 35000, likes: 9000, views: 145000),
  _w(id: 'dark_005', title: 'Ghost Lantern', category: WallpaperCategory.dark, subject: 'Ghost', imagePath: '$_p/dark/dark_005.jpg', tags: ['dark', 'ghost', '4k'], subtitle: 'Wandering Light', downloads: 30000, likes: 7800, views: 125000),
  _w(id: 'dark_006', title: 'Obsidian Blade', category: WallpaperCategory.dark, subject: 'Blade', imagePath: '$_p/dark/dark_006.jpg', tags: ['dark', 'blade', '4k'], subtitle: 'Silent Cut', downloads: 28000, likes: 7200, views: 118000),

  _w(id: 'cute_001', title: 'Chibi Squad', category: WallpaperCategory.cute, subject: 'Chibi', imagePath: '$_p/cute/cute_001.jpg', tags: ['cute', 'chibi', '4k'], subtitle: 'Tiny Heroes', featured: true, trending: true, downloads: 47000, likes: 15000, views: 210000),
  _w(id: 'cute_002', title: 'Kitty Ears', category: WallpaperCategory.cute, subject: 'Cat Girl', imagePath: '$_p/cute/cute_002.jpg', tags: ['cute', 'cat', '4k'], subtitle: 'Nya Mode', downloads: 40000, likes: 13000, views: 175000),
  _w(id: 'cute_003', title: 'Pancake Morning', category: WallpaperCategory.cute, subject: 'Breakfast', imagePath: '$_p/cute/cute_003.jpg', tags: ['cute', 'food', '4k'], subtitle: 'Sweet Start', downloads: 32000, likes: 10000, views: 140000),
  _w(id: 'cute_004', title: 'Bunny Dream', category: WallpaperCategory.cute, subject: 'Bunny', imagePath: '$_p/cute/cute_004.jpg', tags: ['cute', 'bunny', '4k'], subtitle: 'Fluffy Night', downloads: 30000, likes: 9500, views: 132000),
  _w(id: 'cute_005', title: 'Candy Cloud', category: WallpaperCategory.cute, subject: 'Candy', imagePath: '$_p/cute/cute_005.jpg', tags: ['cute', 'candy', '4k'], subtitle: 'Sugar Rush', downloads: 28000, likes: 8800, views: 122000),
  _w(id: 'cute_006', title: 'Smile Badge', category: WallpaperCategory.cute, subject: 'Smile', imagePath: '$_p/cute/cute_006.jpg', tags: ['cute', 'smile', '4k'], subtitle: 'Happy Days', downloads: 26000, likes: 8200, views: 115000),

  _w(id: 'action_001', title: 'Final Clash', category: WallpaperCategory.action, subject: 'Battle', imagePath: '$_p/action/action_001.jpg', tags: ['action', 'battle', '4k'], subtitle: 'Last Strike', featured: true, trending: true, downloads: 60000, likes: 14500, views: 250000),
  _w(id: 'action_002', title: 'Energy Burst', category: WallpaperCategory.action, subject: 'Energy', imagePath: '$_p/action/action_002.jpg', tags: ['action', 'energy', '4k'], subtitle: 'Power Up', trending: true, downloads: 52000, likes: 12500, views: 215000),
  _w(id: 'action_003', title: 'Sword Rain', category: WallpaperCategory.action, subject: 'Swords', imagePath: '$_p/action/action_003.jpg', tags: ['action', 'sword', '4k'], subtitle: 'Blade Storm', downloads: 43000, likes: 10500, views: 180000),
  _w(id: 'action_004', title: 'Speed Lines', category: WallpaperCategory.action, subject: 'Speed', imagePath: '$_p/action/action_004.jpg', tags: ['action', 'speed', '4k'], subtitle: 'Flash Step', downloads: 38000, likes: 9200, views: 155000),
  _w(id: 'action_005', title: 'Titan Shadow', category: WallpaperCategory.action, subject: 'Titan', imagePath: '$_p/action/action_005.jpg', tags: ['action', 'titan', '4k'], subtitle: 'Colossal Rise', downloads: 41000, likes: 10000, views: 170000),
  _w(id: 'action_006', title: 'Domain Expand', category: WallpaperCategory.action, subject: 'Domain', imagePath: '$_p/action/action_006.jpg', tags: ['action', 'domain', '4k'], subtitle: 'Sure Hit', trending: true, downloads: 49000, likes: 12000, views: 200000),
  _w(id: 'action_007', title: 'Bankai Release', category: WallpaperCategory.action, subject: 'Bankai', imagePath: '$_p/action/action_007.jpg', tags: ['action', 'bankai', '4k'], subtitle: 'True Form', downloads: 36000, likes: 8800, views: 148000),
  _w(id: 'action_008', title: 'Gear Shift', category: WallpaperCategory.action, subject: 'Gear', imagePath: '$_p/action/action_008.jpg', tags: ['action', 'gear', '4k'], subtitle: 'Next Form', downloads: 34000, likes: 8400, views: 140000),

  _w(id: 'live_001', title: 'Sakura Drift', category: WallpaperCategory.art3d, subject: 'Sakura Live', imagePath: '$_p/live/live_001.jpg', tags: ['live', 'animated', 'sakura', '4k'], subtitle: 'Falling Petals', featured: true, trending: true, downloads: 77000, likes: 19000, views: 340000),
  _w(id: 'live_002', title: 'Neon Pulse', category: WallpaperCategory.art3d, subject: 'Neon Live', imagePath: '$_p/live/live_002.jpg', tags: ['live', 'animated', 'neon', '4k'], subtitle: 'City Heartbeat', trending: true, downloads: 65000, likes: 16000, views: 290000),
  _w(id: 'live_003', title: 'Aura Glow', category: WallpaperCategory.art3d, subject: 'Aura', imagePath: '$_p/live/live_003.jpg', tags: ['live', 'animated', 'aura', '4k'], subtitle: 'Power Aura', downloads: 52000, likes: 13000, views: 230000),
  _w(id: 'live_004', title: 'Rain Window', category: WallpaperCategory.art3d, subject: 'Rain', imagePath: '$_p/live/live_004.jpg', tags: ['live', 'animated', 'rain', '4k'], subtitle: 'Soft Drops', downloads: 48000, likes: 12000, views: 210000),
  _w(id: 'live_005', title: 'Starfield', category: WallpaperCategory.art3d, subject: 'Stars', imagePath: '$_p/live/live_005.jpg', tags: ['live', 'animated', 'stars', '4k'], subtitle: 'Cosmic Drift', downloads: 44000, likes: 11000, views: 195000),
  _w(id: 'live_006', title: 'Ember Trail', category: WallpaperCategory.art3d, subject: 'Embers', imagePath: '$_p/live/live_006.jpg', tags: ['live', 'animated', 'fire', '4k'], subtitle: 'Warm Sparks', downloads: 40000, likes: 10000, views: 175000),
  _w(id: 'live_007', title: 'Wave Breath', category: WallpaperCategory.art3d, subject: 'Water', imagePath: '$_p/live/live_007.jpg', tags: ['live', 'animated', 'water', '4k'], subtitle: 'Flow State', downloads: 38000, likes: 9500, views: 165000),
  _w(id: 'live_008', title: 'Shadow Rise', category: WallpaperCategory.art3d, subject: 'Shadow Live', imagePath: '$_p/live/live_008.jpg', tags: ['live', 'animated', 'shadow', '4k'], subtitle: 'Dark Bloom', trending: true, downloads: 46000, likes: 11500, views: 200000),
  _w(id: 'live_009', title: 'Lantern Float', category: WallpaperCategory.art3d, subject: 'Lanterns', imagePath: '$_p/live/live_009.jpg', tags: ['live', 'animated', 'lantern', '4k'], subtitle: 'Night Festival', downloads: 35000, likes: 8800, views: 150000),
  _w(id: 'live_010', title: 'Crystal Shard', category: WallpaperCategory.art3d, subject: 'Crystal', imagePath: '$_p/live/live_010.jpg', tags: ['live', 'animated', 'crystal', '4k'], subtitle: 'Prism Light', downloads: 33000, likes: 8200, views: 140000),

  _w(id: 'minimal_001', title: 'Single Line', category: WallpaperCategory.minimal, subject: 'Line Art', imagePath: '$_p/minimal/minimal_001.jpg', tags: ['minimal', 'line', '4k'], subtitle: 'Quiet Form', featured: true, downloads: 28000, likes: 7500, views: 120000),
  _w(id: 'minimal_002', title: 'Moon Disk', category: WallpaperCategory.minimal, subject: 'Moon', imagePath: '$_p/minimal/minimal_002.jpg', tags: ['minimal', 'moon', '4k'], subtitle: 'Empty Sky', downloads: 26000, likes: 7000, views: 110000),
  _w(id: 'minimal_003', title: 'Ink Stroke', category: WallpaperCategory.minimal, subject: 'Ink', imagePath: '$_p/minimal/minimal_003.jpg', tags: ['minimal', 'ink', '4k'], subtitle: 'One Brush', downloads: 24000, likes: 6500, views: 100000),
  _w(id: 'minimal_004', title: 'Soft Gradient', category: WallpaperCategory.minimal, subject: 'Gradient', imagePath: '$_p/minimal/minimal_004.jpg', tags: ['minimal', 'gradient', '4k'], subtitle: 'Calm Fade', downloads: 22000, likes: 6000, views: 95000),
  _w(id: 'minimal_005', title: 'Circle Crest', category: WallpaperCategory.minimal, subject: 'Crest', imagePath: '$_p/minimal/minimal_005.jpg', tags: ['minimal', 'crest', '4k'], subtitle: 'Clan Mark', downloads: 20000, likes: 5500, views: 88000),
  _w(id: 'minimal_006', title: 'White Space', category: WallpaperCategory.minimal, subject: 'Space', imagePath: '$_p/minimal/minimal_006.jpg', tags: ['minimal', 'space', '4k'], subtitle: 'Less Is More', downloads: 18000, likes: 5000, views: 80000),

  _w(id: 'quote_001', title: 'Plus Ultra', category: WallpaperCategory.quotes, subject: 'Plus Ultra', imagePath: '$_p/quotes/quote_001.jpg', tags: ['quotes', 'mha', '4k'], subtitle: 'Go Beyond', featured: true, downloads: 35000, likes: 10000, views: 150000),
  _w(id: 'quote_002', title: 'Believe It', category: WallpaperCategory.quotes, subject: 'Dattebayo', imagePath: '$_p/quotes/quote_002.jpg', tags: ['quotes', 'naruto', '4k'], subtitle: 'Never Give Up', downloads: 32000, likes: 9200, views: 138000),
  _w(id: 'quote_003', title: 'I\'m Gonna Be King', category: WallpaperCategory.quotes, subject: 'Pirate King', imagePath: '$_p/quotes/quote_003.jpg', tags: ['quotes', 'one piece', '4k'], subtitle: 'Of The Pirates', downloads: 34000, likes: 9800, views: 145000),
  _w(id: 'quote_004', title: 'Tatakae', category: WallpaperCategory.quotes, subject: 'Fight', imagePath: '$_p/quotes/quote_004.jpg', tags: ['quotes', 'aot', '4k'], subtitle: 'Keep Fighting', downloads: 30000, likes: 8600, views: 128000),
  _w(id: 'quote_005', title: 'Domain Expansion', category: WallpaperCategory.quotes, subject: 'Domain', imagePath: '$_p/quotes/quote_005.jpg', tags: ['quotes', 'jujutsu', '4k'], subtitle: 'Unlimited Void', downloads: 36000, likes: 10500, views: 155000),
  _w(id: 'quote_006', title: 'Arise', category: WallpaperCategory.quotes, subject: 'Arise', imagePath: '$_p/quotes/quote_006.jpg', tags: ['quotes', 'solo leveling', '4k'], subtitle: 'Shadow Army', trending: true, downloads: 40000, likes: 12000, views: 175000),
];

class WallpaperRepository {
  List<Wallpaper> get all => wallpaperCatalog;

  Wallpaper get wallpaperOfTheDay =>
      wallpaperCatalog.firstWhere((w) => w.id == 'char_gojo_001');

  List<Wallpaper> get collections => wallpaperCatalog
      .where((w) =>
          w.category == WallpaperCategory.series ||
          w.tags.contains('cinematic') ||
          w.featured)
      .toList();

  List<Wallpaper> get featured => wallpaperCatalog.where((w) => w.featured).toList();

  List<Wallpaper> get trending => wallpaperCatalog.where((w) => w.trending).toList();

  List<Wallpaper> get newest => wallpaperCatalog.reversed.take(12).toList();

  List<Wallpaper> byCategory(WallpaperCategory category) {
    if (category == WallpaperCategory.art3d) {
      return wallpaperCatalog.where((w) => w.animated || w.tags.contains('live')).toList();
    }
    if (category == WallpaperCategory.aesthetic) {
      return wallpaperCatalog
          .where((w) => w.category == WallpaperCategory.aesthetic || w.tags.contains('aesthetic'))
          .toList();
    }
    if (category == WallpaperCategory.action) {
      return wallpaperCatalog
          .where((w) => w.category == WallpaperCategory.action || w.tags.contains('action'))
          .toList();
    }
    if (category == WallpaperCategory.quotes) {
      return wallpaperCatalog.where((w) => w.category == WallpaperCategory.quotes).toList();
    }
    if (category == WallpaperCategory.minimal) {
      return wallpaperCatalog.where((w) => w.category == WallpaperCategory.minimal || w.tags.contains('minimal')).toList();
    }
    if (category == WallpaperCategory.dark) {
      return wallpaperCatalog.where((w) => w.category == WallpaperCategory.dark || w.tags.contains('dark')).toList();
    }
    return wallpaperCatalog.where((w) => w.category == category || w.subject.toLowerCase().contains(category.label.toLowerCase())).toList();
  }

  List<Wallpaper> search(String query) => wallpaperCatalog.where((w) => w.matches(query)).toList();

  List<Wallpaper> uniqueBySubject(WallpaperCategory category) {
    final seen = <String>{};
    final out = <Wallpaper>[];
    for (final w in byCategory(category)) {
      if (seen.add(w.subject)) out.add(w);
    }
    return out;
  }

  List<Wallpaper> related(Wallpaper wallpaper) {
    final sameCharacter = wallpaperCatalog
        .where((w) => w.id != wallpaper.id && w.subject == wallpaper.subject)
        .toList();
    final sameSeries = wallpaperCatalog.where(
      (w) =>
          w.id != wallpaper.id &&
          w.subject != wallpaper.subject &&
          wallpaper.seriesName.isNotEmpty &&
          w.seriesName == wallpaper.seriesName,
    );
    final sameCategory = wallpaperCatalog.where(
      (w) => w.id != wallpaper.id && w.subject != wallpaper.subject && w.category == wallpaper.category,
    );
    return [...sameCharacter, ...sameSeries, ...sameCategory].take(8).toList();
  }

  Wallpaper? byId(String id) {
    try {
      return wallpaperCatalog.firstWhere((w) => w.id == id);
    } catch (_) {
      return null;
    }
  }

  int countFor(WallpaperCategory category) => byCategory(category).length;
}
