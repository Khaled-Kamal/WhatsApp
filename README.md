# WhatsApp Assessment

# 🎬 Demo Video
-  YouTube Link : https://www.youtube.com/watch?v=FIRmEB0DO3o

This project implements three main screens similar to WhatsApp:

- **Home (Chats list)**
- **Chat (Conversation)**
- **Stories (Status)**

It includes light & dark mode, responsive layouts, and at least two microinteractions.

## How to run
1. Ensure you have Flutter SDK installed.
2. From the project root, run:
   ```bash
   flutter pub get
   flutter run
   ```

> Tested with Flutter 3.x on Android. iOS requires a Mac for building.

## Microinteractions implemented
1. **Hero avatar transition** from the chat list item to the chat app bar when opening a conversation.
2. **Animated send button** (mic ↔ send) via `AnimatedSwitcher` depending on whether the input is empty.
3. **Animated message insertion** using `AnimatedList` (slide + fade) when a message is sent.
4. **Story open transition** using a scale+fade route animation and a story progress bar.

## Pixel-approximate notes
The colors, padding, sizes, and icons are tuned to be close to WhatsApp defaults while using only built-in Material resources, keeping the code dependency-light. You can further refine paddings, font sizes, and spacings if the review requires stricter accuracy.

## Structure
```
lib/
  main.dart
  theme.dart
  models.dart
  screens/
    home_screen.dart
    chat_list_screen.dart
    chat_screen.dart
    stories_screen.dart
    story_viewer.dart
  widgets/
    message_bubble.dart
    chat_input_bar.dart
assets/images/
  avatar_*.png (placeholders)
```

## Design decisions (short write-up)
- **Architecture:** Simple, single-package app with a few plain model classes. For this assessment, state is kept locally in widgets/stateful classes to keep the code short and readable. In production, consider using a state management solution (e.g., Provider, Riverpod, Bloc).
- **Theming:** A shared `ColorScheme` drives Light & Dark themes to ensure consistent colors for backgrounds, app bars, and primary accents. Typography sticks to platform defaults for native feel.
- **Responsiveness:** Layouts use `LayoutBuilder` and flexible widgets to adapt paddings, sizes, and list densities for small and large screens. On wide screens, lists get denser spacing.
- **Animations:** Prefer Flutter’s built-in `Hero`, `AnimatedSwitcher`, route `PageRouteBuilder`, and `AnimatedList` to keep dependencies minimal and performance smooth.
- **Assets:** Placeholder avatars are bundled to keep the UI realistic. Swap them with real images if needed.
- **Accessibility:** Semantic labels for key buttons (send, mic, back) included. Tap targets are >= 44px.

## What to improve (if given more time)
- Extract spacing and font sizes into a dedicated `AppSpacing`/`AppTypography` module.
- Add i18n and RTL support hooks.
- More precise pixel matching vs. screenshots (e.g., exact chat bubble tails and shadows).
- Story editor and reply UI.
- Unit/widget tests for message list behaviors.
