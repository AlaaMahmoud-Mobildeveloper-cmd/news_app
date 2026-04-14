# 📰 News App (Cubit & Repository Pattern)

A modern news application built with Flutter, focusing on clean architecture, state management using Cubit, and a decoupled data layer using the Repository pattern.

---
## 📸 Screenshots

Here is a visual guide to the **Moves App** features and user interface.

### 1️⃣ Authentication & Onboarding
<p align="center">
  <img src="assets/screenshots/1(1).png" width="250" alt="Login Screen">
  <img src="assets/screenshots/1(2).png" width="250" alt="Register Screen">
  <img src="assets/screenshots/10.png" width="250" alt="Avatar Selection">
</p>
*Experience a seamless login and a creative registration flow with custom avatar selection.*

### 2️⃣ Exploring Content
<p align="center">
  <img src="assets/screenshots/3.png" width="250" alt="Home Screen">
  <img src="assets/screenshots/4.png" width="250" alt="Movie Details">
  <img src="assets/screenshots/5.png" width="250" alt="Search Screen">
</p>
*Browse the latest movies, view detailed information, and search for your favorites.*

### 3️⃣ Personalization & Categories
<p align="center">
  <img src="assets/screenshots/6.png" width="250" alt="Categories">
  <img src="assets/screenshots/7.png" width="250" alt="Profile Screen">
  <img src="assets/screenshots/8.png" width="250" alt="Watch List">
</p>
*Filter by genre, manage your watch list, and customize your profile settings.*

### 4️⃣ Profile Management
<p align="center">
  <img src="assets/screenshots/9.png" width="250" alt="Edit Profile">
</p>
*Keep your account up to date with the easy-to-use profile editor.*
---
## 🏛 Architecture & Logic

This project follows a structured approach to separate UI, Business Logic, and Data:

### 1. Data Layer (Models & Repositories)
- **Models**: Defines the structure of news articles and API responses.
- **Repository**: Acts as an intermediary between the Cubit and the Data Source (API). It handles data logic and error handling.

### 2. Logic Layer (Cubit)
- **Cubit**: Managed via `bloc` folder. It handles the states:
    - `Initial`: The starting point.
    - `Loading`: While fetching news.
    - `Loaded`: When news is ready to display.
    - `Error`: If something goes wrong.

### 3. Dependency Injection
- Managed via **Get_it** and **Injectable** (files `di.dart` and `di.config.dart`). This ensures that the Repository and Cubit are easily accessible throughout the app without tight coupling.

---

## 📂 Folder Structure (As per my code)

```text
lib/
├── core/             # Global configurations & themes
├── models/           # Data models (JSON parsing)
├── screens/          # Feature-based screens
│   ├── bloc/         # Cubit and States logic
│   ├── reposatry/    # Data fetching logic (Repository)
│   ├── home_Screen/  # UI for the main news feed
│   └── search/       # UI for searching news
├── di.dart           # Dependency Injection setup
└── main.dart         # Entry point