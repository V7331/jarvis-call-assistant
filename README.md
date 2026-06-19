# Jarvis Call Assistant — AI Phone Handler Prototype

**A personal AI assistant that answers calls for you.**

Built as a complete working prototype in Flutter. Jarvis handles simulated calls with real voice (on-device STT + TTS), uses Claude to generate intelligent replies, records the full conversation, and delivers a crisp summary afterward.

**Created by Vedansh Srivastava**  
Contact: ashish8545991707@gmail.com

## Features
- Beautiful premium dark UI with Arc Reactor aesthetics
- Simulate incoming calls from preset contacts
- Three options: Decline (with quick replies), Answer normally, or let **Jarvis** handle it
- Live voice conversation with Claude-powered responses
- Full transcript + AI-generated summary
- Local SQLite history (fully private)

## Setup instructions

### 1. Requirements
- Flutter SDK (3.3+)
- Android Studio or VS Code
- Physical Android device recommended for microphone

### 2. Add Anthropic API key
Edit `.env` and put your key from https://console.anthropic.com

### 3. Install & Run
```bash
flutter pub get
flutter run
```

Grant microphone permission on first launch.

## About the Project
This is a **prototype**. Calls are simulated. For real calls, integrate with Twilio or similar.

Star if you like it! Feedback welcome.