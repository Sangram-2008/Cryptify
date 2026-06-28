@echo off
title Cryptify APK Builder
echo ========================================
echo     🚀 BUILDING CRYPTIFY APK
echo ========================================
echo.

:: Check Node.js
node -v >nul 2>&1
if errorlevel 1 (
    echo ❌ Node.js not found! Please install Node.js first.
    echo Download from: https://nodejs.org/
    pause
    exit /b
)

echo ✅ Node.js found

:: Install Capacitor
echo 📦 Installing Capacitor...
call npm init -y >nul
call npm install @capacitor/core @capacitor/cli --save-dev >nul
call npx cap init Cryptify com.yourcompany.cryptify >nul
call npx cap add android >nul

:: Copy web files
echo 📂 Copying web files...
call npx cap copy android >nul

:: Build APK
echo 📱 Building APK (may take 2-3 minutes first time)...
cd android
call gradlew assembleDebug

echo.
echo ========================================
echo ✅ APK BUILD COMPLETE!
echo 📂 Location: android\app\build\outputs\apk\debug\app-debug.apk
echo ========================================
echo.
pause