# 1. Debloat the TV and set up a launcher

The starting point is the prompt from the original project, which walks an AI coding assistant (such as Claude Code) through:
- connecting to the TV over ADB, including the macOS workaround;
- backing everything up and writing a restore script;
- sorting the installed packages and disabling the bloat in small, verified batches;
- building and installing a small native launcher.

**Use the original prompt as it is:** <https://github.com/Gathin23/cleanyourtv>

Things we learned on Fire TV that are worth adding when you run it:
- Amazon's launcher is a protected package on Fire OS: it can't be disabled, and the Home button opens it directly. An accessibility service that notices Amazon's home and opens yours, plus registering your launcher as the voice assistant (Android exempts the assistant from the ~5-second app-switch delay after Home), makes your launcher appear in under a second.
- On Android 11 and newer, adb can't write into an app's own folder; put shared files such as pictures in `/sdcard/<YourApp>/` and give the app the storage permission.
- Large file transfers over adb on macOS are most reliable as base64 chunks through the shell, with a checksum at the end.

Then continue with [2. Glass Home](02-launcher.md).
