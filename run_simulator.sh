#!/bin/bash

echo "🏗️ Building project..."
# Build the binary
xcodebuild -scheme AscendFrontend -destination 'platform=iOS Simulator,id=40A3170E-83EB-4319-A348-17BB7413C50A' > /dev/null

# Find where Xcode put the binary
BINARY_PATH=$(find /Users/macbookpro/Library/Developer/Xcode/DerivedData -name "AscendFrontend" -path "*/Debug-iphonesimulator/*" -type f | head -n 1)
BUILD_DIR=$(dirname "$BINARY_PATH")

if [ -z "$BINARY_PATH" ]; then
    echo "❌ Could not find the built binary. Please make sure the build succeeded in Xcode."
    exit 1
fi

echo "📦 Wrapping into AscendFrontend.app..."
APP_NAME="AscendFrontend.app"
mkdir -p $APP_NAME
cp "$BINARY_PATH" "$APP_NAME/AscendFrontend"
cp Info.plist "$APP_NAME/Info.plist"

# Copy the resources bundle if it exists
BUNDLE_PATH=$(find "$BUILD_DIR" -name "*.bundle" -type d | head -n 1)
if [ -n "$BUNDLE_PATH" ]; then
    cp -R "$BUNDLE_PATH" "$APP_NAME/"
fi

echo "🚀 Installing to Simulator..."
xcrun simctl install booted "$APP_NAME"
xcrun simctl launch booted com.ascend.frontend

echo "✅ App launched! Look at your simulator screen."
