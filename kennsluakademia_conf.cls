% File: kennsluakademia_conf.cls
% LaTeX class file for submissions to Kennsluakademía Conference

% Copyright (C) Helga Ingimundardóttir 2024
% Authors: Helga Ingimundardóttir
% Email: helgaingim@hi.is
% License: MIT License

% This file is part of the Kennsluakademia Conference submission template.
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:

% The above copyright notice and this permission notice shall be included in
% all copies or substantial portions of the Software.

% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
% THE SOFTWARE.

% Define basic LaTeX settings for this document class
\NeedsTeXFormat{LaTeX2e} % Ensure LaTeX2e is used
\ProvidesClass{kennsluakademia_conf}[2024/10/14 Class for Kennsluakademia Conference Submissions]

% Load base class article with specific options for formatting
\LoadClass[a4paper, 11pt, twocolumn]{article}

% Import necessary packages and set up geometry for the document
\RequirePackage[a4paper, left=1.5cm, right=1.5cm, top=4.5cm, bottom=3cm, columnsep=0.4in, headheight=3cm, headsep=.5cm]{geometry}
\RequirePackage{helvet, amsmath, bm, graphicx, tikz, titlesec, fancyhdr, hyperref, natbib}
\RequirePackage{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[icelandic]{babel}
\RequirePackage{xcolor}

% Set sans-serif as default font family
\renewcommand{\familydefault}{\sfdefault}

% Define custom colors for the document
\definecolor{lightblue}{HTML}{83BDBA}
\definecolor{darkblue}{HTML}{1C3E64}
\definecolor{lime}{HTML}{A6CE39}

% Define hyperlink settings (color of links, citations, etc.)
\hypersetup{
    colorlinks=true,
    linkcolor=darkblue,
    urlcolor=darkblue,
    citecolor=darkblue
}

% Section number formatting: Use Roman numerals for sections and subsections
\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\Roman{section}.\Alph{subsection}}

% Customize section titles to be in small caps
\titleformat{\section}{\normalfont\Large\scshape}{\thesection}{1em}{}
\titleformat{\subsection}{\normalfont\large\scshape}{\thesubsection}{1em}{}

% Customize the title of the references section
\renewcommand{\bibsection}{\section*{Tilvísanir}}

% Define storage for metadata like title, authors, and affiliations
\newcommand{\@keywords}{}
\newcommand{\@address}{}
\newcommand{\@conference}{}
\newcommand{\@authorlist}{}
\newcommand{\@affiliationslist}{}

% Define commands to store author names, affiliations, and other metadata
\def\author#1{\gdef\@authorlist{#1}} % Store authors
\def\correspondingauthor#1{\gdef\@corremail{#1}} % Store corresponding author's email
\def\affil#1#2{\g@addto@macro\@affiliationslist{{\small \raisebox{1.2ex}{#1} #2}\\}} % Append affiliations
\def\title#1{\gdef\@title{#1}} % Store title
\def\keywords#1{\gdef\@keywords{#1}} % Store keywords
\def\address#1{\gdef\@address{#1}} % Store address
\def\conference#1{\gdef\@conference{#1}} % Store conference info

% Default values for conference info, address, date, and keywords
\conference{Ráðstefna Kennsluakademíu opinberu háskólanna}
\address{<staðsetning ráðstefnu>}
\date{<dagssetning ráðstefnu>}
\keywords{<vantar að setja inn lykilorð>}

% Define maketitle to span both columns and include author and affiliation info
\def\maketitle{
    \twocolumn[{
        \begin{center}
            % Title in dark blue, large font
            {\Huge \bfseries \color{darkblue} \@title \par}
            \vskip 2em
            % Author list
            {\Large \@authorlist \par} % Use stored author list here
            \vskip 0.5em
            % Affiliation list
            {\footnotesize \@affiliationslist \par} % Display affiliations below author list
            \vskip 1.5em
        \end{center}
    }]    
    \vskip 1em    
    \noindent {\footnotesize\textbf{\textit{Lykilorð} -- \@keywords}} % Keywords section
}

% ORCID symbol and author ID commands using tikz for custom icons
\DeclareRobustCommand{\orcidicon}{%
\begin{tikzpicture}
  \draw[lime, fill=lime] (0,0) circle (0.16 cm) node[white] {\fontfamily{qag}\selectfont\tiny iD};
\end{tikzpicture}%
}
% Commands to handle individual authors, ORCIDs, and affiliations
\newcommand{\orcid}[1]{\href{https://orcid.org/#1}{\orcidicon}}
\newcommand{\autid}[2]{\raisebox{1.2ex}{\small#1}\orcid{#2}}
\newcommand{\adrid}[1]{\hspace*{-0.5ex}\raisebox{1.2ex}{\scalebox{0.7}{\rm #1}}~}

% Page style and headers with logo and conference info
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[C]{\thepage}
\renewcommand{\headrulewidth}{0pt}

% Left header with logo and customizable conference information
\fancyhead[L]{%
  \begin{minipage}{55mm}
    \includegraphics[width=\linewidth]{kennsluakademia.png} % Adjust logo file name as needed
  \end{minipage}%
  
  \vskip 6pt
  
  \color{lightblue} \@conference, \@address{} \@date % Display conference name, location, and date
}

% Optional callout using the theme colors
\newcommand{\callout}[2]{%
  \par\medskip
  \noindent
  \begingroup
  \setlength{\fboxsep}{8pt}%
  \setlength{\fboxrule}{0.8pt}%
  \fcolorbox{darkblue}{lightblue}{%
    \begin{minipage}{\dimexpr\linewidth-2\fboxsep-2\fboxrule\relax}
      \textbf{\color{darkblue}#1}\par
      \vspace{0.35em}
      #2
    \end{minipage}%
  }%
  \endgroup
  \par\medskip
}

% Add a hyperlink for DOI
\AtBeginDocument{%
  \providecommand{\doi}[1]{\href{https://doi.org/#1}{doi: #1}}%
  \renewcommand{\doi}[1]{\href{https://doi.org/#1}{doi: #1}}%
}