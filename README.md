# JVP “Best Practices” Typst Template

This repository provides a reusable Typst package and a minimal manuscript file that conform to *Journal of Vertebrate Paleontology* (JVP) **Best Practices** formatting and SVP’s manuscript preparation guidance.

## Files
- `jvp.typ` — package with page layout, spacing, headings, captions, and helper macros  
- `manuscript.typ` — minimal article that imports and uses `jvp.typ`  
- `refs.bib` — placeholder BibTeX file (replace with your references)  
- `apa7.csl` — APA 7 CSL placeholder (drop an actual APA-7 CSL here)  
- `.gitignore` — ignores common build artifacts 

## Quick Start
1. Install [Typst](https://typst.app/). 
2. Ensure you have an APA-7 CSL file in the repo as `apa7.csl` and your references as `refs.bib`.  
3. Compile: 
   ```
   typst compile manuscript.typ
   ```  
   This produces `manuscript.pdf`.

## Double-Blind Review
Set `DOUBLE_BLIND = true` in `manuscript.typ` to hide authors, affiliations, and acknowledgments (you still need to scrub any self-identifying mentions in the text/figures).

## Author & Affiliation Entries
In `manuscript.typ`, authors are an array of dicts:
```
#let AUTHORS = (
  (name: "FIRST M. LAST", affils: (1,), corresponding: true, dagger: false),
  (name: "SECOND M. LAST", affils: (2,), corresponding: false, dagger: true),
)
#let AFFILIATIONS = (
  1: "Department, Institution, City, State Zip, Country, email",
  2: "Department, Institution, City, State Zip, Country, email",
)
```

- `*` marks a corresponding author (rendered automatically)  
- `†` can denote current address (see `HAS_CUR_ADDR` and `CUR_ADDR_TEXT`)

## Headings & Captions
- **Secondary headings**: ````#jvp_secondary("Title Case Secondary")```` followed by body text.  
- **Tertiary headings**: ````#jvp_tertiary("Title Case Tertiary", [Body text here...])```` renders “Heading—text…” inline.  
- **Figure captions**: ````#figcap(1, "Caption text.", size-note: "[planned for page width]")````  
- **Table captions**: ````#tabcap(1, "Caption text.")````  
- **Supplementary note**: ````#supplementary_note("Supplementary file(s)")````

## References
- Use APA-7. The manuscript calls:
  ```
  #bibliography("refs.bib", style: csl("apa7.csl"))
  ```
  Replace `refs.bib` and `apa7.csl` with your actual files.

## End Matter Line
At the end of the PDF, the ````#end_matter(...)```` macro prints:  
```
Submitted Month DD, YYYY; revisions received Month DD, YYYY; accepted Month DD, YYYY. Handling Editor: NAME, LAST NAME.
```  
Adjust in `manuscript.typ`.

## Tables
Avoid vertical rules; keep minimal horizontal rules. Do **not** use spaces to align numbers—use Typst’s table alignment.

## Repository Structure
```
.
├── jvp.typ
├── manuscript.typ
├── refs.bib
├── apa7.csl
├── .gitignore
└── README.md
```

## License
Licensed under the GNU General Public License v3.0 (GPL-3.0).  
See the included `LICENSE` file or visit [https://www.gnu.org/licenses/gpl-3.0.html](https://www.gnu.org/licenses/gpl-3.0.html) for details.
