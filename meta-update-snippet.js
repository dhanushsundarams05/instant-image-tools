
// Add this code inside your React component where you handle routing/navigation
// Place it in a useEffect that runs when the current tool/route changes

const updateMetaTags = (tool) => {
  const metaConfig = {
    '': { // home page
      title: 'Instant Image Tool – Free Online Image Editor & Converter',
      description: 'Free online image tools: compress, resize, convert formats (HEIC to JPG), remove EXIF metadata. 100% private – all processing happens in your browser.',
      canonical: 'https://instantimagetool.com/'
    },
    'compress': {
      title: 'Image Compressor – Reduce Image Size Online | Instant Image Tool',
      description: 'Free online image compressor. Reduce JPG and PNG image size instantly while keeping quality. 100% privacy — images never leave your device.',
      canonical: 'https://instantimagetool.com/compress'
    },
    'metadata': {
      title: 'EXIF Remover – Remove Metadata from Images Online | Instant Image Tool',
      description: 'Free EXIF metadata remover. Delete location, camera info, and other metadata from JPG and PNG images. 100% private and secure.',
      canonical: 'https://instantimagetool.com/metadata'
    },
    'heic': {
      title: 'HEIC to JPG Converter – Free Online HEIC Converter | Instant Image Tool',
      description: 'Convert HEIC images to JPG format instantly. Free online HEIC to JPG converter. Your images stay private – all processing happens in your browser.',
      canonical: 'https://instantimagetool.com/heic'
    },
    'convert': {
      title: 'JPG to PNG Converter – Free Online Image Format Converter | Instant Image Tool',
      description: 'Free online image format converter. Convert between JPG, PNG, and WebP instantly. 100% private – images never leave your browser.',
      canonical: 'https://instantimagetool.com/convert'
    },
    'resize': {
      title: 'Image Resizer – Resize Images Online Free | Instant Image Tool',
      description: 'Free online image resizer. Resize images by pixels or percentage while maintaining aspect ratio. Fast, private, and easy to use.',
      canonical: 'https://instantimagetool.com/resize'
    }
  };

  const config = metaConfig[tool] || metaConfig[''];

  // Update title
  document.title = config.title;

  // Update or create meta description
  let metaDesc = document.querySelector("meta[name='description']");
  if (!metaDesc) {
    metaDesc = document.createElement('meta');
    metaDesc.name = 'description';
    document.head.appendChild(metaDesc);
  }
  metaDesc.content = config.description;

  // Update or create canonical link
  let canonical = document.querySelector("link[rel='canonical']");
  if (!canonical) {
    canonical = document.createElement('link');
    canonical.rel = 'canonical';
    document.head.appendChild(canonical);
  }
  canonical.href = config.canonical;

  // Update OG tags
  let ogTitle = document.querySelector("meta[property='og:title']");
  if (!ogTitle) {
    ogTitle = document.createElement('meta');
    ogTitle.setAttribute('property', 'og:title');
    document.head.appendChild(ogTitle);
  }
  ogTitle.content = config.title;

  let ogDesc = document.querySelector("meta[property='og:description']");
  if (!ogDesc) {
    ogDesc = document.createElement('meta');
    ogDesc.setAttribute('property', 'og:description');
    document.head.appendChild(ogDesc);
  }
  ogDesc.content = config.description;

  let ogUrl = document.querySelector("meta[property='og:url']");
  if (!ogUrl) {
    ogUrl = document.createElement('meta');
    ogUrl.setAttribute('property', 'og:url');
    document.head.appendChild(ogUrl);
  }
  ogUrl.content = config.canonical;

  // Update Twitter Card tags
  let twitterTitle = document.querySelector("meta[name='twitter:title']");
  if (!twitterTitle) {
    twitterTitle = document.createElement('meta');
    twitterTitle.name = 'twitter:title';
    document.head.appendChild(twitterTitle);
  }
  twitterTitle.content = config.title;

  let twitterDesc = document.querySelector("meta[name='twitter:description']");
  if (!twitterDesc) {
    twitterDesc = document.createElement('meta');
    twitterDesc.name = 'twitter:description';
    document.head.appendChild(twitterDesc);
  }
  twitterDesc.content = config.description;
};

// Example usage in your React component:
// React.useEffect(() => {
//   updateMetaTags(currentTool); // Pass current tool name ('compress', 'resize', etc.)
// }, [currentTool]);
