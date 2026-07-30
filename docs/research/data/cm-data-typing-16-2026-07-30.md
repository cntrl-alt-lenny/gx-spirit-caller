# cm-data-typing-16 — where the data mass actually is

2026-07-30. A measurement wave, not a shipping round by default, per its
own filing. The flat `unsigned char[N]` census that drove waves 2-15 is
confirmed exhausted (wave 15); this wave asks a different question —
given `Typed-array` is only 1.67% and `Named-struct` only 0.94% of
4,776,528 EUR data bytes, where does the other ~97% actually live, and
which slice of it is worth attacking next?

## What the metric actually counts (read before measuring anything)

`tools/progress.py`'s `summarize_data_readability`:

- `data_total_bytes` (4,776,528) = the **module-level** section-range sum
  of `.data`/`.rodata`/`.ctor`/`.dtor`/`.bss` across every EUR delinks.txt
  — the full byte extent of every data-ish section, *regardless of
  whether any file claims those bytes at all*.
- `typed_array_bytes` (79,676 as of wave 14) = bytes owned by a **`.c`/
  `.cpp` TU only** (raw `.s` is explicitly excluded by the loop's own
  extension check) whose source matches `_DATA_ARRAY_DECL_RE` — **any**
  file-scope array declaration, initialized or not, **including opaque
  `unsigned char data_X[N] = {...}` carve placeholders** (the doc
  comment says so explicitly: "deliberately does not infer types from
  comments... retains historical coverage, including opaque... carve
  placeholders").
- `named_struct_bytes` (44,728 as of wave 14) = the narrow sub-tier:
  same TU-ownership rule, but the declaration's type clause must contain
  at least one token that is NOT in the primitive/qualifier keyword set
  (`_is_primitive_type_clause`), checked by exclusion since this repo
  declares structs by bare typedef name with no `struct` keyword at the
  declaration site.

**Consequence that reframes the whole question**: since even an
unretyped opaque `unsigned char[N]` file already counts toward
`Typed-array`, the 98.33% *not* counted is not "arrays with the wrong
element type" — it is bytes that are **not owned by any `.c`/`.cpp` TU
at all**: either claimed by raw `.s` (byte-correct, zero readability) or
not claimed by *any* TU whatsoever (a genuine, unlisted gap in
delinks.txt). The item's own framing (primitive-array-to-struct
upgrades) turns out to be the smallest of the real categories, not the
largest — see the ranked table below.

## Method

Reused `progress.py`'s own `parse_delinks_file`/`DATA_SECTIONS`/
`_DATA_ARRAY_DECL_RE`/`_tu_has_named_struct_decl`/
`_is_primitive_type_clause` directly (imported the module, not
reimplemented) so every number here is guaranteed consistent with the
real metric, not a parallel calculation that could silently diverge.
Walked every `config/eur/**/delinks.txt`, classified every TU by
extension and declaration shape, and — critically — compared each
module's own section-level totals against the sum of that module's own
listed TU sections to find genuinely **unlisted** byte ranges (no TU
entry at all, not even a gap placeholder). This last check is not
optional: without it, the aggregate "claimed" totals looked complete at
first pass, but every single module individually showed a gap between
its module-level total and its own TUs' sum. Scripts:
`measure_data_opportunity.py`, `per_module_check.py`,
`filter_non_char.py` (session scratchpad, not part of the repo).

## Ranked table (EUR, 4,776,528 total data-section bytes)

