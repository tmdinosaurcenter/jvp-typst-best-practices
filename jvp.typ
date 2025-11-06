// ===========================================================
// Journal of Vertebrate Paleontology — "Best Practices" Package
// ===========================================================
// Version: 2025-11-05
// Exports layout setup and helper macros for JVP Best Practices.
// ===========================================================

#let main-font = "Times New Roman"

// ---------- Package setup ----------
#let setup() = {
  set page(margin: 1in)
  set text(font: main-font, size: 12pt)
  set par(leading: 2.0em) // double spacing
  set figure(numbering: "1")
  set heading(numbering: none)
}

// ---------- Utilities ----------
#let caps(s) = s.upper()

// authors: array of dicts: (name: "FIRST M. LAST", affils: (1,2), corresponding: bool, dagger: bool)
// affiliations: dict: 1: "Dept, Inst, City, State Zip, Country, email"
#let title_block(
  title_text: content,
  running_head: str,
  double_blind: bool,
  authors: array = (),
  affiliations: dictionary = (),
  has_current_address_note: bool = false,
  current_address_text: str = "† Current address (if applicable)"
) = block[
  // Title centered, 12 pt, not bold
  #align(center)[#title_text]

  #if not double_blind [
    #v(0.8em)
    #align(center)[
      #for a, i in authors {
        #caps(a.name)
        #if a.affils.len() > 0 [
          #super[#for idx, k in a.affils {#k#if idx < a.affils.len()-1 [, ]}]
        ]
        #if a.corresponding [*]
        #if a.dagger [†]
        #if i < authors.len()-1 [, ] else []
      }
    ]

    #v(0.6em)
    #align(center)[
      #for k in affiliations.keys().sorted() {
        #k #affiliations.at(k)
        #linebreak()
      }
    ]

    #v(0.6em)
    #align(center)[
      * Corresponding author
      #if has_current_address_note [
        #linebreak()
        #current_address_text
      ]
    ]
  ] else [
    #v(0.8em)
    #align(center)[ANONYMOUS AUTHOR(S)]
  ]

  #v(2em)
  RH: #running_head
]

// ---------- Section helpers ----------
// Secondary heading: Title Case, separated by a blank line, body follows on next line
#let jvp_secondary(heading-text: str) = block[
  #v(1.2em)
  #text(heading-text, weight: "regular")
]

// Tertiary heading: inline, em dash, same paragraph; indent start
#let jvp_tertiary(heading-text: str, body: content) = {
  par(indent: 2em)[
    #text(heading-text, weight: "regular")—#body
  ]
}

// ---------- Captions ----------
#let figcap(num: int, caption: content, size-note: str = "[planned for column width]") = [
  *FIGURE #num.* #caption #size-note
]

#let tabcap(num: int, caption: content) = [
  *TABLE #num.* #caption
]

// ---------- Supplementary note ----------
#let supplementary_note(files_label: str = "Supplementary file(s)") = [
  *SUPPLEMENTARY FILE(S)*––#files_label are available for this article for free at www.tandfonline.com/UJVP
]

// ---------- End matter (dates / editor) ----------
#let end_matter(
  submitted: str = "Submitted Month DD, YYYY",
  revised: str = "revisions received Month DD, YYYY",
  accepted: str = "accepted Month DD, YYYY",
  handling_editor: str = "Handling Editor: NAME, LAST NAME."
) = par(leading: 2.0em)[
  #submitted; #revised; #accepted. #handling_editor
]

// ---------- Export API ----------
#export setup, title_block, jvp_secondary, jvp_tertiary, figcap, tabcap, supplementary_note, end_matter
