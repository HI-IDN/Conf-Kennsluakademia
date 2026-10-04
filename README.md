# Kennsluakademía Conference Template
## Overview
A template for submissions to the Kennsluakademía Conference of Iceland's public universities. You write your abstract once, in [article.qmd](article.qmd), and [Quarto](https://quarto.org/) produces:

- **article.pdf**: the two-column conference PDF, typeset with the LaTeX class [kennsluakademia_conf.cls](kennsluakademia_conf.cls)
- **article.tex**: the LaTeX source behind that PDF (generated, see below)
- **article.html**: a web version, published at <https://hi-idn.github.io/Conf-Kennsluakademia/>

```
article.qmd  ──quarto render──►  article.tex  ──pdflatex──►  article.pdf
     │
     └──────────quarto render──►  article.html
```

> **Edit `article.qmd`, not `article.tex`.** Every render overwrites `article.tex`. It is kept in the repository so you can see, or send, the plain LaTeX version, and it still compiles on its own with pdflatex + bibtex.

## Quick Start
1. Install [Quarto](https://quarto.org/docs/get-started/) and a LaTeX distribution (`quarto install tinytex` is enough).
2. Edit the front matter and text in [article.qmd](article.qmd).
3. Render everything:

   ```bash
   quarto render article.qmd
   ```

   To work on the web version with live reload, use `quarto preview article.qmd --to haskoli-islands-html`.
4. Commit and push. GitHub Actions renders again and publishes the web version (with the PDF) to GitHub Pages. It does not commit anything back, so render locally if you want the `article.tex` and `article.pdf` in the repository to be up to date.

## Writing article.qmd
Metadata goes in the YAML front matter at the top. Each field maps onto a command in the class:

```yaml
title: Titill greinar                  # \title
conference: Ráðstefna Kennsluakademíu opinberu háskólanna   # \conference
address: Veröld Háskóla Íslands        # \address
date: 2026-11-20                       # \date, shown as "20 nóvember, 2026"
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

References are formatted with plainnat in the PDF and with APA ([quarto/apa.csl](quarto/apa.csl)) on the web.

## What controls what
| File | Controls |
|---|---|
| [kennsluakademia_conf.cls](kennsluakademia_conf.cls) | PDF look: layout, header with logo, fonts, colours, section style |
| [quarto/kennsluakademia-template.tex](quarto/kennsluakademia-template.tex) | How the front matter is turned into `article.tex` |
| [quarto/title-block.html](quarto/title-block.html), [quarto/kennsluakademia.css](quarto/kennsluakademia.css) | Web look: pinned logo, conference line and title; authors, ORCID, keywords, section numbering |
| [quarto/kennsluakademia.lua](quarto/kennsluakademia.lua) | The `.ka-callout` box in both formats |
| `_extensions/hi-idn/haskoli-islands/` | Base HÍ web theme (Jost font, colours, table of contents) |
| [.github/workflows/publish.yml](.github/workflows/publish.yml) | Build and publish to GitHub Pages |

## Using the class without Quarto
The class also works on its own in any LaTeX document; `article.tex` is a complete example.

```latex
\documentclass{kennsluakademia_conf}

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
