# Kennsluakademía Conference Template
## Overview
A template for submissions to the Kennsluakademía Conference of Iceland's public universities. You write your abstract once, in [article.qmd](article.qmd), and [Quarto](https://quarto.org/) produces:

- **article.pdf**: the two-column conference PDF, typeset with the LaTeX class [kennsluakademia_conf.cls](template/latex/kennsluakademia_conf.cls)
- **article.html**: a web version, published at <https://hi-idn.github.io/Conf-Kennsluakademia/>

`article.pdf` and `article.tex` are build output: they are not stored in the repository. GitHub Actions renders them on every push and publishes the PDF next to the web version, so you only need to commit `article.qmd`. Render locally to proof the PDF before you submit it.

```
article.qmd  ──quarto render──►  article.tex  ──pdflatex──►  article.pdf
     │
     └──────────quarto render──►  article.html
```

> **Edit `article.qmd`, not `article.tex`.** Every render overwrites `article.tex`. The generated `article.tex` still compiles on its own with pdflatex + bibtex if you need to send the plain LaTeX version.

## LaTeX only
The plain LaTeX version of this template (no Quarto) is also available as an [Overleaf template](https://www.overleaf.com/latex/templates/radstefna-kennsluakademiu-opinberu-haskolanna/jkkpnbtxyfzv), and as the [`latex-v1` release](https://github.com/HI-IDN/Conf-Kennsluakademia/releases/tag/latex-v1) of this repository. The class [`kennsluakademia_conf.cls`](template/latex/kennsluakademia_conf.cls) gives a two-column layout with conference information, author affiliations with ORCID, and keywords.

## Quick Start
1. Install [Quarto](https://quarto.org/docs/get-started/) and a LaTeX distribution (`quarto install tinytex` is enough).
2. Edit the front matter and text in [article.qmd](article.qmd).
3. Render everything:

   ```bash
   quarto render article.qmd
   ```

   To work on the web version with live reload, use `quarto preview article.qmd --to haskoli-islands-html`.
4. Commit and push. GitHub Actions renders again and publishes the web version (with the PDF) to GitHub Pages.

## Writing article.qmd
Metadata goes in the YAML front matter at the top. Each field maps onto a command in the class:

```yaml
title: Titill greinar                  # \title
conference: Ráðstefna Kennsluakademíu opinberu háskólanna   # \conference
address: Veröld Háskóla Íslands        # \address
conference-date: 20. nóvember 2026      # \date, typed by hand
keywords:                              # \keywords
  - Lykilorð 1
  - lykilorð 2
author:                                # \author with \autid{affiliation}{ORCID}
  - name: Fyrsti höfundur
    orcid: 0000-0000-0000-0000
    affiliations:
      - ref: aff1
affiliations:                          # \affil, numbered automatically
  - id: aff1
    department: Deild
    name: háskóli
bibliography: references.bib
```

The body is Markdown: `# Inngangur` becomes a numbered section (I, II, …), citations are written `@felten2013` or `[@felten2013]`, and `nocite: "@*"` lists every entry in `references.bib`. A box in the conference colours (`\callout` in the class) is written as:

```markdown
::: {.ka-callout title="Fyrirsögn"}
Texti.
:::
```

References are formatted with plainnat in the PDF and with APA ([template/quarto/apa.csl](template/quarto/apa.csl)) on the web.

## Logos
The Kennsluakademía logos are in [template/quarto/](template/quarto/) as SVG, free to use in slides and posters:

| Short | Long | Favicon |
|---|---|---|
| <img src="template/quarto/logo-short.svg" height="60"> | <img src="template/quarto/logo-long.svg" height="60"> | <img src="template/quarto/favicon.svg" height="60"> |
| [logo-short.svg](template/quarto/logo-short.svg) – "KENNSLU AKADEMÍA" | [logo-long.svg](template/quarto/logo-long.svg) – adds "OPINBERU HÁSKÓLANNA" | [favicon.svg](template/quarto/favicon.svg) |

## What controls what
| File | Controls |
|---|---|
| [kennsluakademia_conf.cls](template/latex/kennsluakademia_conf.cls) | PDF look: layout, header with logo, fonts, colours, section style |
| [template/quarto/kennsluakademia-template.tex](template/quarto/kennsluakademia-template.tex) | How the front matter is turned into `article.tex` |
| [template/quarto/logo-short.svg](template/quarto/logo-short.svg), [template/quarto/logo-long.svg](template/quarto/logo-long.svg), [template/quarto/favicon.svg](template/quarto/favicon.svg), [kennsluakademia.pdf](kennsluakademia.pdf) | The logo as SVG for the web (and favicon). `kennsluakademia.pdf` is the same logo as a vector PDF for LaTeX; remake it from the SVG with `inkscape template/quarto/logo-short.svg --export-type=pdf --export-filename=kennsluakademia.pdf` |
| [template/quarto/title-block.html](template/quarto/title-block.html), [template/quarto/kennsluakademia.css](template/quarto/kennsluakademia.css) | Web look: pinned logo, conference line and title; authors, ORCID, keywords, section numbering |
| [template/quarto/kennsluakademia.lua](template/quarto/kennsluakademia.lua) | The `.ka-callout` box in both formats |
| `_extensions/hi-idn/haskoli-islands/` | Base HÍ web theme (Jost font, colours, table of contents) |
| [.github/workflows/publish.yml](.github/workflows/publish.yml) | Build and publish to GitHub Pages |

## Placeholders and extras
- The header line takes `conference`, `address` and `conference-date` from the front matter. Type the venue and the date by hand, e.g. `address: Saga, Háskóli Íslands` and `conference-date: 20. nóvember 2026`; the placeholders `<háskólabygging>` and `<dags>` show where.
- The commented block after the front matter is an optional note for the top of the web page (venue, session, links to the published paper and slides). The `other-links` in the front matter fill "Tengt efni" in the sidebar; replace the placeholder links.
- The "Tilvitnun" section at the end shows how to cite the paper, with a BibTeX entry. Replace the placeholders there too.
- Slides: the [quarto-hi](https://github.com/tungufoss/quarto-hi) template gives you RevealJS slides in the HÍ look that match this page. Link them from `other-links` as `slides/`.

## Using the class without Quarto
The class also works on its own in any LaTeX document; `article.tex` is a complete example.

```latex
\documentclass{template/latex/kennsluakademia_conf}

\title{Titill greinar}
\author{%
First Author\autid{1}{0000-0000-0000-0000},
A. N. Other\autid{2}{0000-0000-0000-0000},
Third Author\autid{2,3}{0000-0000-0000-0000}%
}
\affil{1}{Department, University}
\affil{2}{Department, Institution}
\affil{3}{Another Department, Different Institution}

\keywords{Lykilorð 1, lykilorð 2, lykilorð 3}
\address{Veröld Háskóla Íslands}
\date{20 nóvember, 2026}

\begin{document}
\maketitle
...
\end{document}
```

- `\title{}`, `\keywords{}`, `\address{}` (conference location), `\date{}` (conference date), `\conference{}` (overrides the default conference name)
- `\author{}` with `\autid{affiliation number}{ORCID}` after each name; `\affil{number}{text}` for each affiliation
- `\maketitle` prints the title, authors, affiliations and keywords
- `\callout{title}{text}` draws a box in the conference colours

## License
This template is provided under the MIT License. See [LICENCE](LICENCE) for more details.

## Contact
For questions, issues, or contributions, please contact: Helga Ingimundardóttir
Email: [helgaingim@hi.is](mailto:helgaingim@hi.is).
