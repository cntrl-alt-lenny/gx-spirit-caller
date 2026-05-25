# objdiff metrics — fuzzy_match vs complete: why matched_functions under-counts

**Investigation:** brain-PR after briefs 199 / 203 (2026-05-23).
**Update:** brief 206 (2026-05-25) shipped the resolve-relocs harness
(option 3 below) — `matched_functions` is now accurate. The
historical record below is preserved; see the "Brief 206 outcome"
section at the bottom for the resolution.

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

## Brief 206 outcome — fixed via resolve-relocs harness

**Status (2026-05-25):** option 3 above shipped as
`tools/objdiff_resolve_relocs.py`. It's wired into the
`objdiff_report` ninja rule between `objdiff_filter_panic_units.py`
(brief 187) and `objdiff-cli report generate`. Both target +
base `.o` files are rewritten in-place as `*.o.resolved` sidecars
with all `R_ARM_ABS32` / `R_ARM_PC24` relocations applied to a
fictional fixed virtual base and the reloc tables stripped. The
JSON's `target_path` / `base_path` are then repointed at the
sidecars, so `objdiff-cli` compares post-relocation bytes
instead of unresolved `.o` byte shapes.

**Symbol-address scheme.** For external symbols
(`st_shndx == SHN_UNDEF`) the resolver:
1. Extracts the embedded 8-hex-digit suffix from dsd-style names
   (`data_021a6354`, `func_020905dc`, `data_ov006_021ceae4`).
   That's the same address mwcc emits as a raw literal for the
   same pool word, so a "raw literal" slot and a "reloc-promoted"
   slot resolve to identical bytes.
2. Falls back to a 24-bit FNV-1a hash + clustered base for named
   externals (e.g. `memcpy`, `OSi_PostIrqEvent`). Both `.o` files
   reference the symbol by the same name, so the same hash → the
   same fictional address → identical post-relocation bytes.

In-section symbols use `section_base_for(name) + st_value`, keyed
by section NAME (not per-file index), so cross-file consistency
holds even when section orderings differ.

**Measured impact (EUR region, 2026-05-25):**

| Metric | Pre brief 206 | Post brief 206 | Δ |
|---|---:|---:|---:|
| `matched_functions` | 1430 | 1654 | **+224** |
| `complete_units` | 1415 | 1636 | +221 |
| total functions | 9603 | 9801 | (drift) |

**Convergence verified.** `matched_functions` (1654) ≈
`complete_units` (1636) post-brief-206 — the metric is no longer
a strict lower bound, it's now accurate. The 1430→1654 jump
captures the bulk of the historically under-counted
`.legacy.c` / `.legacy_sp3.c` / `.s` ships.

**Canary case `OSi_PostIrqEvent.legacy`** (the worked example
from this note's "Headline finding" section): post-brief-206
`fuzzy_match_percent: 100.0`, `matched_functions: 1`. Was
under-counted pre-brief-206.

**Residual 23 stragglers** (units where `complete_code_percent
== 100` but `matched_functions == 0` post-brief-206):

- 20 are `.s` ships (hand-written assembly), 14 of them with
  `fuzzy_match < 30%` — these are REAL near-misses (likely PC24
  displacement overflow from the fictional address scheme, or
  genuine byte divergence in hand-written `.s` content), not
  brief 206 artifacts. Pre-brief-206 these would have read
  identically as "under-counted"; brief 206 properly surfaces
  them as separate concerns for future briefs.
- 3 are `.c` ships with `fuzzy_match` between 92.86 and 98.73 —
  near-matches that may be addressable via the dsd-config-driven
  address mapping mentioned in option 1, or via mwcc tuning.

**Headline-metric guidance updated.** The
"`complete_units` as headline" recommendation was
brief-205-era. Post-brief-206, **`matched_functions` is again
the canonical headline metric for code-decomp progress** — it
counts every function whose post-resolve bytes match orig, which
is exactly what we want to track. `complete_units` remains
useful as a secondary unit-level metric.

**Follow-up candidates (brief 207+):**
1. Investigate the 20-`.s` straggler set — are the PC24
   displacements overflowing for some symbol-name hash
   collisions? Could resolve by tightening the 24-bit hash
   cluster.
2. File the upstream "compare linked bytes" mode request on
   objdiff (option 2 above) — would obsolete brief 206's
   sidecar tool in the long run. Still useful to have a working
   local fix in the meantime.
3. Optionally feed dsd's known symbol addresses (from
   `config/<ver>/**/symbols.txt`) into the resolver instead of
   relying on name-embedded hex — would make the name-hash
   fallback unnecessary. Marginal value, ship-as-needed.
