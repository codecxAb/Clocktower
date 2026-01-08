# Builder Timer App

A Flutter application to track multiple builder timers for Clash of Clans.

## Features

- Track up to 5 builders with individual timers
- Set custom work names for each builder
- Receive notifications when work is completed
- Background notifications work even when app is closed
- Persistent storage of timer data

## Getting Started

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- iOS Simulator or Android Emulator

### Installation

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run` to launch the app

### Platform-Specific Setup

#### iOS

- Local notifications work automatically

#### Android

- Notifications are configured in AndroidManifest.xml
- No additional setup required

## Usage

1. Tap on a builder card to set a timer
2. Enter the work name and duration
3. Start the timer
4. The app will notify you when the work is complete

## Dependencies

- flutter_local_notifications: For local push notifications
- shared_preferences: For persistent data storage
- provider: For state management