| Category | Bytes | % of total | Action |
|---|---:|---:|---|
| `.bss`, raw `.s`-claimed | 4,034,784 | 84.5% | Not `.c`-owned; see below |
| `.bss`, genuinely unclaimed (no TU at all) | 32,768 | 0.7% | Not `.c`-owned |
| `.data`, genuinely unclaimed | 346,976 | 7.3% | Mixed — see caveat |
| `.rodata`, genuinely unclaimed | 181,867 | 3.8% | **Mostly likely undecompiled code, not data** — see caveat |
| `.rodata`+`.data`, raw `.s`-claimed | 84,800 | 1.8% | Byte-correct, zero readability |
| `.rodata`+`.data`, `.c`-claimed, no array/struct decl | 15,421 | 0.3% | Scalar non-array declarations; not this campaign's shape |
| `.c`-claimed primitive array, char-family | 24,356 | 0.5% | **Already fully covered** (waves 2-15) |
| `.c`-claimed primitive array, non-char, already shipped by cm-data-inference (correctly flat, e.g. genuine `short[128]`) | ~4,676 | 0.1% | Done, correct as-is |
| `.c`-claimed primitive array, non-char, **genuinely never touched** | 5,872 → **496 after this wave's ship** | 0.1% | **Shipped 5,376B this wave** (see below); ~500B tiny-file residue left |
| `.c`-claimed, already `Named-struct` | 44,728 | 0.94% | Done |
| `.ctor`/`.dtor` | 204 | 0.0% | Negligible |

Rows sum to 4,776,528 (verified programmatically — the whole point of
reusing `parse_delinks_file` was to make this arithmetic trustworthy
rather than asserted).

## The `.bss` finding: the user's claim is confirmed

**Zero `.bss` bytes are owned by any `.c`/`.cpp` file, in EUR.** 4,067,552
bytes of `.bss` (85.2% of the *entire* data byte budget) break down as
99.19% raw `.s` (4,034,784 B, real symbols with real sizes, just no
readable declaration) and 0.81% genuinely unclaimed (32,768 B, concrete
gap addresses: 10,624 B in `ov000`, 22,144 B in `ov002`). This is the
single largest byte-mass finding in this measurement, by a wide margin —
larger than every other category combined.

