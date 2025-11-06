// ===========================================================
// JVP Best Practices — Minimal Manuscript Using jvp.typ
// ===========================================================

#import "jvp.typ": setup, title_block, jvp_secondary, jvp_tertiary, figcap, tabcap, supplementary_note, end_matter

// ---- Global switches & metadata ----
#let DOUBLE_BLIND = false

#let TITLE = [
  Your Best Practices Title Goes Here (Sentence case; only proper nouns capitalized)
]

#let RUNNING_HEAD = "Last Name et al.—Short title here"

// Provide authors/affiliations only if DOUBLE_BLIND == false
#let AUTHORS = (
  (name: "FIRST M. LAST", affils: (1,), corresponding: true, dagger: false),
  (name: "FIRST M. LAST", affils: (2,), corresponding: false, dagger: true),
)

#let AFFILIATIONS = (
  1: "Department, Institution, City, State Zip code, Country, email",
  2: "Department, Institution, City, State Zip code, Country, email",
)

#let HAS_CUR_ADDR = true
#let CUR_ADDR_TEXT = "† Current address (if applicable)"

// End-matter (editor fills later)
#let SUBMITTED = "Submitted August DD, YYYY"
#let REVISED   = "revisions received Month DD, YYYY"
#let ACCEPTED  = "accepted Month DD, YYYY"
#let HANDLED_BY = "Handling Editor: NAME, LAST NAME."

// ---- Apply layout ----
#setup()

// ---- Title block ----
#title_block(
  title_text: TITLE,
  running_head: RUNNING_HEAD,
  double_blind: DOUBLE_BLIND,
  authors: AUTHORS,
  affiliations: AFFILIATIONS,
  has_current_address_note: HAS_CUR_ADDR,
  current_address_text: CUR_ADDR_TEXT,
)

// ---- No abstract for Best Practices ----

// =========================
//        BODY TEXT
// =========================

= INTRODUCTION
Provide an overview of the importance of the techniques or methods being described, with a note on their historical usage and/or development.

= PROTOCOLS/METHODOLOGY

#jvp_secondary("Secondary Heading")
Text, if any, follows on the next line, indented. A blank line precedes the secondary heading. Use Title Capitalization (Capitalize the Important Words). Do not cite figures or tables within headings.

#jvp_tertiary("Tertiary Heading", [
  Text follows here after an em dash, without spaces. The heading should be indented; no blank line precedes a tertiary heading.
])

= CONCLUSIONS/FUTURE DIRECTIONS
Brief summary of the guidelines provided herein, with directions for future improvement of the method(s) or technique(s).

= ACKNOWLEDGMENTS
#if not DOUBLE_BLIND [
Use initials for all individuals being thanked; avoid titles such as Dr. or Prof.; use initials to distinguish among authors of the manuscript, and abbreviations for institutions listed in the manuscript text. Consider thanking the reviewers (including anonymous) and the handling Editor.
] else [
  (Omit acknowledgments for double-blind review; restore after acceptance.)
]

= AUTHOR CONTRIBUTIONS
Use initials to identify authors, e.g., "ABC designed the project, collected the data, and drafted the manuscript; DEF vetted the data; and GHI provided guidance and funding. All authors edited the manuscript."

= TABLES

#tabcap(1, "This is the caption of the table.")
#v(0.4em)
#table(
  columns: 3,
  inset: 0em,
  stroke: 0.5pt, // minimal horizontals; avoid verticals
  align: horizon,
  [Col A], [Col B], [Col C],
  [1], [2], [3],
  [4], [5], [6],
)

#par()(If a table continues onto a second page, begin the next page with “TABLE 1. (Continued)” on the next page.)

= FIGURE CAPTIONS
#figcap(1, "Example caption text describing the figure.", size-note: "[planned for page width]")
#figcap(2, "Another caption; note bracketed target size.", size-note: "[planned for column width]")

= SUPPLEMENTARY FILES
#supplementary_note("Supplementary file(s)")

= LITERATURE CITED
#bibliography("refs.bib", style: csl("apa7.csl"))

// ---------- End matter ----------
#v(1.2em)
#end_matter(
  submitted: SUBMITTED,
  revised: REVISED,
  accepted: ACCEPTED,
  handling_editor: HANDLED_BY
)
