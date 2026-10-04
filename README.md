# Resume — Olan L. Lasquety

A personal, single-page resume website built with plain HTML and CSS. Designed to look like a clean white sheet of paper in the browser, with role-tailored versions for different employers.

## Live URL

Deployed via Netlify. Live at: **[your-site.netlify.app]** *(update after deploy)*

## Pages

| URL path              | Role version         |
|-----------------------|----------------------|
| `/`                   | General (Multimedia Artist) |
| `/graphic-design`     | Graphic Designer     |
| `/video-editing`      | Video Editor         |
| `/content-creation`   | Content Creator      |
| `/multimedia-designer`| Multimedia Designer  |

## Project Structure

```
resume/
├── index.html               ← General resume (/)
├── styles.css               ← Shared stylesheet (all pages use this)
├── graphic-design/
│   └── index.html           ← /graphic-design
├── video-editing/
│   └── index.html           ← /video-editing
├── content-creation/
│   └── index.html           ← /content-creation
├── multimedia-designer/
│   └── index.html           ← /multimedia-designer
├── netlify.toml             ← Netlify deploy config
└── README.md
```

## Tech Stack

- **Plain HTML5 + CSS3** — no framework, no build step, no JS
- **Atkinson Hyperlegible** font via Google Fonts (system sans-serif fallback)
- **Print stylesheet** built-in — `Ctrl+P` or Save as PDF produces a clean A4/Letter document
- **Responsive** — scales cleanly on mobile via media queries

## How to Edit an Existing Page

1. Open the relevant `index.html` file (e.g. `graphic-design/index.html`)
2. Edit the text directly in HTML
3. Commit and push — Netlify auto-deploys on every push

## How to Add a New Role Page

1. Create a new folder, e.g. `photography/`
2. Copy an existing `index.html` into it as a starting template
3. Update `<title>`, the `.role` paragraph, the Summary section, the Skills list, and reorder/rewrite the Work Experience entries to emphasize the most relevant details for that role
4. Update the `<link rel="stylesheet" href="../styles.css">` path (one `../` for sub-pages)
5. Commit and push

## Design Notes

- **Background:** `#f4f4f4` page, `#ffffff` paper with a soft `box-shadow`
- **Font:** Atkinson Hyperlegible at `line-height: 1.5`
- **Max width:** ~850px (A4/US Letter proportions)
- **Print:** `@media print` removes shadow, sets A4 page margins
- **SEO:** All pages include `<meta name="robots" content="noindex, nofollow">`

## Deploying to Netlify (first time)

1. Go to [app.netlify.com](https://app.netlify.com) → **Add new site → Import an existing project**
2. Connect to GitHub and select the `resume` repository
3. **Build command:** *(leave blank)*
4. **Publish directory:** `.` (root)
5. Click **Deploy site**

Netlify will give you a URL like `https://random-name.netlify.app`. You can change it under **Site settings → Domain management**.