**Why this is a fundamentally different, likely *lower-risk* kind of work
than this campaign has ever done**: `.bss` is uninitialized/zero-filled
RAM, not ROM content — there is no byte content to get wrong, ever. The
only thing that can be gotten wrong is the *size* (which shows up
immediately as address drift in later symbols and fails `ninja sha1`,
exactly like any other symbol) and the *type* (cosmetic, doesn't affect
the gate at all). This removes this campaign's single biggest historical
risk category (the wave-11 hand-transcription bug, and the class of bug
this rule was hardened against) by construction. **It is also a
fundamentally different kind of work**: converting a raw `.s` `.space N`
declaration into a named, sized, typed `.c` global is a *carve*
(discovering and asserting a symbol boundary from scratch, the same
operation waves 8/9/11's boundary work did on a tiny scale), not a
*retype* (giving an already-bounded, already-`.c`-claimed blob a better
type) — this campaign's existing method and tooling has only ever done
the latter.

## The `.rodata`/`.data` "unclaimed" findings: NOT one uniform category

**`.rodata`, 181,867 unclaimed bytes**: 135,883 of these (74.7%) are in
`ov004` alone. Checked the exact gap address ranges against `ov004`'s
`.rodata` module range (`0x021de638`-`0x02209a5c`): **every single one of
the 9 gap ranges sits immediately adjacent to a symbol wave 13 already
confirmed as real, compiled ARM32/Thumb machine code misclassified as
data** (the "Category 2 ARM32 veneer blob" class — `021e2efc`,
`021e3128`, `021e3500`, `021e3de8`, `021e3f60`, `021e87ac`, `021f4880`,
`021f4a40`, `021ff0b4`). For example, the gap `0x021e8a6c`-`0x021f4880`
ends *exactly* at `data_ov004_021f4880`'s start address; the gap
`0x021e1db1`-`0x021e2efc` ends *exactly* at `data_ov004_021e2efc`'s
start. This is not a coincidence across 9/9 gaps. **High-confidence
conclusion: most of this 135,883-byte "opportunity" is more of the exact
same already-documented phenomenon** — real code that `dsd delink`
couldn't even confidently bound into a placeholder symbol, in the same
region wave 13 already proved is unsafe to reclassify (breaks EUR SHA1,
brief 154/PR #581). **Excluded from opportunity, not recommended for
any future wave without new evidence.** The remaining ~45,984 bytes
(mostly `ov000`'s 27,572 B and `ov002`'s 13,128 B) were not checked for
the same adjacency pattern and are not excluded on this basis, but
weren't tested closely enough to call "confirmed opportunity" either.

**`.data`, 346,976 unclaimed bytes**: a structurally different picture
from `.rodata`'s handful of huge gaps — 172 separate gap ranges just in
`arm9`/main alone (242,776 B of the 346,976 total), averaging ~1,400
bytes each, none showing the same "brackets a known-code symbol"
adjacency pattern `.rodata`'s gaps did. `.data` doesn't have `.rodata`'s
specific confound (the overlay-VA-sharing mechanism that produces
spurious veneers is a `.rodata`/cross-overlay-call phenomenon, not a
`.data` one), so there's no equivalent reason to suspect these are
hidden code. **Not confirmed as legitimate data opportunity either** —
that would need actual sampling, which is out of scope for a measurement
pass — but flagged as the more promising of the two "unclaimed" buckets
for a future targeted investigation, specifically because it lacks
`.rodata`'s code-adjacency red flag.

## The item's own named category: real, but the smallest slice

Filtered the primitive-array bucket to non-char-family types only (the
char-family — `unsigned char`, `char`, `signed char` — is exactly what
waves 2-15 already exhaustively covered; re-including it would just
re-litigate wave 15's own finding). Result: **75 files, 10,548 bytes**
— not the ~179/~21 estimated when this item was filed. Cross-checked
every one against `git log --follow` (the same technique wave 15 used
with zero discrepancies): **most are already-shipped `cm-data-inference`
retypes** that happen to be genuinely flat scalar arrays (their correct
final type *is* `short[N]`/`int[N]`, not a struct — shipping them as
scalars was the right call, not an oversight). Only **20 files, 5,872
bytes** have never been touched by any `cm-data-inference` wave — only a
pre-campaign mechanical-carve commit. Of those, one file dominates:
`data_ov002_022bf3c4` at 5,376 bytes (91.6% of the fresh total); the
other 19 are a small cluster in `src/main/data/` (a nested subdirectory,
8-72 bytes each, ~500 bytes combined) carved by an entirely different,
earlier, pre-campaign effort ("cluster B main" briefs 152/155/181) that
this campaign's census has never reached by *type* (not `unsigned char`)
even after wave 13 fixed the *path*-recursion bug.

## Shipped this wave

**`data_ov002_022bf3c4`** (5,376 bytes, `.rodata`): retyped from
`const unsigned int[1344]` to `const RecordOv002_022bf3c4[224]`, a
24-byte record (`unsigned int id` + 5 `void *` handler fields). This is
the third and last member of a "3-table dispatch directory" whose other
two members (`data_ov002_022be1ac`, 193 records; `data_ov002_022c357c`,
812 records) were already shipped in `cm-data-inference-2` under the
identical struct shape — `data_ov002_022c357c.c`'s own header comment
names this exact symbol as deliberately deferred. This wave resolves
that deferral.

Evidence, independently re-verified beyond the investigating agent's own
report (per the wave-14 safeguard — an agent's self-reported "verified"
claim is not sufficient on its own):
- Boundary confirmed directly against `symbols.txt`/`delinks.txt`:
  `0x022bf3c4`-`0x022c08c4`, exactly 5376 bytes, `.rodata`.
- 836 of 1344 words carry a relocation; every reloc lands at
  record-relative offset {4,8,12,16,20}, never offset 0 (the `id`
  field) — checked systematically across all 224 records, zero
  anomalies.
- Sole consumer (`func_ov002_02257464.s`, still unmatched) computes
  `idx*24` and returns a pointer to the whole matched record, not one
  field — a genuine, disassembly-proven computed stride. Element count
  (224) is proven by the consumer's own `hi=0xdf` bound plus the
  identical "`hi` = count−1" convention independently cross-validated
  against both already-shipped sibling tables' own real sizes.
- All 319 distinct non-zero pointer values across the 5 handler fields
  resolve exactly to a real `kind:function` symbol start address — 0
  misses.
- Re-verified independently (not just trusting the agent): read the raw
  bytes directly from `extract/eur/arm9_overlays/ov002.bin` at the
  correct file offset, parsed the agent's generated `.c` file's own
  initializer, and confirmed byte-for-byte reproduction of the ROM
  content before installing it.

No `delinks.txt` change needed — same boundary, C-level retype only,
matching both sibling precedents.

## A concrete lead surfaced in passing, not investigated this wave

The same dispatcher's third/default arm targets `data_ov002_022c08c4`
— sitting in a genuine, **never-carved 9,912-byte gap** (no `delinks.txt`
entry at all) between `0x022c08c4` and the next symbol
(`data_ov002_022c357c` at `0x022c357c`). The evidenced extent from the
dispatcher's own `hi` bound would run 64 bytes *past* where
`data_ov002_022c357c` already begins — a genuine boundary tension, not a
clean carve. This is exactly the "`.data`/`.rodata` unclaimed gap that
turns out to be legitimate, well-evidenced data opportunity" case the
measurement above was looking for a concrete example of (in contrast to
`ov004`'s gaps, which are likely more veneer-code). Left for a dedicated
future item — it needs its own full reloc/boundary investigation before
any verdict, not a rushed one riding on this wave's leftover context.

## Recommendation

1. **This round**: ship what fits the campaign's existing, low-risk,
   well-proven method — done (`data_ov002_022bf3c4`, 5,376 B). The tiny
   `src/main/data/` cluster (~19 files, ~500 B combined) is real but
   not worth dedicated per-symbol investigation effort at that size;
   named as a residual lead, not chased further this wave.
2. **Not this round, but the clear highest-value target**: `.bss`.
   4.07M bytes, 85% of the entire data budget, confirmed 0% `.c`-owned,
   and structurally lower-risk than initialized-data work (no byte
   content to get wrong). This requires new methodology this campaign
   has never built — symbol-boundary discovery from raw `.s`
   declarations and consumer analysis, not retyping an already-bounded
   file — closer in kind to a fresh carving campaign than a continuation
   of `cm-data-inference`. Recommend scoping this as its own new
   workstream (own queue lane, own name) rather than folding it into
   this campaign's existing per-wave rhythm.
3. **Explicitly not recommended without new evidence**: `ov004`'s
   135,883-byte "unclaimed `.rodata`" — the address-adjacency evidence
   above makes it very likely more undecompiled code in the same class
   wave 13 already proved unsafe to touch as data.
4. **A real, medium-confidence lead for a focused future item**:
   `data_ov002_022c08c4`'s 9,912-byte never-carved gap, described above.

This is not "the data lane has no work left" — it's the opposite: there
is a very large amount of real opportunity, but it is concentrated in a
category (`.bss`, uninitialized-memory carving) this campaign's existing
method was never built for, not in the category this item's own framing
anticipated (primitive-to-struct upgrades, real but comparatively tiny).

## Gate

`ninja sha1` (EUR) PASS on the first attempt. Full 3-region
`python tools/gate3.py --scope all` PASS (`[eur]`/`[usa]`/`[jpn]` SHA1
individually confirmed; pytest 3125 passed, 15 skipped, 63 subtests).

`Named-struct`: 44,728 → 50,104 (**+5,376**, exactly the shipped file's
size — clean, fully explained). `Typed-array`: 79,664 → 79,664
(**unchanged** — expected and correctly so: the file was already
counted there before this wave, since `const unsigned int[1344]` also
matches the broad "any array" regex; the retype only moves it into the
narrower `Named-struct` sub-tier, it doesn't add new `Typed-array`
bytes). No unexplained metric movement this time, unlike the small
wave-13/14 `Typed-array` discrepancy noted previously.
