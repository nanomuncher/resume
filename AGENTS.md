# AGENTS.md — Resume Edit Instructions

This file tells Antigravity (or any AI agent) exactly how this repo is structured
and what commands to follow for common edits.

---

## Repo Structure

```
resume/
├── resume.json                  ← SINGLE SOURCE OF TRUTH for all content
├── styles.css                   ← Shared stylesheet (design tokens at top)
├── index.html                   ← / (general: Multimedia Artist)
├── graphic-design/index.html    ← /graphic-design
├── video-editing/index.html     ← /video-editing
├── content-creation/index.html  ← /content-creation
├── multimedia-designer/index.html
├── netlify.toml                 ← Netlify deploy config (publish = ".")
├── .gitignore
├── README.md
└── AGENTS.md                    ← This file
```

---

## How Content Is Organised

- **`resume.json`** contains two top-level keys:
  - `shared` — name, contact info, education, and all job entries (`shared.jobs`)
  - `pages` — one key per route (`index`, `graphic-design`, etc.) with per-page
    role title, summary, skill categories, job order, and optional bullet overrides
- **HTML files** are hand-editable with clearly commented sections. They do NOT
  auto-generate from JSON at runtime — edit whichever file you need.
- `resume.json` is the authoritative record; keep it in sync when editing HTML.

---

## One-Liner Edit Commands

Say any of the following and I will edit only the necessary file(s) and commit
with a clear message.

### Skills
- `"add [Tool] to [role] skills"` — edit the relevant `<dl class="skill-grid">` in
  that role's `index.html` and update the matching entry in `resume.json`.
- `"remove [Tool] from skills on all pages"` — update all 5 HTML files + `resume.json`.
- `"rename the Design Software category to [New Name] on the graphic design page"` —
  edit `graphic-design/index.html` and `resume.json`.

### Bullets
- `"update my YCP bullet to say [new text]"` — edit the freelance job entry in the
  relevant HTML file(s) and `resume.json > shared > jobs > freelance > bullets`.
- `"add a bullet to [company] on [role] page: [text]"` — edit that page's HTML and,
  if it's a global bullet, also `resume.json`.
- `"remove the last bullet from [company] on all pages"` — update every HTML file
  that shows that job.

### Job / Section Order
- `"move content creation to the top of the multimedia designer page"` — reorder
  `<div class="job">` blocks in `multimedia-designer/index.html` and update
  `resume.json > pages > multimedia-designer > jobOrder`.
- `"move [section] above [other section]"` — reorder `<section>` blocks in the
  specified HTML file.

### Design
- `"swap the accent colour to #xxxxxx"` — edit `--accent` and `--ink` in
  `styles.css` (one commit, affects all pages instantly).
- `"increase body font size to 11pt"` — edit `font-size` on `body` in `styles.css`.
- `"add more padding to the sheet"` — edit `padding` on `.sheet` in `styles.css`.

### New Role Page
- `"add a new role page for [role name] at /[slug]"` — steps:
  1. Copy the closest existing `index.html` into a new `[slug]/` folder.
  2. Update `<title>`, `.role`, Summary, skill categories and order, job order,
     bullet emphasis to suit the new role.
  3. Add the new page's data block to `resume.json > pages`.
  4. Document it in `README.md`.
  5. Commit: `feat([slug]): add [Role Name] resume page`.

### Contact / Header
- `"add my LinkedIn at [URL]"` — add `<li><a href="[URL]">LinkedIn</a></li>` to
  the `.contact` list in all 5 HTML files and add `linkedin` to `resume.json > shared`.
- `"update my phone number to [number]"` — edit all 5 HTML files + `resume.json`.

---

## Commit Message Convention

```
<type>(<scope>): <short description>

type:    feat | fix | content | style | chore | docs
scope:   index | graphic-design | video-editing | content-creation |
         multimedia-designer | all | styles | data | readme
```

Examples:
- `content(video-editing): add Premiere Pro to skills`
- `style(styles): change accent colour to #1a6b3c`
- `feat(ui-design): add UI Designer role page`
- `content(all): update email address`
- `data(resume.json): add Canva to content creation skills`

---

## Rules (always follow)

1. **No invented content** — only add facts from the resume source or confirmed by
   the user. If unsure, ask.
2. **Keep resume.json in sync** — whenever you edit an HTML file's content, mirror
   the change in `resume.json`.
3. **One logical change per commit** — don't bundle unrelated edits.
4. **Never touch `netlify.toml`** unless explicitly asked.
5. **Never make the repo public** — leave visibility settings alone.