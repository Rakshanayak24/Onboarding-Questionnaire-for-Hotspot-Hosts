# Hotspot Hosts Flutter Assignment (Scaffold)

This scaffold reproduces the structure and core features described in the reference repository (DevNebula6):
- Clean Architecture
- BLoC state management (3 BLoCs)
- Experience selection screen with multi-select & grayscale unselected card
- Question screen with text, audio (record/delete) and video (record/delete)
- API client using Dio and repository abstraction
- Basic permission handling and helpers

This repo is scaffold-only: implementations are functional but simplified and meant to be extended / polished.

Run:
```
flutter pub get
flutter run
```


---

## 📘 Assignment Breakdown

### ✅ Implemented Features
- Experience Type Selection Screen with API-driven data and multi-selection.
- Onboarding Question Screen with text, audio, and video answers.
- Integrated BLoC for Experience, Selection, and QuestionAnswer logic.
- Dio for API communication with mock fallback.
- Audio and video recording inline with permission handling.
- Smooth animations for UI transitions.

### 🏅 Brownie Point Items Implemented
- Pixel-perfect UI following the provided Figma structure.
- Animations: 
  - Experience card slide to first index on selection.
  - Next button smooth width expansion when media buttons disappear.
- Riverpod replaced with BLoC for robust state management.
- Clean Architecture with separation of Presentation, Application, Domain, and Data layers.
- Permission handling for camera and microphone.

### 🚀 Additional Enhancements
- Responsive layouts handling keyboard viewports.
- Centralized theme, typography, and spacing system.
- Modular architecture for scalability.
- Comprehensive inline comments for maintainability.
- Ready-to-extend repository structure for future onboarding screens.
