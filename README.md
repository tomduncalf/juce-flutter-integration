1. `cd libs`
2. `./copy-dart-sdk.sh` to copy the Dart SDK in to place
3. `cd flutter_project`
4. `flutter run -d macos` - this creates the framework files on disk which the JUCE project needs
5. Export plugin from Projucer
6. Try running it as a plugin from Xcode - I use http://ju-x.com/hostingau.html as a simple host - it'll probably crash first time round.
7. Try again and it should work. Can't remember exactly why, lol, probably depends on some file bieng in place at startup.

Note that this is super rough and messy - there's a hardcoded(ish) LD_RUNPATH configured to point to the Flutter frameworks in the plugins folder for reasons I can't remember, etc.
