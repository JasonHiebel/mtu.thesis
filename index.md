---
layout: default
---

This package provides an unofficial latex class for constructing dissertations, theses, and reports at Michigan Technological University. The class is an extension of the standard `report` class which provides additional commands and environments to layout various required front-matter elements, including the title page and committee page, as specified by [graduate school policies](https://www.mtu.edu/gradschool/policies-procedures/theses-dissertations/pdfs/guide.pdf).

While every attempt has been made to ensure that the class is compliant with these requirements, this package is provided without guarantee that the graduate school will accept a document written using `mtu.thesis`. While this class file deals with appropriate formatting, it does not ensure that any and all required elements are provided, or that elements are provided in the correct order. Please consult the guide for this information.

# Front Matter
Writing a dissertation, thesis, or report using `mtu.thesis` will have little difference from writing a document using the `report` class. The primary exception will be the front-matter, which includes a specific title page format, and an approval page. The following lists the various front-matter elements and their usage. Note that, at this time, there is no direct support for definition or abbreviation lists, although existing methods compatible with the `report` class should work.

## Document Information
In addition to providing a title, author, and date, a user must also provide copyright, degree, and affiliation information. This information is used to format various front matter pages.

A sample information block for a dissertation is as follows.
```
\title
{Sample Document}
\author
{Author}
\date
{2018}
\copyright
{\raisebox{1pt}{\small\textcopyright} 2018 Author}
\dissertation
{Your Degree i.e. Doctor of Philosophy}{Degree Program}
\affiliation
{School or Department}
```
(note that `\textcopyright` requires the `textcomp` package)

For a computer science Ph.D student, we might have the following block.
```
\title
{Developing Dissertations in LaTeX}
\author
{Jason Hiebel}
\date
{2018}
\copyright
{\raisebox{1pt}{\small\textcopyright} 2018 Jason Hiebel}
\dissertation
{Doctor of Philosophy}{Computer Science}
\affiliation
{Department of Computer Science}
```

Masters students alternatively will be writing either theses or reports. In those cases, they will provide the degree and degree program using the `\thesis` or `\report` commands instead.

## Title Page
The title page is specified using `\maketitle`, in the same way as the `report` class.

## Approval Page
The approval page is specified using the `approval` environment, which specifies a table of advisor and committee member names and their associated titles. For example:
```
\begin{approval}
Dissertation Advisor & My Advisor           \cr
    Committee Member & A Committee Member   \cr
    Committee Member & A Committee Member   \cr
    Committee Member & A Committee Member   \cr
    Department Chair & The Department Chair \cr
\end{approval}
```

## Dedication (Optional)
A dedication may optionally be specified using the `dedication` environment.

## Author Contribution Statement
This is currently provided using the `preface` environment. Note that in prior iterations of the document, this section was named a preface and fulfilled multiple roles.

## Acknowledgements (Optional)
Acknowledgements may optionally be specified using the `acknowledgements` environment.
```

## Table of Contents
The table of contents is specified using `\tableofcontents`, in the same way as the `report` class.

## List of Figures, Tables (Optional)
The list of figures and list of tables may optionally be specified using the `\listoffigures` and `\listoftables` commands.

# Document Structure
Page numbering is controlled appropriately using the `\frontmatter`, `\mainmatter`, and `\appendix` commands. The `\frontmatter` command should immediately follow the beginning of the document. The `\mainmatter` command should immediately follow the abstract, before the start of the first chapter. The `\appendix` command should follow the main document, but precede any appendix chapters.

Additionally, the `\appendix` command will change chapter numbering from numbers to letters.
