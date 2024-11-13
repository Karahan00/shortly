<p align="left">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter Logo" width="200" height="70" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart Logo" width="200" height="70" />
</p>

<p align="left">
  <img src="https://drive.google.com/uc?export=view&id=1h9roAGyNAyG1wLIuHdcZoCN8Dzc09zK8" alt="Shortly App Icon" width="200" height="200" />
</p>

# Shortly App

![Flutter](https://img.shields.io/badge/Flutter-v3.0.0-blue)
![Dart](https://img.shields.io/badge/Dart-v2.17.0-blue)
![License](https://img.shields.io/badge/license-MIT-brightgreen)

## Projektbeschreibung

Die **Shortly App** ist eine mobile Anwendung, die Nutzern hilft, lange URLs schnell und einfach in kurze, geteilte Links umzuwandeln. Sie verwendet **Flutter** für das Frontend und nutzt Firebase für die Benutzerverwaltung und Datenhaltung. Mit der **Bitly API** werden URLs verkürzt und gespeichert.

<p align="left">
  <img src="https://drive.google.com/uc?export=view&id=1r2U2-LYqSEcIOJBTaD74KRE4zTw41Al6" alt="App Demo GIF" width="400" />
</p>

## Features

- Verkürzen von URLs mit der Bitly API
- Anzeige von gespeicherten URLs in einer Bibliothek
- Integration mit Firebase für Authentifizierung und Datenmanagement
- Moderne, benutzerfreundliche Oberfläche mit Flutter

## Technologien

- **Frontend**: Flutter
- **Backend**: Dart • Firebase
- **API**: Bitly API
- **State Management**: Riverpod

## Installation

### Voraussetzungen

1. Installiere [Flutter SDK](https://flutter.dev/docs/get-started/install) auf deinem System.
2. Installiere [Dart SDK](https://dart.dev/get-dart).

### Schritte

1. Repository klonen:

    ```bash
    git clone https://github.com/your-username/shortly-app.git
    cd shortly-app
    ```

2. Abhängigkeiten installieren:

    ```bash
    flutter pub get
    ```

3. Firebase-Konfiguration einrichten:

    - Gehe zu [Firebase Console](https://console.firebase.google.com/), erstelle ein Projekt und konfiguriere die App für Android/iOS.
    - Füge die `google-services.json` (Android) oder `GoogleService-Info.plist` (iOS) zur jeweiligen Plattform-Konfiguration hinzu.
    - Stelle sicher, dass du die richtigen Firebase SDKs und Konfigurationen im Projekt eingerichtet hast.

4. Starte die App:

    - Für Android:

    ```bash
    flutter run
    ```

    - Für iOS:

    ```bash
    flutter run
    ```

## Konfiguration

Für die Verbindung mit der **Bitly API** und **Firebase**, erstelle eine `.env`-Datei im Projektstammverzeichnis und füge deine Konfigurationswerte hinzu:

```bash
FIREBASE_PROJECT_ID=shortly-app-00
BITLY_API_KEY=f615249334a118c0128d69d96c07e45c47bddfc4