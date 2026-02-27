# 🎓 Ascend University — SwiftUI Frontend

[![Platform: iOS 17+](https://img.shields.io/badge/Platform-iOS%2017%2B-blue.svg)](https://developer.apple.com/ios/)
[![Language: Swift 5.9](https://img.shields.io/badge/Language-Swift%205.9-orange.svg)](https://swift.org)
[![Interface: SwiftUI](https://img.shields.io/badge/Interface-SwiftUI-red.svg)](https://developer.apple.com/xcode/swiftui/)

A premium, native iOS mobile experience for **Ascend University**. This project transforms a modern web-based campus portal into a high-performance, fluid SwiftUI application.

---

## ✨ Features

- **📱 Native Navigation:** A seamless Tab Bar experience featuring Home, Academics, News, Student Hub, and more.
- **🎨 Brand-Centric UI:** Implements the signature Ascend Purple (`#58187C`) and Gold (`#F2AA2E`) design system.
- **🖼️ Remote Assets:** Dynamic loading of real-world campus assets using `AsyncImage` for a live, up-to-date look.
- **📦 Modular Architecture:** Clean separation of concerns between Data, UI Components, and Views.
- **🚀 Optimized Performance:** Built with native SwiftUI for buttery-smooth animations and 120Hz scrolling.

---

## 📸 Screen Gallery

| [ Home ] | [ Academics ] | [ News ] |
| :---: | :---: | :---: |
| Hero Carousels & Rankings | Program Explorers | Real-time Updates |

---

## 🛠️ Technology Stack

- **Core:** Swift 5.9+
- **Framework:** SwiftUI
- **Platforms:** iOS 17.0+ / macOS 14.0+
- **Styles:** Custom `Theme` engine with Linear Gradients and brand-aligned tokens.

---

## 📂 Project Structure

```text
├── App/            # App entry point & Root Tab Navigation
├── Data/           # Swifty Data Models & Mock Data Providers
├── UI/             # Reusable Design System Components
│   ├── Theme.swift        # Brand colors and design tokens
│   ├── HeroViews.swift    # High-impact promotional views
│   └── RemoteImage.swift  # Image loading utilities
├── Views/          # Feature-specific screen implementations
│   ├── HomeView.swift
│   ├── AcademicsView.swift
│   └── NewsView.swift
└── Resources/      # Local assets and configuration
```

---

## 🚀 Getting Started

### 1. Requirements
- **Xcode 15.0+**
- **iOS 17.0+** (Simulator or Physical Device)

### 2. Manual Setup (Recommended)
1. Open Xcode and create a new **iOS App** project named `AscendFrontend`.
2. Delete the auto-generated `AscendFrontendApp.swift` and `ContentView.swift`.
3. Drag and drop the following folders into your Xcode project:
   - `App/`, `Data/`, `UI/`, `Views/`, `Resources/`
4. Ensure "Copy items if needed" is checked.
5. **Build & Run!**

### 3. Swift Package Manager
Alternatively, you can open the project directly via the `Package.swift` file to explore the source code.

---
