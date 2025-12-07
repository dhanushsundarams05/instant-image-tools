@echo off
REM Instant Image Tool - Optimized Build & Deploy Script
REM This script builds the optimized version for deployment

echo ========================================
echo Building Instant Image Tool (Optimized)
echo ========================================

REM Install dependencies if needed
if not exist "node_modules" (
    echo Installing dependencies...
    call npm install
)

REM Build Tailwind CSS
echo Building Tailwind CSS...
call npm run build:css

REM Build with Vite
echo Building React app with Vite...
call npm run build

REM Copy static files to dist
echo Copying static assets...
copy CNAME dist\ 2>nul
copy robots.txt dist\ 2>nul
copy sitemap.xml dist\ 2>nul
copy logo.jpg dist\ 2>nul
copy share.jpg dist\ 2>nul

REM Rename optimized HTML files
echo Finalizing HTML files...
cd dist
for %%f in (*_optimized.html) do (
    set "oldname=%%f"
    set "newname=%%f"
    set "newname=!newname:_optimized=!"
    move "!oldname!" "!newname!"
)
cd ..

echo.
echo ========================================
echo Build complete! Files are in .\dist
echo ========================================
echo.
echo To deploy, copy .\dist contents to your hosting provider
echo.
pause
