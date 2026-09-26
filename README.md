# Anime Wallpaper

Offline Flutter app for cinematic **4K anime wallpapers**.

No backend, no login. Favorites, settings, search history, and downloads stay on-device with `shared_preferences`.

## Run on Android

```bat
set PATH=C:\Users\marin\flutter\bin;%PATH%
flutter pub get
flutter run
```

Release APK:

```bat
flutter build apk --release
```

Replace AdMob test IDs in `lib/core/constants/ads_constants.dart` and `android/app/src/main/AndroidManifest.xml` before publishing.

## Content

- 195+ HD anime wallpapers (characters, series, scenery, aesthetic, dark, cute, action, live, minimal, quotes)
- Portrait assets ~90MB total, sourced for offline use
- Android package: `com.animewallpaper.anime_wallpaper`
- Category thumbnails in `assets/images/categories/`
- Branding in `assets/images/branding/`
