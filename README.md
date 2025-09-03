# EcoDust — Flutter MVP (Digital Pollution)

> Lightweight, demo-ready Flutter app that turns **invisible digital waste** into visible CO₂ impact with **quick cleanups + gamified rewards**. Built to pitch, prototype, and iterate fast.

---

## ✨ Highlights

* **Quick wins UI**: presets for deleting dup photos / large videos / old downloads / stale emails
* **Impact visibility**: immediate estimate of **items cleaned** and **CO₂ saved**
* **Gamification**: points, badges, weekly challenge
* **Responsive UI**: mobile-first, dark mode, Material 3
* **MVP friendly**: mock services + clean architecture you can swap for real connectors later

---

## 📸 Screenshots

> Add your own screenshots into `docs/` and update paths below.

| Home                            | Clean                            | Impact                            | Rewards                            |
| ------------------------------- | -------------------------------- | --------------------------------- | ---------------------------------- |
| `docs/screenshots/home_ios.png` | `docs/screenshots/clean_ios.png` | `docs/screenshots/impact_ios.png` | `docs/screenshots/rewards_ios.png` |

---

## 🧩 Pain point → Solution (for pitch)

| Pain point                           | Why it hurts                              | EcoDust solution                                        |
| ------------------------------------ | ----------------------------------------- | ------------------------------------------------------- |
| **Invisible digital pollution**      | Users don’t see storage/energy/CO₂ impact | Realtime **CO₂ equivalents** & progress visuals         |
| **Digital clutter & overwhelm**      | Full inbox / dup photos / large files     | **One-tap “Quick Clean”** tasks with safe confirmations |
| **Low motivation**                   | Deleting files feels pointless            | **Points + badges + weekly challenge**                  |
| **Enterprise storage cost & ESG**    | Rising cloud costs, unclear metrics       | Aggregated metrics; can evolve to team dashboards       |
| **Compliance risk (over-retention)** | Old data ↑ privacy/security risk          | Playbooks that encourage lifecycle cleanup              |

---

## 🏗️ Project structure

```
lib/
  main.dart                  # app shell, themes, nav
  models/
    cleanup_task.dart        # domain model
  services/
    mock_services.dart       # demo data + fake run()
  widgets/
    cleanup_card.dart        # card UI for tasks
  screens/
    home_screen.dart         # hero + KPIs + quick actions
    cleanup_screen.dart      # list + filters + run modal
    impact_screen.dart       # progress + equivalents
    rewards_screen.dart      # points + badges
```

---

## 🚀 Quick start

### Prerequisites (macOS)

```bash
brew install --cask flutter
xcode-select --install
brew install cocoapods || sudo gem install cocoapods
pod setup
```

### Clone & run

```bash
git clone https://github.com/PinturaW/Eco_Dust.git
cd Eco_Dust
flutter pub get

# iOS Simulator
open -a Simulator
flutter devices
flutter run -d "iPhone 16 Pro" -t lib/main.dart

# Web (Chrome)
# flutter run -d chrome -t lib/main.dart
```

> **Tip:** If pods are missing for iOS: `cd ios && pod install && cd ..` then `flutter clean && flutter pub get`.

---

## 🧪 Try the demo flow

1. Go to **Clean** → run any task (e.g., *ลบรูปซ้ำ*).
2. You’ll see a snackbar: *items cleaned • CO₂ saved • +points*.
3. Check **Impact** for cumulative CO₂ and **Rewards** for progress/badges.

> All numbers are **estimates for demo**. Replace `MockCleanupService` with real integrations later.

---

## 🎨 Design system (M3)

* **Typography**: Inter (via `google_fonts`)
* **Seed color**: `#00A67E` (green) → light/dark schemes
* **Components**: NavigationBar, Card, SegmentedButton, Chips
* **UX niceties**: gradient background, safe modals, responsive KPI layout

---

## 🔌 Replacing mock logic later

* Build real providers under `services/` (e.g., photos, storage, Gmail, Drive)
* Swap `MockCleanupService.run()` with real routines
* Persist user metrics via a repository (local + cloud)
* Add auth if you plan multi-device syncing

---

## 🧰 Troubleshooting

**No iOS device detected**

```bash
xcrun simctl list devices
xcrun simctl boot <UDID>
open -a Simulator --args -CurrentDeviceUDID <UDID>
flutter run -d <UDID> -t lib/main.dart --device-timeout 60
```

**CocoaPods not installed / invalid state**

```bash
brew install cocoapods || sudo gem install cocoapods
cd ios && pod install && cd ..
flutter clean && flutter pub get
```

**DevTools error on web: “Cannot send Null”** – Harmless for native builds. Use iOS/Android while developing.
**RenderFlex overflow (red stripes)** – Use responsive variants included here (LayoutBuilder + FittedBox, or Wrap).

---

## 📦 Dependencies

* `google_fonts`, `intl`, `shared_preferences`

---

## 🗺️ Roadmap

* [ ] Real duplicate photo scanner & large file finder
* [ ] Email cleanup assistant (labels, size filters)
* [ ] Team/Org dashboard (ESG rollups)
* [ ] Carbon methodology audit + transparent factors
* [ ] Localization (TH/EN)

---

## 📬 Contact

Developed by **Wichuon Charoensombat** (PinturaW)
📧 Reach me on [LinkedIn](https://www.linkedin.com/in/wichuon-charoensombat) or GitHub

---
