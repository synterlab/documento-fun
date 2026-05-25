#!/bin/bash
set -e

echo "========================================"
echo "  documento.fun APK Builder"
echo "========================================"

# Environment setup
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export ANDROID_SDK_ROOT=$HOME/android-sdk
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Install Android SDK if missing
if [ ! -d "$ANDROID_SDK_ROOT/cmdline-tools" ]; then
  echo "[1/5] Installing Android SDK..."
  mkdir -p $ANDROID_SDK_ROOT
  wget -q https://dl.google.com/android/repository/commandlinetools-linux-11076708_latest.zip -O cmdtools.zip
  unzip -q cmdtools.zip -d $ANDROID_SDK_ROOT/cmdline-tools
  mv $ANDROID_SDK_ROOT/cmdline-tools/cmdline-tools $ANDROID_SDK_ROOT/cmdline-tools/latest
  rm cmdtools.zip
else
  echo "[1/5] Android SDK already installed."
fi

# Accept licenses + install SDK packages
echo "[2/5] Accepting licenses and installing SDK packages..."
yes | sdkmanager --licenses > /dev/null 2>&1 || true
sdkmanager "platform-tools" "platforms;android-33" "build-tools;33.0.2"

# Install npm dependencies
echo "[3/5] Installing npm dependencies..."
npm install

# Add android platform if not exists
if [ ! -d "android" ]; then
  echo "[4/5] Adding Android platform..."
  npx cap add android
else
  echo "[4/5] Android platform already present."
fi

# Sync web assets to android
echo "      Syncing web assets..."
npx cap sync android

# Build debug APK
echo "[5/5] Building APK (this may take 3-5 minutes)..."
cd android
chmod +x gradlew
./gradlew assembleDebug

# Copy APK to root
cd ..
cp android/app/build/outputs/apk/debug/app-debug.apk ./documento-fun.apk

echo ""
echo "========================================"
echo "  APK ready: documento-fun.apk"
echo "  Download from the file panel."
echo "========================================"
