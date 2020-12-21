This only works on iOS right now.

# Setup:

1. `cd flutter_module` (from the top level) and run `flutter build ios`, this creates some files that are needed for the integration
2. `cd Builds/iOS` (from the top level) and run `pod install` to create an xcworkspace containing the required Flutter bits along with the JUCE code (depends on there being a symlink from `Builds/iOS/Podfile` to `Podfile`, so if you delete the `Builds` folder this will need recreating)

# Running:

1. Open `JuceFlutter.xcworkspace` (_not_ `.xcproj`) and build as usual to a connected iOS device
2. If you want to use the Flutter debug console, run `flutter attach` to connect to the running instance of the app

# Notes:

If you modify the Projucer project and export again, you will need to run `pod install` again after exporting.
