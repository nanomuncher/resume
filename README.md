# Resume — Olan L. Lasquety

A personal, single-page resume website: clean white paper on a light background,
built with plain HTML + CSS (no framework, no build step, no JS).
Five role-tailored versions deployable to any static host.

---

## Live URLs

Deployed via **Netlify** (free plan — works with private GitHub repos).

| Route                   | Role                  |
|-------------------------|-----------------------|
| `/`                     | Multimedia Artist     |
| `/graphic-design`       | Graphic Designer      |
| `/video-editing`        | Video Editor          |
| `/content-creation`     | Content Creator       |
| `/multimedia-designer`  | Multimedia Designer   |

> Update this table with your Netlify domain after first deploy.

---

## Project Structure

```
resume/
├── resume.json                  ← Single source of truth for all content
├── styles.css                   ← Shared stylesheet (design tokens at top)
├── index.html                   ← / (Multimedia Artist)
├── graphic-design/index.html    ← /graphic-design
├── video-editing/index.html     ← /video-editing
├── content-creation/index.html  ← /content-creation
├── multimedia-designer/index.html ← /multimedia-designer
├── netlify.toml                 ← Netlify deploy config
├── .gitignore
├── AGENTS.md                    ← AI agent edit instructions
└── README.md
```

---

## Tech

- **Plain HTML5 + CSS3** — no framework, no build step, no JS
- **Atkinson Hyperlegible** via Google Fonts (system sans-serif fallback)
- **Print stylesheet** built in — `Ctrl+P` / Save as PDF gives a clean A4 document
- **Responsive** — scales to mobile via media queries
- **noindex** on all pages — not discoverable by search engines

---

## Editing Content

### The fast way (one-liners)
If you use Antigravity or another AI agent, see **[AGENTS.md](./AGENTS.md)** for
the full list of one-liner commands, e.g.:

```
"add Premiere Pro to video editing skills"
"update my YCP bullet to say ..."
"add a new role page for UI Design"
"swap the accent colour to #1a6b3c"
```

### Manually
1. All content lives in two places:
   - **`resume.json`** — the authoritative data record
   - The relevant **`index.html`** file — what actually renders in the browser
2. Open the HTML file, find the commented section (`<!-- ═══ SKILLS ═══ -->` etc.),
   and edit the text directly.
3. Mirror the change in `resume.json` so the data stays in sync.
4. Commit and push — Netlify redeploys automatically.

### Skills layout
Skills use a `<dl class="skill-grid">` definition list:
```html
<dl class="skill-grid">
  <dt>Category Name</dt>  <dd>Tool A, Tool B, Tool C</dd>
  <dt>Another Category</dt> <dd>Skill X, Skill Y</dd>
</dl>
```

---

## Adding a New Role Page

1. Create a new folder, e.g. `ui-design/`
2. Copy the closest existing `index.html` into it
3. Update:
   - `<title>` and `.role` paragraph
   - Summary section
   - Skill categories and items (order by relevance to role)
   - Job order and bullet emphasis
   - `<link rel="stylesheet" href="../styles.css">` (one `../` for sub-pages)
4. Add the new page block to `resume.json > pages`
5. Update this README table
6. Commit: `feat(ui-design): add UI Designer role page`

---

## Deploying to Netlify (first time)

1. [app.netlify.com](https://app.netlify.com) → **Add new site → Import an existing project**
2. Connect GitHub → select `nanomuncher/resume`
3. **Build command:** *(leave blank)*
4. **Publish directory:** `.`
5. **Deploy site**

Netlify gives you a URL like `https://random-name.netlify.app`.
Rename it under **Site settings → Domain management**.

---

## Design Tokens (quick reference)

All visual variables are at the top of `styles.css`:

| Token       | Default   | Controls                        |
|-------------|-----------|----------------------------------|
| `--bg`      | `#f4f4f4` | Page background                 |
| `--paper`   | `#ffffff` | Sheet background                |
| `--ink`     | `#1a1a1a` | Headings, skill labels, links   |
| `--muted`   | `#555555` | Body copy, dates, company names |
| `--accent`  | `#1a1a1a` | Section heading text            |
| `--rule`    | `#e0e0e0` | Section divider lines           |