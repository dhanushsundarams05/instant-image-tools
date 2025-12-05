@echo off
setlocal enabledelayedexpansion

echo ==========================================
echo Instant Image Tool - SEO Deployment
echo ==========================================
echo.

REM Check if we're in a git repository
if not exist .git (
    echo Error: Not a git repository. Please run this from your repo root.
    pause
    exit /b 1
)

echo Checking required files...

set missing=0
for %%f in (compress.html metadata.html heic.html convert.html resize.html sitemap.xml robots.txt CNAME .nojekyll) do (
    if not exist %%f (
        echo Missing: %%f
        set missing=1
    )
)

if !missing! equ 1 (
    echo.
    echo Error: Missing required files
    pause
    exit /b 1
)

echo All required files present
echo.

REM Check for images
if not exist logo.jpg (
    echo Warning: logo.jpg not found
)

if not exist share.jpg (
    echo Warning: share.jpg not found
)

echo.

REM Update index.html if needed
if exist index_updated.html (
    set /p updateindex="Replace index.html with index_updated.html? (y/n): "
    if /i "!updateindex!"=="y" (
        copy index.html index_backup.html
        copy index_updated.html index.html
        echo Index.html updated
    )
)

echo.
echo Staging files...

git add compress.html metadata.html heic.html convert.html resize.html
git add sitemap.xml robots.txt CNAME .nojekyll
git add index.html

if exist logo.jpg git add logo.jpg
if exist share.jpg git add share.jpg

echo.
echo Files staged:
git status --short

echo.
set /p commit="Commit and push changes? (y/n): "

if /i "!commit!"=="y" (
    git commit -m "Add SEO-optimized static pages and configuration"
    echo.
    echo Changes committed
    echo.
    set /p push="Push to GitHub? (y/n): "
    if /i "!push!"=="y" (
        git push origin main
        echo.
        echo ==========================================
        echo Deployment complete!
        echo ==========================================
        echo.
        echo Next steps:
        echo   1. Configure GitHub Pages in repository settings
        echo   2. Set custom domain to: instantimagetool.com
        echo   3. Configure DNS records (see README.md)
        echo.
    )
)

pause
