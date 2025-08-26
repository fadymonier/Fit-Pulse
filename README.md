# Fit‑Pulse

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-Auth%20%7C%20Firestore%20%7C%20RTDB-FFCA28?logo=firebase&logoColor=black)](https://firebase.google.com)
[![Platforms](https://img.shields.io/badge/Platforms-Android%20%7C%20iOS-4CAF50)](#)
[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

A cross‑platform mobile application built with **Flutter**, designed for coaches and trainers to monitor and manage athlete performance in real time. Fit‑Pulse connects to a sensor‑equipped vest to stream live physiological data and surfaces actionable insights about a player's physical condition. **Firebase** powers authentication and real‑time data sync.

---

## ✨ Features

- **User Authentication**: Secure sign‑up/sign‑in for coaches with password reset.
- **Player Management**: Add players with name, age, physical attributes, and profile photo. View all players and delete via swipe.
- **Real‑time Performance Tracking**: Connect to an external sensor vest and stream:
  - **ECG Visualization**: Live, scrolling ECG chart.
  - **Heart Rate**: Real‑time BPM.
  - **Velocity & Distance**: Using accelerometer and GPS.
  - **Breath Count**: From a piezo sensor.
- **Detailed Player Profiles**: Rich profile with personal details and editable physiological metrics (e.g., *Lactic Acid*).
- **Data Persistence**: Player info and images cached locally for quick/offline access.
- **Responsive UI**: Adapts to multiple screen sizes with `flutter_screenutil`.

---

## 🧱 Technology Stack

- **Framework**: Flutter
- **Backend Services**:
  - **Firebase Authentication** – coach sign‑up/sign‑in
  - **Cloud Firestore** – player and user data
  - **Firebase Realtime Database** – streaming live sensor data (ECG, HR, etc.)
- **State Management**: Provider
- **Key Packages**:
  - `firebase_core`, `firebase_auth`, `cloud_firestore`, `firebase_database`
  - `fl_chart` – live ECG chart
  - `sensors_plus` – accelerometer data
  - `geolocator` – distance tracking
  - `image_picker`, `path_provider` – local image storage
  - `flutter_slidable` – swipe‑to‑delete
  - `flutter_screenutil` – responsive layouts

---

## 🗂️ Project Structure

The project follows a **feature‑first** structure.

```
lib/
├─ core/                # shared widgets, utils, routing, theme
├─ features/
│  ├─ auth/             # authentication screens & logic
│  ├─ home/             # home screen & player list
│  └─ player_info/      # player profile & stats
├─ firebase/            # Firebase interactions, models, data sources
└─ manager/             # MyProvider (state / session management)
```

- `lib/core`: custom UI components, helpers, app router, theme.
- `lib/features`: UI & presentation for **auth**, **home**, **player_info**.
- `lib/firebase`: Firebase service layer, models, queries.
- `lib/manager`: `MyProvider` for state/session handling.

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK
- VS Code or Android Studio
- Android emulator, iOS simulator, or a physical device

### Clone
```bash
git clone https://github.com/fadymonier/Fit-Pulse.git
cd Fit-Pulse
```

### Install
```bash
flutter pub get
```

### Firebase Configuration
This project is pre‑configured. The repo includes:
- `android/app/google-services.json`
- `lib/firebase_options.dart`

If you want to use your **own** Firebase project:

1. Create a project in [Firebase Console](https://console.firebase.google.com/).
2. Add Android and iOS apps.
3. Download `google-services.json` and place it at `android/app/`.
4. Use **FlutterFire CLI** to generate a fresh `lib/firebase_options.dart`:
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```

> Note: Firebase config files do not contain secrets and are typically safe to commit, but always review your security rules.

### Run
```bash
flutter run
```

---

## 🧭 Usage

1. Launch the app and go through onboarding.
2. Register a coach account or sign in.
3. Home shows your players. A demo player **“Omar Marmoush”** is provided.
4. Tap **Add Player** to create a profile and upload a photo.
5. Tap a player card to open the detailed profile.
6. Switch to the **Statistics** tab to view sensor‑streamed metrics in real time.
7. Swipe left on a player card to delete.

---

## 🔒 Security & Privacy

- All coach access is authenticated.
- Realtime streams are gated by Firebase rules.
- Local caching is used for speed/offline access; avoid storing sensitive health data on‑device unless encrypted per your compliance needs.

---

## 🧪 Development Tips

- Use a physical device for accurate sensor readings.
- Grant location permissions for GPS‑based distance.
- When testing ECG/HR, mock RTDB streams if hardware is unavailable.

---

## 🗺️ Roadmap

- Export sessions as CSV/PDF
- Team/club multi‑tenancy
- Advanced alerting (thresholds/anomalies)
- Wearable SDK integrations
- Cloud Functions for derived metrics

---

## 🤝 Contributing

Contributions are welcome. Please open an issue to discuss significant changes. Submit PRs with clear descriptions and testing notes.


---

## 📬 Contact

**Fady Monier Fouad** – Mobile App Developer (Flutter)  
Email: `fadymonier111@gmail.com`  

