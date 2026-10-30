@echo off
setlocal
cd /d "%~dp0"
where node >nul 2>nul
if errorlevel 1 (
  echo Instale o Node.js 22 ou mais recente em https://nodejs.org/
  pause
  exit /b 1
)
echo Abra http://localhost:4173 no navegador.
node scripts\serve.mjs
if errorlevel 1 pause
