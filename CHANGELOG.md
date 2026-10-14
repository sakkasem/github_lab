# Change log and test guide

This file records the project's changes and the steps used to check each feature. For every future task, add an entry here with the date, a concise change summary, and practical test steps. In the task response, also tell the user how to test the change. Record whether checks were actually run; do not describe suggested manual steps as completed tests.

## 2026-10-14 — Added this change log

- Added this file to preserve the project history and test instructions for completed and ongoing work.
- Check: compare the listed commits with `git log --oneline`; use the manual test steps in each feature entry to exercise that feature. No app or automated tests were run for this documentation change.

## 2026-10-14 — Light and dark mode (in progress; not committed)

- Added a Light/Dark mode switch on the home page. The selected theme applies across the home and Profile pages.
- Persisted the setting locally with `shared_preferences` so it is restored on app launch.
- Added the dependency and refreshed the lockfile and macOS generated plugin registration.
- Checks run: `flutter pub get` completed successfully; `dart format lib/main.dart` completed successfully. No app or automated tests were run.
- Manual test: run `flutter run`; switch Dark mode on and confirm the screen updates; open Profile and confirm it uses dark mode; restart the app and confirm dark mode remains selected. Turn it off, restart, and confirm Light mode remains selected.

## 2026-10-14 — Profile page navigation (commit `819b8e0`)

- Changed the button label to “Press”. Pressing it opens a Profile page, which has a back button.
- No test run was recorded for this change.
- Manual test: run `flutter run`; press “Press” and confirm the Profile page appears; tap “ย้อนกลับ” and confirm the home page returns.

## Earlier repository history

These entries summarize the earlier commits visible in Git. The original project setup commit (`904c37d`, `create button`) added the Flutter app and a button whose press updates a message.

### Button label and message edits

- `057db29` (`text changed`): added an exclamation mark to the initial message.
- `b63e7a5` (`text changed 2`): changed the button label to “กดฉันสิไอดำ”.
- `2c242c6` (`text changed 3`): changed the button label to “กดฉันสิไอดำ555”.
- No test runs were recorded for these commits.
- Manual test for the original button and these text edits: run `flutter run`; confirm the initial message and button label are shown; press the button and confirm the message changes.
