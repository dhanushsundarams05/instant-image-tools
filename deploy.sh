#!/bin/bash

# Instant Image Tool - Optimized Build & Deploy Script
# This script builds the optimized version and deploys to GitHub Pages

set -e

echo "========================================"
echo "Building Instant Image Tool (Optimized)"
echo "========================================"

# Install dependencies if needed
if [ ! -d "node_modules" ]; then
    echo "Installing dependencies..."
    npm install
fi

# Build Tailwind CSS
echo "Building Tailwind CSS..."
npm run build:css

# Build with Vite
echo "Building React app with Vite..."
npm run build

# Copy static files to dist
echo "Copying static assets..."
cp CNAME dist/ 2>/dev/null || true
cp robots.txt dist/ 2>/dev/null || true
cp sitemap.xml dist/ 2>/dev/null || true
cp logo.jpg dist/ 2>/dev/null || true
cp share.jpg dist/ 2>/dev/null || true

# Rename optimized HTML files to standard names
echo "Finalizing HTML files..."
cd dist
for file in *_optimized.html; do
    if [ -f "$file" ]; then
        mv "$file" "${file/_optimized/}"
    fi
done
cd ..

echo ""
echo "========================================"
echo "Build complete! Files are in ./dist"
echo "========================================"
echo ""
echo "To deploy to GitHub Pages:"
echo "  cd dist"
echo "  git init"
echo "  git add -A"
echo "  git commit -m 'Deploy optimized build'"
echo "  git push -f git@github.com:yourusername/instant-image-tools.git main:gh-pages"
echo ""
echo "Or manually copy ./dist contents to your hosting provider"
