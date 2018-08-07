\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2018/01/01 v3.391 University of Athens, DI Thesis Class]
\LoadClass[a4paper,12pt]{report}

%% This file has three sections:
%% line  11: Package Declarations and configurations
%% line 150: Formatting of Header, Footer, Section Titles, ToC, LoF, LoT
%% line 260: Formatting of the first 4 Titlepages and next 2 Abstract pages


%% Page Margins
%
\RequirePackage{geometry}
\geometry{
  a4paper,
  head=12.5mm,
  foot=12.5mm,
  bindingoffset=0cm,
  left=25mm,
  top=32.5mm,
  right=20mm,
  bottom=32.5mm,
%  marginpar=25mm
}

%% Fonts
%
\RequirePackage{fontspec}
\setmainfont{Arial}
% \setsansfont[Scale=MatchLowercase]{DejaVu Sans}
\setmonofont[Scale=1]{DejaVu Sans Mono}

%% Mathematics
%
\RequirePackage{amsmath}
\RequirePackage{unicode-math} %provides \setmathfont{Asana Math}
\setmathfont{Asana Math}

%% Unicode text (XeLaTeX only)
%
\RequirePackage{xltxtra}
\RequirePackage{xunicode}

%% Graphics
%
\RequirePackage{graphicx}
\graphicspath{{./figures/}{./figures/build/}}
%  Important:
%  Notice that SVG is not listed in the declared graphics extensions.
%  This is becaus eps is prefered over svg and all svg images are converted to
%  eps using Inkscape.
\DeclareGraphicsExtensions{.eps,.eps.gz,.png,.jpg}

%% Colors
%
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}

%% Todonotes
%
\RequirePackage[
  bordercolor=LightSteelBlue,
  linecolor=LightSteelBlue,
  backgroundcolor=AliceBlue,
  textsize=footnotesize,
]{todonotes}

