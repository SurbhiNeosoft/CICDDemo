name: generate android build

on:
  push:
     branches:
       - main
jobs:
    generate_android_build:
       name: generate build
       runs-on: ubntu-latest

    steps:
      - name: Checkout code
        uses: actions/checkout@v4
      - uses: actions/setup-java@v1
        with:
        distribution: 'temurin'
        java-version: '16.x'
      - uses: subosito/flutter-action@v1
        with:
          channel: 'stable'
      - run : flutter pub get
      - run : flutter analyze .
      - run : flutter build apk
      - uses: actions/upload-artifact@v1
        with:
          name:  release-apk
          path: build/app/outputs/apk/release/app-release.apk


