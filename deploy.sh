#!/bin/bash

# Instant Image Tool - Deployment Script
# This script helps you deploy all SEO files to GitHub Pages

set -e  # Exit on error

echo "🚀 Instant Image Tool - SEO Deployment"
echo "======================================"
echo ""

# Check if we're in a git repository
if [ ! -d .git ]; then
    echo "❌ Error: Not a git repository. Please run this from your repo root."
    exit 1
fi

# Check for required files
echo "📋 Checking required files..."

required_files=(
    "compress.html"
    "metadata.html"
    "heic.html"
    "convert.html"
    "resize.html"
    "sitemap.xml"
    "robots.txt"
    "CNAME"
    ".nojekyll"
)

missing_files=()
for file in "${required_files[@]}"; do
    if [ ! -f "$file" ]; then
        missing_files+=("$file")
    fi
done

if [ ${#missing_files[@]} -gt 0 ]; then
    echo "❌ Missing required files:"
    printf '   - %s\n' "${missing_files[@]}"
    exit 1
fi

echo "✅ All required files present"
echo ""

# Check for logo and share image
echo "📸 Checking images..."
if [ ! -f "logo.jpg" ]; then
    echo "⚠️  Warning: logo.jpg not found (used as favicon)"
    echo "   Please add logo.jpg to your repository"
fi

if [ ! -f "share.jpg" ]; then
    echo "⚠️  Warning: share.jpg not found (used for social sharing)"
    echo "   Please add share.jpg (1200x630px) to your repository"
fi

echo ""

# Prompt to update index.html
if [ -f "index_updated.html" ]; then
    echo "📝 Updating index.html..."
    read -p "Replace index.html with index_updated.html? (y/n): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        cp index.html index_backup.html
        cp index_updated.html index.html
        echo "✅ index.html updated (backup saved as index_backup.html)"
    else
        echo "⏭️  Skipped index.html update"
    fi
    echo ""
fi

# Git operations
echo "📦 Preparing Git commit..."

# Stage all SEO files
git add -f compress.html metadata.html heic.html convert.html resize.html
git add -f sitemap.xml robots.txt CNAME .nojekyll
git add -f index.html

# Stage images if they exist
[ -f "logo.jpg" ] && git add -f logo.jpg
[ -f "share.jpg" ] && git add -f share.jpg

# Show status
echo ""
echo "📊 Files to be committed:"
git status --short

echo ""
read -p "Commit and push these changes? (y/n): " -n 1 -r
echo ""

if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Commit
    git commit -m "Add SEO-optimized static pages and configuration

- Add static HTML pages for each tool (compress, metadata, heic, convert, resize)
- Add sitemap.xml and robots.txt for SEO
- Add CNAME for custom domain
- Add .nojekyll for GitHub Pages
- Update index.html with proper meta tags and structured data"

    echo "✅ Changes committed"
    echo ""

    # Push
    read -p "Push to GitHub? (y/n): " -n 1 -r
    echo ""
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git push origin main
        echo "✅ Pushed to GitHub"
        echo ""
        echo "🎉 Deployment complete!"
        echo ""
        echo "📋 Next steps:"
        echo "   1. Configure GitHub Pages in repository settings"
        echo "   2. Set custom domain to: instantimagetool.com"
        echo "   3. Configure DNS records (see README.md)"
        echo "   4. Wait for DNS propagation (1-48 hours)"
        echo "   5. Enable HTTPS in GitHub Pages settings"
        echo ""
        echo "📖 See README.md for detailed instructions"
    else
        echo "⏭️  Skipped push (run 'git push origin main' manually)"
    fi
else
    echo "❌ Deployment cancelled"
    echo "   Changes staged but not committed"
    echo "   Run 'git reset' to unstage if needed"
fi
