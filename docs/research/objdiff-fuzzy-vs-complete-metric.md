# objdiff metrics — fuzzy_match vs complete: why matched_functions under-counts

**Investigation:** brain-PR after briefs 199 / 203 (2026-05-23).
**Question:** several shipped `.legacy.c` units (brief 199 pick #5,
brief 203 picks 1 + 3, brief 202 worked example) show
`complete_code_percent == 100.0` but `matched_functions == None`
in objdiff's report. SHA1 PASS confirms the post-link ROM bytes
are byte-identical to orig, so what's the discrepancy?

## Headline finding

**`matched_functions` requires the unrelocated `.o` bytes to match
exactly — including reloc records.** `complete_units` requires only
that the TU's symbol space is fully accounted for. Our build's
`.legacy.c` / `.legacy_sp3.c` units typically emit MORE relocs than
dsd's delinked orig (debug info, different reloc record formats),
producing different unrelocated bytes — even though the linker
resolves both to the SAME final ROM bytes.

**Concrete example: `src/main/OSi_PostIrqEvent.legacy.o` (brief 203).**

| File | Reloc count | First 200 bytes |
|---|---:|---|
| Built `.o` (mwcc 1.2/sp2p3) | 21 | (differs from delinked) |
| Delinked orig `.o` (`dsd delink`) | 6 | (differs from built) |

Result: `objdiff` reports `fuzzy_match_percent: 97.4359` — close
but not exact. `matched_functions: None` (i.e. not counted).
`complete_code_percent: 100.0` (all 156 bytes of the function
are present in the build) — this IS counted.

Same pattern on brief 199 pick #5 (`func_02096434.legacy.c`),
brief 202's E-07 (`.s` worked example), brief 203's
`func_02093dc8.legacy.c` (the ONE that DID tick matched_functions,
likely by coincidence of the reloc patterns aligning).

## Why this matters

Until now, brain has been reporting `matched_functions` as the
headline metric of code-decomp progress. That metric is a **strict
lower bound** on actual matches — every `.legacy.c` ship will
likely under-tick it. The post-pivot arc (briefs 188 → 203):

| Round | `matched_functions` Δ (reported) | `complete_units` Δ (real) |
|---|---:|---:|
| Brief 188 (5 trivial) | +4 | +5 |
| Brief 190 (10 easy) | +6 | +10 |
| Brief 191 (.s worked example) | +0 | +1 |
| Brief 192 (.s worked example) | +0 | +1 |
| Brief 195 (8 recipe drain) | +0 | +8 |
| Brief 197 (13 ov011 C-32) | +0 | +13 |
| Brief 198 (0 converged) | 0 | 0 |
| Brief 199 (pick #5 .legacy.c) | +0 ← UNDER-COUNT | +1 |
| Brief 200 (P-11 classifier) | 0 | 0 |
| Brief 201 (B-08 .legacy_sp3.c) | +1 | +1 |
| Brief 202 (E-07 .s) | +0 | +1 |
| Brief 203 (2 .legacy.c) | +1 ← UNDER-COUNT (should be +2) | +3 |
| **Across the arc** | **+11** | **+44** |

The "real" code-decomp progress is **+44 complete_units in 16
briefs**, not +11 matched_functions. The matched-function number
was systematically masking the `.s` / `.legacy.c` ships.

## What to change

**Switch the headline metric from `matched_functions` to
`complete_units`.** State.md + brain reporting should track
`complete_units` as the primary indicator. `matched_functions`
remains in the report and can be cited as a "strict lower bound"
or as a secondary metric, but it shouldn't be the headline.

**Why not just fix objdiff to ignore reloc differences?** That's
an upstream change and a much larger investment. The
fuzzy_match_percent score (97-100% range) is actually useful
for spotting NEW divergence — if a previously-100% unit drops
to 80%, that's a regression signal. Keeping objdiff's metric
as-is and just choosing a better headline locally is the
pragmatic move.

## Other discoveries during this investigation

- **`.legacy_sp3.c` ships (brief 201 B-08) DO tick
  matched_functions sometimes.** The `func_02093dc8.legacy`
  unit in brief 203 ticked too. The pattern: smaller functions
  with simpler reloc patterns are more likely to byte-match
  exactly at the `.o` level. Larger functions with more
  externs / pool words diverge.
- **`.s` worked examples (briefs 191/192/195/197/202)
  reliably don't tick matched_functions.** Hand-written
  assembly typically has zero relocs (raw `.word` directives),
  while orig delinks have actual reloc records. The
  unrelocated bytes can never match.

## Brief 206+ scaffolder candidate

If we want to get matched_functions to be more accurate
(useful as a secondary regression metric, not just a strict
lower bound), the path forward is one of:

1. **dsd-side**: file an upstream request for a "preserve full
   reloc shape" mode on `dsd delink` — preserve the linker's
   complete reloc records, not just the minimum subset.
2. **objdiff-side**: file an upstream request for a "compare
   linked bytes" mode — bypass the unrelocated comparison.
3. **post-build script**: relocate both `.o` files to a fixed
   base address before passing to objdiff, eliminating the
   reloc-record divergence at the comparison point.

(3) is the most tractable from our side and could land as a
single tool change. Estimated 0.5-1 day of work. Brief 206+
candidate — not urgent, project tracks via `complete_units`
in the meantime.

## TL;DR for the next brain

If a unit shows `complete_code_percent: 100.0` but
`matched_functions: None`, the function IS byte-identical at
the LINKED ROM level (verified by SHA1 PASS). objdiff's
`matched_functions` field requires unrelocated `.o` byte-
identity which the `.legacy.c` / `.s` ship paths typically
don't satisfy due to reloc-record differences from dsd's
delink. **Use `complete_units` as the headline metric.**
