# Kennsluakademía Conference LaTeX Class
## Overview
This repository contains the LaTeX class file kennsluakademia_conf.cls, designed for formatting submissions to the Kennsluakademía Conference of Iceland's public universities. The class file provides structure for creating academic papers in Icelandic, with features like custom author commands, ORCID integration, and support for conference-specific metadata such as keywords, affiliations, and logos.

## Features
- **Two-column layout** with a full-width title and author block.
- **Custom conference metadata**: Easily set conference name, location, and date.
- **ORCID integration**: Include ORCID IDs for each author.
- **Custom affiliations**: Support for adding multiple author affiliations.
- **MIT License**: Free and open-source.
## Quick Start
### 1. Using the Class
To use this LaTeX class in your project, add the following to the top of your `.tex` document:

```latex
\documentclass{kennsluakademia_conf}
```
### 2. Specifying Metadata
You can specify the title, authors, conference details, and keywords directly in the preamble of your `.tex` file:
```latex
\title{Titill greinar}
\author{%
First Author\autid{1}{0000-0000-0000-0000}, 
A. N. Other\autid{2}{0000-0000-0000-0000}, 
Third Author\autid{2,3}{0000-0000-0000-0000}, 
Fourth Author\autid{3}{0000-0000-0000-0000}%
}
\affil{1}{Department, University}
\affil{2}{Department, Institution}
\affil{3}{Another Department, Different Institution}

\keywords{Lykilorð 1, lykilorð 2, lykilorð 3}
\address{Veröld Háskóla Íslands}
\date{22 nóvember, 2024}
```

### 3. Custom Commands
- `\title{}`: Set the title of the paper.
- `\author{}`: Define authors with optional ORCID and corresponding author email.
- `\affil{}`: Specify affiliations. Each author’s affiliation is numbered.
- `\keywords{}`: Define the keywords for the paper.
- `\address{}`: Set the location of the conference.
- `\date{}`: Define the date of the conference.
- `\conference{}`: Modify the default conference name.

### 4. ORCID Integration
To include ORCID IDs for each author, use the `\autid{author number}{ORCID}` command within the `\author{}` declaration. For example:
```latex
First Author\autid{1}{0000-0000-0000-0000}
```
### 5. Generating the Title
The title is automatically generated when you call `\maketitle` in your document, which will print the title, author list, affiliations, and keywords.

### 6. Example Document
A minimal example of a `.tex` file using this class is provided in [main.tex](main.tex) and a rendered version is in [main.pdf](main.pdf).

## Quarto version (PDF + web)
[article.qmd](article.qmd) holds the same content as `main.tex` in Markdown. One command renders both:

```bash
quarto render article.qmd
```

- **PDF** (`article.pdf`): goes through `kennsluakademia_conf.cls` via [quarto/kennsluakademia-template.tex](quarto/kennsluakademia-template.tex), so it looks the same as `main.pdf` (pdflatex + natbib/plainnat).
- **Web** (`article.html`): the HÍ Quarto theme (`_extensions/tungufoss/haskoli-islands`, copied from quarto-hi) plus the conference look: logo and conference line, dark-blue title, ORCID icons, numbered affiliations, keywords, Roman-numeral small-caps sections. See [quarto/title-block.html](quarto/title-block.html) and [quarto/kennsluakademia.css](quarto/kennsluakademia.css). References use APA (`quarto/apa.csl`).

Metadata maps onto the class commands: `title`, `author` (`name`, `orcid`, `affiliations: [ref: ...]`), `affiliations` (`id`, `department`, `name`), `keywords`, `address`, `date`, `conference`. A box in the conference colours (`\callout`) is written as:

```markdown
::: {.ka-callout title="Fyrirsögn"}
Texti.
:::
```

## Customization
You can modify the header, footer, colors, and other layout options by editing the [kennsluakademia_conf.cls](kennsluakademia_conf.cls) file.

- **Header**: The header includes a conference logo and information, which you can adjust by modifying the `fancyhdr` section.
- **Fonts**: The class defaults to sans-serif (`helvet` package), but this can be changed by loading a different font package.
- **Section Formatting**: Section titles are displayed in small caps with Roman numerals for numbering. Modify the \titleformat{} commands to customize this.

## License
This class is provided under the MIT License. See [LICENSE](LICENSE) for more details.

## Contact
For questions, issues, or contributions, please contact: Helga Ingimundardóttir
Email: [helgaingim@hi.is](emailto:helgaingim@hi.is).