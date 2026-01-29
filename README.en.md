**Languages:** [🇮🇩 Indonesian](README.md) | [🇺🇸 English](README.en.md)

<div align="center">
  <img src="assets/logo/logo.png" alt="NovelVerse Logo" width="200"/>
  
  # NovelVerse
  
  **Your personal book tracking companion**
  
  <p><i>A mobile app to manage and track your favorite novel collection</i></p>
  
  <a href="https://github.com/SidqiRaafi/NovelVerse/releases/latest">
    <img src="https://img.shields.io/badge/📥_Download-APK-brightgreen?style=for-the-badge" alt="Download APK">
  </a>
  <br/><br/>
  
  <!-- Tech Stack -->
  [![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
  [![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
  [![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com/)
  [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=for-the-badge)](LICENSE)
  [![Platform](https://img.shields.io/badge/Platform-Android-green?style=for-the-badge&logo=android)](https://www.android.com/)
  
  <!-- GitHub Stats -->
  [![GitHub stars](https://img.shields.io/github/stars/SidqiRaafi/NovelVerse?style=social)](https://github.com/SidqiRaafi/NovelVerse/stargazers)
  [![GitHub forks](https://img.shields.io/github/forks/SidqiRaafi/NovelVerse?style=social)](https://github.com/SidqiRaafi/NovelVerse/network/members)
  [![GitHub last commit](https://img.shields.io/github/last-commit/SidqiRaafi/NovelVerse)](https://github.com/SidqiRaafi/NovelVerse/commits/main)
  [![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/SidqiRaafi/NovelVerse/graphs/commit-activity)
  
  <p>
    <a href="#features">Features</a> •
    <a href="#demo">Demo</a> •
    <a href="#download">Download</a> •
    <a href="#development">Development</a> •
    <a href="#contributing">Contributing</a> •
    <a href="#license">License</a>
  </p>
  
</div>

---

## 📖 About
NovelVerse is a collaborative novel listing application that brings book enthusiasts together. Built with Flutter and Firebase, it provides a shared platform where users can add, discover, and manage their favorite novels. Different accounts, same listing - making it perfect for communities who want to curate and share their reading recommendations.

<a name="features"></a>
## ✨ Features

- 🔐 **User Authentication** - Secure login and registration system
- 📚 **Novel Management** - Add, edit, and delete novels with detailed information
  - Title, Author, Genre
  - Cover URL for visual appeal
  - Ratings and Synopsis
- 🔍 **Search Functionality** - Quickly find novels in your collection by title, author, or genre
- 👤 **Profile Management** - View account details, statistics, and logout
- ℹ️ **About Page** - Learn about the developers and the app
- 🔒 **Personal Library** - Each user has their own private novel collection
- 📱 **Modern UI** - Clean and intuitive interface with elegant design

<a name="demo"></a>
## 🎬 Demo

### Screenshots

<div align="center">
  <img src="assets/demo/splash.png" alt="Splash Screen" width="200"/>
  <img src="assets/demo/welcome.png" alt="Welcome Screen" width="200"/>
  <img src="assets/demo/login.png" alt="Login Screen" width="200"/>
  <img src="assets/demo/register.png" alt="Register Screen" width="200"/>
</div>

<div align="center">
  <img src="assets/demo/home1.png" alt="Home Screen" width="200"/>
  <img src="assets/demo/home2.png" alt="Novel Detail Screen" width="200"/>
  <img src="assets/demo/home3.png" alt="Add Novel Screen" width="200"/>
</div>

<div align="center">
  <img src="assets/demo/home4.png" alt="Edit Novel Screen" width="200"/>
  <img src="assets/demo/home5.png" alt="Delete Novel Screen" width="200"/>
  <img src="assets/demo/profile.png" alt="Profile Screen" width="200"/>
  <img src="assets/demo/about.png" alt="About Screen" width="200"/>
</div>

### Video Demo

<div align="center">
  <a href="https://youtu.be/-scBAf0Sv0s">
    <img src="https://img.youtube.com/vi/-scBAf0Sv0s/maxresdefault.jpg" alt="NovelVerse Demo Video 1" width="80%">
  </a>
  <p><i>🎥 Demo Video 1 - Windows Demo</i></p>
</div>

<div align="center">
  <a href="https://youtu.be/-7pl_pC2xR8">
    <img src="https://img.youtube.com/vi/-7pl_pC2xR8/maxresdefault.jpg" alt="NovelVerse Demo Video 2" width="80%">
  </a>
  <p><i>🎥 Demo Video 2 - Android Demo</i></p>
</div>

<a name="download"></a>
## 📥 Download

### For Users

Download the latest APK from the [Releases](https://github.com/SidqiRaafi/NovelVerse/releases) page.

**Requirements:**
- **Minimum Android Version**: Android 5.0 (API 21) or higher
- Minimum 50MB free storage
- Internet connection for Firebase services

**Installation:**
1. Download the latest `.apk` file from releases
2. Enable "Install from Unknown Sources" in your Android settings
3. Open the downloaded APK and follow the installation prompts
4. Launch NovelVerse and create your account!

<a name="development"></a>
## 🛠️ Development

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (Latest stable version as of January 2026)
- [Dart SDK](https://dart.dev/get-dart) (Comes with Flutter)
- Android Studio / VS Code (or your preferred IDE)
- [Firebase Account](https://firebase.google.com/)
- [Firebase CLI](https://firebase.google.com/docs/cli) (for generating firebase_options.dart)
- Git

### Firebase Setup

1. **Create a Firebase Project**
   - Go to [Firebase Console](https://console.firebase.google.com/)
   - Create a new project or use an existing one

2. **Enable Authentication**
   - In Firebase Console, go to **Authentication**
   - Click "Get Started"
   - Enable **Email/Password** sign-in method

3. **Setup Firestore Database**
   - Go to **Firestore Database**
   - Click "Create database"
   - Choose **Start in production mode** or **Test mode** (for development)
   - Select a region closest to you
   - Create a collection named `novels` with the following fields:
     ```
     - author (string)
     - coverUrl (string)
     - genre (string)
     - rating (number)
     - synopsis (string)
     - title (string)
     ```

4. **Download Configuration Files**
   - In Project Settings, click "Add app" and select **Android**
   - Enter package name: `com.sawitkiawan.novelverse`
   - Download `google-services.json`
   - Place it in `android/app/` directory

5. **Generate Firebase Options**
   ```bash
   # Install FlutterFire CLI
   dart pub global activate flutterfire_cli
   
   # Configure Firebase for your project
   flutterfire configure
   ```
   - Select your Firebase project
   - Choose platforms (at minimum: Android)
   - This will generate `lib/firebase_options.dart` automatically

### Local Setup

```bash
# Clone the repository
git clone https://github.com/SidqiRaafi/NovelVerse.git
cd NovelVerse

# Install dependencies
flutter pub get

# Run the app (make sure you've completed Firebase setup first)
flutter run
```

> **⚠️ Important:** The app won't run without proper Firebase configuration. Make sure you've completed all Firebase setup steps and have both `google-services.json` and `firebase_options.dart` in place.

### Build APK

```bash
# Build release APK
flutter build apk --release

# Build split APKs per ABI (smaller file size)
flutter build apk --split-per-abi
```

The APK will be generated in `build/app/outputs/flutter-apk/`

### Configuration Files (Not in Repository)

These files contain sensitive configuration and are `.gitignore`d:
- `android/app/google-services.json` - Firebase Android configuration
- `lib/firebase_options.dart` - Firebase initialization options

**Note:** Contact the maintainer if you need access to the existing Firebase project for development purposes.

## 🗂️ Project Structure

```
android/
├── app/
│   └── google-services.json        // ask maintainer  ✔️
│
assets/
├── logo/
│   └── logo.png                    // app logo        ✔️
│
├── demo/
│   ├── splash.png                  // showcase splash screen        ✔️
│   ├── welcome.png                 // showcase welcome screen       ✔️
│   ├── login.png                   // showcase login screen         ✔️
│   ├── register.png                // showcase register screen      ✔️
│   ├── home1.png                   // showcase home screen          ✔️
│   ├── home2.png                   // showcase novel screen         ✔️
│   ├── home3.png                   // showcase add novel screen     ✔️
│   ├── home4.png                   // showcase edit novel screen    ✔️
│   ├── home5.png                   // showcase delete novel screen  ✔️
│   ├── profile.png                 // showcase profile screen       ✔️
│   └── about.png                   // showcase about app screen     ✔️
│
lib/
├── models/
│   ├── novel.dart                  // novel data model    ✔️
│   └── user.dart                   // user data model     ✔️
│
├── screens/
│   ├── auth/
│   │   ├── auth_page.dart          // login and register forms      ✔️
│   │   └── welcome_page.dart       // choose login or register      ✔️
│   │
│   ├── home/
│   │   ├── add_novel_page.dart     // add novel form                ✔️
│   │   ├── detail_page.dart        // novel details                 ✔️
│   │   ├── edit_novel_page.dart    // edit novel                    ✔️
│   │   ├── list_page.dart          // novel list and search         ✔️
│   │   └── main_page.dart          // navigation                    ✔️
│   │
│   ├── profile/
│   │   ├── about_page.dart         // app and developer info        ✔️
│   │   └── profile_page.dart       // user info and logout          ✔️
│   └── splash_screen.dart          // splash screen                 ✔️
│
├── services/
│   ├── auth_service.dart           // Firebase Auth Login and Register      ✔️
│   └── firestore_service.dart      // CRUD Novel operations                 ✔️
│
├── widgets/
│   └── auth_wrapper.dart           // Persistent Login System               ✔️
│
├── firebase_options.dart           // ask maintainer                        ✔️
└── main.dart                       // entry point                           ✔️
```

<a name="contributing"></a>
## 🤝 Contributing

We welcome contributions from the community! Here's how you can help:

1. **Fork the repository**
2. **Create a feature branch**
   ```bash
   git checkout -b feature/AmazingFeature
   ```
3. **Commit your changes**
   ```bash
   git commit -m 'Add some AmazingFeature'
   ```
4. **Push to the branch**
   ```bash
   git push origin feature/AmazingFeature
   ```
5. **Open a Pull Request**

### Contribution Guidelines

- Follow the existing code style and structure
- Write clear, descriptive commit messages
- Test your changes thoroughly before submitting
- Update documentation if needed
- Be respectful and constructive in discussions

For more details, see [CONTRIBUTING.md](CONTRIBUTING.md).

## 🚀 Future Plans

- 📖 Add ability to upload and read novel chapters
- 🔖 Bookmark favorite novels
- ⭐ Enhanced rating and review system
- 🔔 Notifications for updates
- 🍎 iOS platform support
- 🌙 Dark mode theme
- 🌐 Multi-language support

<a name="contributors"></a>
## 👥 Contributors

Meet the team behind NovelVerse:

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/SidqiRaafi">
        <img src="https://github.com/SidqiRaafi.png" width="100px;" alt="Sidqi Raafi"/><br />
        <sub><b>Sidqi Raafi</b></sub>
      </a><br />
      <sub>23552011395</sub><br />
      <sub>Lead Developer & Maintainer</sub>
    </td>
    <td align="center">
      <a href="https://github.com/Parzival-Desu">
        <img src="https://github.com/Parzival-Desu.png" width="100px;" alt="Rayhan Khadafi"/><br />
        <sub><b>Rayhan Khadafi</b></sub>
      </a><br />
      <sub>23552011002</sub><br />
      <sub>Authentication & Logo Designer</sub>
    </td>
    <td align="center">
      <a href="https://github.com/Faichese">
        <img src="https://github.com/Faichese.png" width="100px;" alt="Faisal"/><br />
        <sub><b>Faisal</b></sub>
      </a><br />
      <sub>23552012015</sub><br />
      <sub>User & Profile Firebase Integration</sub>
    </td>
    <td align="center">
      <a href="https://github.com/rynrifn">
        <img src="https://github.com/rynrifn.png" width="100px;" alt="Rifki Febrian"/><br />
        <sub><b>Rifki Febrian</b></sub>
      </a><br />
      <sub>23552011430</sub><br />
      <sub>Splashscreen & About Implementation</sub>
    </td>
  </tr>
</table>

<a name="license"></a>
## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 📞 Contact & Support

If you have any questions, suggestions, or issues:

- 🐛 [Report a Bug](https://github.com/SidqiRaafi/NovelVerse/issues)
- 💡 [Request a Feature](https://github.com/SidqiRaafi/NovelVerse/issues)
- 📧 Contact the maintainers through GitHub

## ⭐ Show Your Support

If you find NovelVerse helpful, please consider giving it a star! It helps others discover the project and motivates us to keep improving it.

---

<div align="center">
  Made with Flutter 💙
  <br/>
  <sub>Built with passion for book lovers everywhere</sub>
</div>
