@echo off
setlocal
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo Node.js is required. Install Node.js, then run this file again.
  pause
  exit /b 1
)
echo Starting PromptShield. Keep this window open while using the app.
echo After the server starts, open http://127.0.0.1:4173 in your browser.
echo Stop the server with Ctrl+C.
node server.js
pause
