% mtu.thesis class file
%
% This class file is an independently developed class file for theses and
% dissertations at Michigan Technological University. The class file is designed
% to meet the bare minimum of style guidelines as specified in the Graduate
% School's "Guide to Preparing a Dissertation, Thesis, or Report at Michigan
% Technological University (2015)". It is the responsibility of the user to
% ensure that their dissertation, thesis, or report is in accordance with the
% requirements specified by the graduate school.
%
% The class is presented as an extention of the default report class, and is 
% designed in as non-invasive of a method possible in order to maintain the
% expectations and flexibility of that class.
% 
% Wherever possible, citations to the afformentioned guide are provided as a
% description for changes.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mtu.thesis}[2015/09/22 Michigan Technological University Thesis]

\RequirePackage{etoolbox}
\newtoggle{@proposal}
\DeclareOption{proposal}{\toggletrue{@proposal}}
\ProcessOptions\relax

%
\LoadClass[
	letterpaper,
	twoside,
	openright,
	12pt,
	notitlepage
]{report}

\RequirePackage[titles]{tocloft}
\RequirePackage{titlesec}
\newcommand{\hsp}{\hspace{20pt}}
\titleformat{\chapter}[hang]
{\Huge\scshape}{\thechapter\hsp}{0pt}{\Huge\scshape}
\titleformat{\section}[hang]
{\Large\scshape}{\thesection\hsp}{0pt}{\Large\scshape}
\titleformat{\subsection}[hang]
{\large\scshape}{\thesubsection\hsp}{0pt}{\large\scshape}

% typefaces [3.1]
\RequirePackage{helvet}

% margins [3.2], paper size [3.3]
\RequirePackage[
	showframe,
	letterpaper,
	includehead,
	includefoot,
	margin=1in,left=1.5in
]{geometry}

% page numbers [3.4]
\newcommand\frontmatter{\cleardoublepage\pagenumbering{roman}}
\newcommand\mainmatter{\cleardoublepage\pagenumbering{arabic}}

% double-sided printing: blank pages [3.5] 
\RequirePackage{emptypage}

% title page, approval page, dedication page [4.1, 4.2, 4.3, Appendix A]
\def\@title     {\rule[.3em]{5in}{1pt}}
\def\@author    {\rule[.3em]{1in}{1pt}}
\def\@date      {\the\year}
\def\@copyright {\rule[.3em]{1in}{1pt}}
\renewcommand{\copyright}[1]{\def\@copyright{#1}}

\def\@type      {\rule[.3em]{1in}{1pt}}
\def\@degree    {\rule[.3em]{1in}{1pt}}
\def\@prog      {\rule[.3em]{1in}{1pt}}
\newcommand{\dissertation}[2]{\def\@type{Dissertation}\def\@degree{#1}\def\@prog{#2}}
\newcommand{\thesis}[2]{\def\@type{Thesis}\def\@degree{#1}\def\@prog{#2}}
\newcommand{\report}[2]{\def\@type{Report}\def\@degree{#1}\def\@prog{#2}}

\def\@university{\rule{1in}{1pt}}
\def\@affiliation{\rule{1in}{1pt}}
\newcommand{\affiliation}[2][Michigan Technological University]
{\def\@university{#1}\def\@affiliation{#2}}

\renewcommand{\maketitle}{
\cleardoublepage
\begin{titlepage}
\nottoggle{@proposal}{
\begin{center}
\vspace*{\fill}\textsc\@title\\[1em]
\vspace*{\fill}By\\[1em]\@author\\[1em]
\vspace*{\fill}A \textsc\@type\\[1em]Submitted in partial fulfillment of the requirements for the degree of\\[1em]\textsc\@degree\\[1em]In \@prog\\[1em]
\vspace*{\fill}\textsc\@university\\[1em]\@date\\[1em]
\vspace*{\fill}\@copyright
\vspace*{\fill}
\end{center}
}{
\begin{center}
\vspace*{\fill}\textsc\@title\\[1em]
\vspace*{\fill}By\\[1em]\@author\\[1em]
\vspace*{\fill}A \textsc{Proposal}
\vspace*{\fill}
\end{center}
}
\end{titlepage}
\cleardoublepage
}

\newenvironment{approval}[1][1in]
{\cleardoublepage\thispagestyle{empty}
\nottoggle{@proposal}{
\noindent This \MakeLowercase{\@type} has been approved in partial fulfillment of the requirements for the Degree of \textsc{\@degree} in \@prog.\\[1em]%
\begin{flushright}\@affiliation\end{flushright}
}{}%
\vspace*{\fill}%
\halign\bgroup%
\begin{minipage}[b][#1]{0.3\textwidth}\vspace*{\fill}%
\parbox[t][\baselineskip]{\textwidth}{\raggedleft##\hspace*{3mm}}%
\end{minipage}&%
\begin{minipage}[b][#1]{0.7\textwidth}\vspace*{\fill}%
\hrulefill\\\parbox[t][\baselineskip]{\textwidth}{\raggedright\emph{##}}%
\end{minipage}\cr%
}
{\egroup\cleardoublepage}

\newenvironment{dedication}
{\cleardoublepage\thispagestyle{empty}%
\begin{minipage}[c][\textheight]{\textwidth}%
}
{\end{minipage}\cleardoublepage}

\newenvironment{acknowledgements}
{\cleardoublepage
\chapter*{Acknowlegements}
\addcontentsline{toc}{chapter}{Acknowlegments}
}
{\cleardoublepage}

% table of contents [4.4]
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\large\scshape}
\renewcommand{\cftchappagefont}{\large\scshape}
\RequirePackage[nottoc]{tocbibind}




% abstract [4.11]
\renewenvironment{abstract}{\chapter*{\abstractname}}{}
