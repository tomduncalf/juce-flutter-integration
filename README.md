This only works on iOS right now.

# Setup:

1. Modify `iosBundleIdentifier` in `flutter_module/pubspec.yaml` to be something unique
2. `cd flutter_module` (from the top level) and run `flutter build ios`, this will create some files that are needed for the integration, don't worry when it fails
3. Open `JuceFlutter.jucer` and export for iOS, close Xcode if it opens
4. `cd Builds/iOS` (from the top level) and create a symlink to the `Podfile`: `ln -s ../../Podfile` (you will need to do this any time you delete the Builds folder)
5. Run `pod install` from `Builds/iOS` to create an `.xcworkspace` containing the required Flutter bits along with the JUCE code

# Running:

1. Open `JuceFlutter.xcworkspace` (_not_ `.xcproj`) and build as usual to a connected iOS device
2. If you want to use the Flutter debug console, run `flutter attach` to connect to the running instance of the app

# Notes:

If you modify the Projucer project and export again, you will need to run `pod install` again after exporting.