%% Hyperlinks
% example: \href{http://twitter.com/home}{Twitter}
%
\RequirePackage{hyperref}

%% Format paragraph spacing
%
\RequirePackage{titlesec}
% spacing: how to read {12pt plus 4pt minus 2pt}
%           12pt is what we would like the spacing to be
%           plus 4pt means that TeX can stretch it by at most 4pt
%           minus 2pt means that TeX can shrink it by at most 2pt
%       This is one example of the concept of, 'glue', in TeX
\titlespacing\paragraph{0pt}{2pt plus 2pt minus 1pt}{12pt}

%% Sloppy justification.
%  Makes the text justified but dont expect optimal word spacing
%
\sloppy 

% Set paragraph spacing
\setlength{\parskip}{6pt}

% Set paragraph indent
\setlength{\parindent}{0em}

%% Embed pdf documents
%
\RequirePackage[final]{pdfpages}

%% Code Highlighting
%
\RequirePackage[outputdir=build]{minted}
\setminted[tex]{style=tango}

%% Appendix
%
\RequirePackage{appendix}

%% Cite
%
\RequirePackage{cite}

%% Figure and Table captions
%
\RequirePackage[
  font=footnotesize,
  labelfont=bf,
  textfont=bf,
  tableposition=top,
  centerlast
]{caption}

%% Format Headers and footers
%
\RequirePackage{fancyhdr}

%% Inline lists
%
\RequirePackage{paralist}

%% Lorem ipsum generated text
%
\RequirePackage{blindtext}
\RequirePackage{lipsum}

%% Plots
%
\RequirePackage{pgfplots}
\pgfplotsset{compat=1.13}

%% Comment out blocks of latex text
%
\RequirePackage{comment}

%% Format sectional headings
%
\RequirePackage{sectsty}

%% Formatting ToC
%
\RequirePackage{tocloft}


%%
%% Formatting of Header, Footer, Section Titles, ToC, LoF, LoT
%%

%% Configure header and footer
%
\pagestyle{fancy}
\fancyhf{}
\lfoot{{\scriptsize \AuthorFooter}}
\lhead{{\scriptsize \Header}}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\rfoot{\scriptsize \thepage}
\fancypagestyle{plain} {
  \lfoot{{\scriptsize \AuthorFooter}}
  \lhead{{\scriptsize \Header}}
}

\newif\ifappendixstarted
\appendixstartedfalse

\def\@makechapterhead#1{
  {\parindent \z@ \centering
    \ifappendixstarted
      {\large \bfseries \MakeUppercase{\@chapapp} \space \thechapter. \MakeUppercase{#1}}
    \else
      {\large \bfseries \thechapter. \uppercase{#1}}
    \fi
    \par\nobreak
    \vskip 20\p@
  }
}

\sectionfont{\fontsize{13}{15}\selectfont}
\subsectionfont{\fontsize{12}{13}\selectfont}
\renewcommand{\cfttoctitlefont}{\hspace*{\fill}\large\bfseries\MakeUppercase}
\renewcommand{\cftaftertoctitle}{\hspace*{\fill}}
\renewcommand{\cftlottitlefont}{\hspace*{\fill}\large\bfseries\MakeUppercase}
\renewcommand{\cftafterlottitle}{\hspace*{\fill}}
\renewcommand{\cftloftitlefont}{\hspace*{\fill}\large\bfseries\MakeUppercase}
\renewcommand{\cftafterloftitle}{\hspace*{\fill}}
\renewcommand{\cftchapaftersnum}{.\MakeUppercase}
\renewcommand{\cftfigpresnum}{Figure }
\renewcommand{\cftfigaftersnum}{:}
\renewcommand{\cfttabpresnum}{Table}
\renewcommand{\cfttabaftersnum}{:}

%% This is Bad.
%% It makes chapter headings uppercase
%
% Copy \l@chapter macro from
% http://mirror.utexas.edu/ctan/macros/latex/contrib/tocloft/tocloft.dtx
% just to add the \MakeUppercase directive
%
\renewcommand*{\l@chapter}[2]{
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}
    \vskip \cftbeforechapskip
    {\leftskip \cftchapindent\relax
     \rightskip \@tocrmarg
     \parfillskip -\rightskip
     \parindent \cftchapindent\relax\@afterindenttrue
     \interlinepenalty\@M
     \leavevmode
     \@tempdima \cftchapnumwidth\relax
     \let\@cftbsnum \cftchappresnum
     \let\@cftasnum \cftchapaftersnum
     \let\@cftasnumb \cftchapaftersnumb
     \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
     {\cftchapfont \MakeUppercase{#1}}\nobreak
     \cftchapfillnum{#2}}
  \fi
}

\renewcommand{\cftsecfont}{\bfseries}

\cftsetindents{chapter}{0em}{2.4em}
\cftsetindents{section}{0em}{2.4em}
\cftsetindents{subsection}{1em}{3.1em}
\cftsetindents{table}{0em}{4em}
\cftsetindents{figure}{0em}{5em}
\setlength{\cftparskip}{0.4em}
\setlength{\cftbeforechapskip}{2em}
\setlength{\cftbeforesecskip}{0.3em}

\tocloftpagestyle{empty}

\renewcommand{\cftbeforetoctitleskip}{0em}
\renewcommand{\cftbeforeloftitleskip}{0em}
\renewcommand{\cftbeforelottitleskip}{0em}

% Continuous figure and table numbering
\RequirePackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}

% https://tex.stackexchange.com/questions/93859
\let\oldthebibliography\thebibliography
\let\endoldthebibliography\endthebibliography
\renewenvironment{thebibliography}[1]{
  \begin{oldthebibliography}{#1}
    \setlength{\itemsep}{1pt}
    \setlength{\parskip}{1pt}
    \fontsize{10}{10.6}\selectfont
}
{
  \end{oldthebibliography}
}

% This is not good but it works
\renewcommand\bibname{\large\centerline{REFERENCES}\global\def\bibname{REFERENCES}}


%%
%%  Formatting of the first 4 Titlepages
%%  and next 2 Abstract pages
%%

\renewcommand{\title}[2]{
  \gdef \Title{#1}
  \gdef \GreekTitle{#2}
}

\renewcommand{\author}[4]{
  \gdef\Author{#1}
  \gdef\GreekAuthor{#2}
  \gdef\RegistryNumber{#3}
  \gdef\AuthorFooter{#4}
}

\renewcommand{\date}[3]{
  \gdef\Date{#1}
  \gdef\GreekDate{#2}
  \gdef\GreekDateWithoutAccent{#3}
}

\newcommand{\header}[1]{
  \gdef\Header{#1}
}

\newcommand{\supervisor}[4]{
  \gdef\Supervisor{#1}
  \gdef\SupervisorTitle{#2}
  \gdef\GreekSupervisor{#3}
  \gdef\GreekSupervisorTitle{#4}
}

\newcommand{\commitee}[8]{
  \gdef\CommiteeA{#1}
  \gdef\CommiteeATitle{#2}
  \gdef\GreekCommiteeA{#3}
  \gdef\GreekCommiteeATitle{#4}
  \gdef\CommiteeB{#5}
  \gdef\CommiteeBTitle{#6}
  \gdef\GreekCommiteeB{#7}
  \gdef\GreekCommiteeBTitle{#8}
}

\newcommand{\subject}[2]{
  \gdef\Subject{#1}
  \gdef\GreekSubject{#2}
}

\newcommand{\keywords}[2]{
  \gdef\Keywords{#1}
  \gdef\GreekKeywords{#2}
}

\renewcommand{\abstract}[2]{
  \gdef \Abstract{#1}
  \gdef \GreekAbstract{#2}
}

\renewcommand{\maketitle}{

  \begin{titlepage}
    \vspace*{-20mm}
    \begin{center}
      \includegraphics[height=3.5cm]{figures/logo}
    \end{center}
    \begin{center}
      {\bf \large NATIONAL AND KAPODISTRIAN UNIVERSITY OF ATHENS}
      \vskip 5mm
      {\bf SCHOOL OF SCIENCES \\
        DEPARTMENT OF INFORMATICS AND TELECOMMUNICATIONS
      }
      \vskip 5mm
      {\bf POSTGRADUATE STUDIES}
      \vskip 20mm
      {\bf MASTER THESIS}
      \vskip 7mm
      {\bf \fontsize{16pt}{20pt}\selectfont \Title \par}
      \vskip 10mm
      {\bf \Author}
      \vskip 50mm
      {\bf Supervisor:} {\bf \Supervisor }, \SupervisorTitle
      \vfill
      \vskip 15mm
      {\bf ATHENS}
      \vskip 5mm
      {\bf \MakeUppercase \Date}
      \vskip 20mm
    \end{center}
  \end{titlepage}

  \begin{titlepage}
    \vspace*{-20mm}
    \begin{center}
      \includegraphics[height=3.5cm]{figures/logo}
    \end{center}
    \begin{center}
      {\bf \large ΕΘΝΙΚΟ ΚΑΙ ΚΑΠΟΔΙΣΤΡΙΑΚΟ ΠΑΝΕΠΙΣΤΗΜΙΟ ΑΘΗΝΩΝ}
      \vskip 5mm
      {\bf ΣΧΟΛΗ ΘΕΤΙΚΩΝ ΕΠΙΣΤΗΜΩΝ \\ ΤΜΗΜΑ ΠΛΗΡΟΦΟΡΙΚΗΣ ΚΑΙ ΤΗΛΕΠΙΚΟΙΝΩΝΙΩΝ}
      \vskip 5mm
      {\bf ΠΡΟΓΡΑΜΜΑ ΜΕΤΑΠΤΥΧΙΑΚΩΝ ΣΠΟΥΔΩΝ}
      \vskip 20mm
      {\bf ΔΙΠΛΩΜΑΤΙΚΗ ΕΡΓΑΣΙΑ}
      \vskip 7mm
      {\bf \fontsize{16pt}{22pt}\selectfont \GreekTitle \par}
      \vskip 10mm
      {\bf \GreekAuthor}
      \vskip 50mm
      {\bf ΕΠΙΒΛΕΠΩΝ:} {\bf \GreekSupervisor }, \GreekSupervisorTitle \\
      \vfill
      \vskip 15mm
      {\bf ΑΘΗΝΑ}
      \vskip 5mm
      {\bf \MakeUppercase \GreekDateWithoutAccent}
      \vskip 20mm
    \end{center}
  \end{titlepage}

  \begin{titlepage}
      \vspace*{-10mm}
      \begin{center}
        {\bf MASTER THESIS}
        \vskip 10mm
        \Title
        \vskip 10mm
        {\bf \Author}\par
        {\bf R.N.:} \RegistryNumber
        \vskip 40mm
        {\bf Supervisor:} {\bf \Supervisor }, \SupervisorTitle
        \vskip 50mm
        \begin{tabular}{ll}
          {\bf THESIS COMMITEE:}
            & {\bf \CommiteeA}, \CommiteeATitle \\
            & {\bf \CommiteeB}, \CommiteeBTitle
        \end{tabular}
        \vfill
        {\Date}
      \end{center}
  \end{titlepage}

  \begin{titlepage}
      \vspace*{-10mm}
      \begin{center}
        {\bf ΔΙΠΛΩΜΑΤΙΚΗ ΕΡΓΑΣΙΑ}
        \vskip 10mm
        \Title
        \vskip 10mm
        {\bf \GreekAuthor}\par
        {\bf Α.Μ.:} \RegistryNumber
        \vskip 40mm
        {\bf ΕΠΙΒΛΕΠΩΝ:} {\bf \GreekSupervisor }, \GreekSupervisorTitle
        \vskip 50mm
        \begin{tabular}{ll}
          {\bf ΕΞΕΤΑΣΤΙΚΗ ΕΠΙΤΡΟΠΗ:}
            & {\bf \GreekCommiteeA}, \GreekCommiteeATitle \\
            & {\bf \GreekCommiteeB}, \GreekCommiteeBTitle
        \end{tabular}
        \vfill
        {\GreekDate}
      \end{center}
  \end{titlepage}

  \begin{titlepage}
    \begin{center}
      {\bf \fontsize{14pt}{14pt}\selectfont ABSTRACT \par}
    \end{center}
    \vspace*{10mm}
    \Abstract
    \vfill
    \begin{tabular}{p{5cm}p{10cm}}
      {\bf SUBJECT AREA:} & \Subject \\[3mm]
      {\bf KEYWORDS:}     & \Keywords
    \end{tabular}
  \end{titlepage}

  \begin{titlepage}
    \begin{center}
      {\bf \fontsize{14pt}{14pt}\selectfont ΠΕΡΙΛΗΨΗ \par}
    \end{center}
    \vspace*{10mm}
    \GreekAbstract
    \vfill
    \begin{tabular}{p{5cm}p{10cm}}
      {\bf ΘΕΜΑΤΙΚΗ ΠΕΡΙΟΧΗ:} & \GreekSubject \\[3mm]
      {\bf ΛΕΞΕΙΣ ΚΛΕΙΔΙΑ:}   & \GreekKeywords
    \end{tabular}
  \end{titlepage}

  \setcounter{page}{7}

  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\supervisor\relax
  \global\let\subject\relax
  \global\let\keywords\relax
  \global\let\maketitle\relax
  \global\let\abstract\relax
  \global\let\header\relax
} % end maketitle


