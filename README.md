# mtu.thesis #
*core document class definitions for Michigan Technological University theses and dissertations*

## Motivation ##

The goal of this class is to represent the structure and formatting of
dissertations, theses, and reports at Michigan Technological University, as
required by the guidelines put forth by the Graduate School, in a terse, 
unobtrusive, and idiomatic fashion. This is a no-nonsense approach geared towards people who are somewhat familiar with basic latex development or who are interested in learning. 

*Please note: while I have taken strides to meet as many formatting guidelines
as are reasonably possible to enforce in an idiomatic fashion, I make no
guarantees that the use of this class conforms to the requirements for
publication as a dissertation, report, or thesis at Michigan Technological
University*

## Implementation ##

The mtu.thesis class is a direct extension to the report class; any features available for the report class are available to this thesis class. Additionally, this class provides a modified title page, as well as new commands and environments for an (optional) preface, approvals page, and dedication page as perscribed by the guidelines document for dissertations, theses, and reports at Michigan Tech. Formatting details have been applied to all the document
parts prescribed in the guidelines to ensure a uniform look-and-feel.

### Document Information ###

The following commands set the relevant document information, as an extension
of the typical `\title`, `\author`, and `\date` commands for a typical document:
 - `\copyright{"copyright tag"}` Incorporates a copyright tag.
 - `\dissertation{"degree"}{"program"}` Specifies the document type (dissertation, report, thesis), type of degree and degree program as defined by section 4.1 of the guideline document regarding the title and approval pages. Replace `dissertation` with `report` or `thesis` as necessary.
 - `\affiliation{"school or department"}` Specifies the issuing affiliation, typically either a school (e.g. School of Engineering) or a specific department (e.g. Department of Computer Science).

These six commands specify information which is distributed across the title and approval pages, and thus we require the information to be specified up-front as general document information.

### Front Matter ###

In document order, the following commands and environments are available for the purposes of constructing the front matter as specified by the guidelines:

 1. `\maketitle` Make the title page (section 4.01, appendix A) guidelines
 2. `\begin{approval} ... \end{approval}` Make the approval page (section 4.02, appendix A). Signatories are specified in a tabular form
    ```
    \begin{approval}
        Dissertation Advisor & My Advisor \cr
        Committee Member & A Committee Member \cr
        Committee Member & A Committee Member \cr
        Committee Member & A Committee Member \cr
        Department Chair & The Department Chair \cr
    \end{approval}
    ```
 3. `\begin{dedication} ... \end{dedication}` Make the dedication page (section 4.03), optionally. Content is limited to a single page.
 4. `\tableofcontents`, `\listoffigures`, `\listoftables` Make content lists (sections 4.04-06), as necessary.
 5. `\begin{preface} ... \end{preface}` Make the preface (section 4.07), when necessary. This environment is in a similar vein to the abstract environment.
 6. `\begin{acknowledgements} ... \end{acknowledgements}` Make the acknowledgements (section 4.08), optionally. This environment is in a similar vein to the abstract environment
 7. `\begin{abstract} ... \end{abstract}` Make the abstract (section 4.11).

Currently there is no support for a list of definitions (section 4.09) or a list of abbreviations (section 4.10). These can be added at a later point when a use-case arises.

### Configuration ###

By default, the pages are constructed for a two-sided document (as if it were binded). The `oneside` class option will replace the unequal two-sided margins (even 1in, odd 1.5in) with equal margins (left 1.25in, right 1.25in). The two-sided margins were chosen according to the guidelines document, and the one-sided margins were chosen to maintain an equal text area with the two-sided version of the document.

Chapters will always start on an odd page in the two-sided document, in accordance with the guidelines. In the one-sided document, chapters will open on any page. The title, approval, and dedication pages will display on an odd page regardless of the one-sided or two-sided settings.

For initial drafts, the `draft` option removes some of the clutter in the front matter that is unnecessary before the published release. The removed front matter sections include the approval, dedication, acknowledgements pages as well as the preface which account for the sentimental and logistic portions of the document.

Finally, the `showframe` options should help debugging any layout problems.

The main matter, references, and appendixes use default report class constructs. There is no added material for these sections as they are well supported features of latex by default, although they have been styled appropriately to give a consistant look-and-feel.

### Styling ###

The document is styled around the concept of soft-capitals. The title and approval pages, along with headers, are styled with soft-caps and as such the dilligent user should consider using soft-caps for other structural formatting choices as well. This might include any header rows and or columns for tables, but probably shouldn't include minor points such as emphasis (`\emph`).

The document is by default numbered with arabic numerals, unless the user provides the `\frontmatter` and `\mainmatter` commands to distingush the front matter from main matter. In that case, the front matter will be numbered with roman numerals and the main matter will be numbered with arabic numerals.