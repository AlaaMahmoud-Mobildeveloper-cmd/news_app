# 📰 News App (Cubit & Repository Pattern)

A modern news application built with Flutter, focusing on clean architecture, state management using Cubit, and a decoupled data layer using the Repository pattern.

---
## 📸 Screenshots

Here is a visual guide to the **Moves App** features and user interface.

<p align="center">
  <img src="assets/screenshots/1 (1).png" width="98" alt="Login Screen">
  <img src="assets/screenshots/1 (2).png" width="100" alt="Register Screen">
  <img src="assets/screenshots/1 (3).png" width="104" alt="Avatar Selection">
  <img src="assets/screenshots/1 (4).png" width="101" alt="Avatar Selection">
  <img src="assets/screenshots/1 (5).png" width="99" alt="Avatar Selection">
  <img src="assets/screenshots/1 (6).png" width="100" alt="Avatar Selection">
  <img src="assets/screenshots/1 (7).png" width="103" alt="Avatar Selection">
  <img src="assets/screenshots/1 (8).png" width="104" alt="Avatar Selection">
  <img src="assets/screenshots/1 (9).png" width="98" alt="Avatar Selection">
</p>

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