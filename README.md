# Animator Playground 🎨

A Flutter application showcasing a collection of beautiful, interactive animations. This project demonstrates various animation techniques and patterns that can be used in Flutter applications.

## 📱 About

Animator Playground is a showcase app featuring 9 unique animations, each with its own style and purpose. From simple loading indicators to complex interactive animations, this project serves as both a demonstration and a learning resource for Flutter animation development.

## ✨ Features

- 9 unique, polished animations
- Smooth, performant animations built with Flutter
- Clean, modern UI design
- State management using BLoC pattern
- Cros

s-platform support (iOS, Android, Web)

## 🎬 Animations

### 1. Menu Icon
A modern, animated menu icon that transforms into different states. Used on almost every website by now, simple but impressively animated it becomes a real eye-catcher.

https://github.com/user-attachments/assets/ee5fecf4-32a1-4277-bb31-dba9da62088c

### 2. Loading
A calming loading animation. The best are always websites that do not need a loading status. If they do, here would be a calming one.

https://github.com/user-attachments/assets/f5661cd3-dc6a-42bc-84cd-4ef97d6633a7

### 3. Rainy Night
An atmospheric animation featuring falling raindrops that shatter on the ground. The perfect time of day and the perfect weather to program in peace. The raindrops even shatter on the ground.

https://github.com/user-attachments/assets/efa03f2f-d3da-43de-837d-0266fc00770d

### 4. Watch
A customizable watch animation. Classic, noble, modern or playful? What do you want your favorite watch to look like?

https://github.com/user-attachments/assets/e4babc95-6358-41b3-b728-79795a8b04b3

### 5. Pac-Man
An interactive Pac-Man game animation. The classic arcade game is still a lot of fun. The ghosts are chasing you, but you can eat them.


### 6. Send Mail
A delightful mail sending animation. Surprise your visitors with a nice animation instead of a simple "request sent".

https://github.com/user-attachments/assets/4e640765-2486-4120-a2db-03d46de6e549

### 7. Pendulum Wave
A mesmerizing mathematical animation. If you are not yet fascinated by mathematics, you should be now at the latest. Wonderful what a small calculation brings forth.

https://github.com/user-attachments/assets/2364ef67-d231-42fd-a353-548de9310215


### 8. Rotating Square
A simple yet versatile rotating square animation. A simple animation that can be used in many ways. For example, to indicate that the page is loading.


https://github.com/user-attachments/assets/39e4db05-e910-4c98-a9b1-a4d70fa9e89a




### 9. Day Night Slider
A cool slider animation for day and night mode switching.

https://github.com/user-attachments/assets/8c547ffa-cced-429b-9166-b1c056f887ab

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (>=2.16.2 <3.0.0)
- Dart SDK
- Android Studio / Xcode (for mobile development)
- VS Code or Android Studio (recommended IDE)

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd animator_playground
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Running on Different Platforms

- **iOS**: `flutter run -d ios`
- **Android**: `flutter run -d android`
- **Web**: `flutter run -d chrome`

## 🛠️ Tech Stack

- **Framework**: Flutter
- **State Management**: BLoC (flutter_bloc)
- **Language**: Dart
- **UI**: Material Design 3

## 📦 Dependencies

- `flutter_bloc: ^8.1.1` - State management
- `bloc: ^8.1.0` - BLoC pattern implementation
- `intl: ^0.18.0` - Internationalization support
- `cupertino_icons: ^1.0.2` - iOS-style icons

## 📁 Project Structure

```
lib/
├── data/
│   └── animations_data.dart      # Animation data and configurations
├── models/
│   └── animation_model.dart        # Animation model definitions
├── screens/
│   ├── homepage.dart               # Main home screen
│   └── animations/
│       ├── animations_page.dart    # Animations list page
│       ├── day_night_slider/       # Day/Night slider animation
│       ├── loading/                # Loading animation
│       ├── menu_icon/              # Menu icon animation
│       ├── pacman/                 # Pac-Man animation
│       ├── pendulam_wave/          # Pendulum wave animation
│       ├── rainy_night/            # Rainy night animation
│       ├── rotating_squares/       # Rotating squares animation
│       ├── send_mail/              # Send mail animation
│       └── watch/                  # Watch animation
└── main.dart                       # App entry point
```

## 🎨 Animation Details

Each animation is self-contained in its own directory with all necessary components. The animations are defined in `animations_data.dart` with their titles, descriptions, and color schemes.

## 🤝 Contributing

Contributions are welcome! If you'd like to add a new animation or improve existing ones, please feel free to submit a pull request.

## 📝 License

This project is open source and available for learning and demonstration purposes.

## 🙏 Acknowledgments

Inspired by various animation showcases and designed to demonstrate Flutter's powerful animation capabilities.

---

**Note**: To add videos to this README, place them in a `videos/` directory in the project root and ensure the filenames match the references above (e.g., `menu.mp4`, `loading.mp4`, etc.).
