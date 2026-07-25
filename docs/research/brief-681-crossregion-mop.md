# Brief 681 — cross-region port lane mop-up (queue item cm-crossregion-mop)

**Result: 26 ships (13 USA + 13 JPN), both blockers brief 677 deferred
now cleared, 3-region (`gate3.py --scope all --no-tests` PASS: EUR,
USA, JPN). Backlog down from 20/region to the same 7/region residual
in both regions (5 cross-region-rename-gap refusals + 2 sub-1.0
`.legacy_sp3` candidates already documented by brief 677).** Found and
documented two distinct `port_to_region.py` bugs along the way (a regex
`\b`-boundary gap and an address-keyed dict collision), both of which
silently produce wrong-but-compiling ports rather than loud failures.

## Scope

`port_census.py` confirmed the starting backlog: 20/region (18 at
`byte_sim == 1.0`, 2 sub-1.0), plus brief 677's two explicitly deferred
blockers that had excluded 3 more candidates/region from ever reaching
that count.

## Blocker 1: stale `ov002_core.h` in USA/JPN

Briefs 609/613 mined a struct-bank expansion into EUR's copy of
`ov002_core.h` (389 → 662 lines) that was never propagated to USA/JPN's
own copies. Replaced the flat `extern char data_ov002_...[]` block in
both regions' headers with the full struct-bank equivalent (structs
`Ov002022cf16c`, `Ov002022ce950`, `Ov002022cd3f4`, `Ov002D016c`,
`Ov002Ce288` — field layouts copied verbatim since struct layout is
region-independent, only addresses substituted per region) plus
region-local `D008C`/`CE1A8` macros (deliberately renamed from EUR's
`D016C`/`CE288`, which would misdescribe the address in USA/JPN's own
source). USA and JPN ended up byte-identical to each other. Verified
via full `ninja sha1` PASS on both regions independently. This alone
unblocked 2 of the 3 excluded candidates, as the queue text predicted.

## Blocker 2: `func_ov008_021ac1cc` needs a real bss-alias

The third excluded candidate needed a second symbol name
(`data_ov008_021b2ca0_alias`) at an address already claimed by
`data_ov008_021b2ca0` — EUR's own `symbols.txt` carries this
deliberate two-name alias, but USA/JPN's didn't. Confirmed a
`symbols.txt` line alone is **not** sufficient: the linker still
reports "Undefined" without a matching real split in the module's
git-tracked `bss.s` file. The working recipe (mirroring EUR's own
file structure exactly): shrink the base symbol's `.space N` to
`.space 0x0` immediately followed by `.global <name>_alias` /
`<name>_alias:` / `.space N` — the alias owns the real space, the base
becomes a zero-size marker at the same address. Applied to both USA
and JPN's `data_ov008_bss.s` + `symbols.txt`; both gated green.

## Two `port_to_region.py` bugs found (documented, not fixed)

Fixing `func_ov008_021ac1cc` exposed the mechanism behind essentially
every other gate-fail this brief hit, so it's worth stating precisely.
Both are flagged as genuine tool gaps for a future brief, matching this
campaign's established pattern of flag-don't-necessarily-fix for
shared tooling discovered mid-task (see brief 677's own two follow-ups,
now closed above).

**Bug A — regex `\b`-boundary gap.** `SYMBOL_RE`'s trailing `\b` fails
to match between a hex digit and a following `_`, so any `_alias`
-suffixed symbol *reference in source text* is invisible to the
substitution pass and survives verbatim as the EUR name in ported
output — a guaranteed compile error, at least loud.

**Bug B — address-keyed dict collision (worse: silent).** Even a
*bare*, non-alias-suffixed reference gets mis-resolved: the
EXACT_ADDR resolution path keys a `{(module, addr): name}` dict that
can only hold one name per address, and when a base symbol and its
alias share an address, symbols.txt's *last* line for that address
wins — in every case observed, the alias. A plain source-level
reference to the base name silently comes out renamed to the alias in
the ported file. This produces code that **compiles cleanly and links
successfully but is byte-wrong**, discoverable only by running the
real gate.

## The literal-pool CSE mechanism these bugs collide with

mwasmarm deduplicates a literal-pool `.word` entry whenever the *same
symbol name* is referenced twice, even across unrelated instructions —
collapsing two logically distinct pool slots into one and shrinking
the object by 4 bytes per collapsed pair. EUR's C-34 pattern
(`docs/research/codegen-walls.md`) exists specifically to defeat this,
via one of two techniques, both re-confirmed this brief on fresh
candidates:

- **Technique 1 (literal-address cast)** — the second reference uses a
  raw numeric literal cast (`(struct Ov002Item *)0x022cabc0`) instead
  of a symbol name. The literal is a hardcoded ROM address invisible
  to `port_to_region.py` (it isn't a symbol token) and must be
  recomputed by hand for the target region.
- **Technique 2 (symbols.txt alias)** — a second symbol name at the
  identical address, as in blocker 2 above.

Because of Bug B, every raw auto-port of a Technique-2 candidate
collapsed **both** source-level references onto the alias name,
regardless of which one EUR's original source used — silently
re-introducing the exact CSE collapse the alias exists to prevent, and
shrinking the compiled object by 4 bytes. Diagnosed via `ninja check`
(a secondary "Matching name found at 0xADDR-N" line means a shift is
propagating downstream) and confirmed with a direct object-size
comparison (`arm-none-eabi-objdump -h`) before touching source. Fixed
each candidate by hand-restoring the exact base-vs-alias split EUR's
own source uses at each individual reference site — not a mechanical
find/replace, since which site needs which name varies per function.

7 candidates needed this treatment across both regions' first
`batch_port.py --confidence-floor MEDIUM` passes: `func_020071a8`,
`func_ov001_021ca064`, `func_ov002_021e2d48` (a related but distinct
stale-macro-name issue, not CSE), `func_ov002_02247600`,
`func_ov002_022479f0`, `func_ov008_021aa86c`, `func_ov008_021ad984`.
USA's hand-corrected fixes were reused verbatim for JPN after
confirming via `port_to_region.py --dry-run` that every symbol
involved resolves to an identical target address in both regions — no
independent re-derivation needed.

## 18 sim==1.0 candidates: 13/region shipped, 5/region refused

`batch_port.py` (HIGH then MEDIUM confidence floor) ported 11/region
mechanically clean; the 7 gate-fails above were hand-fixed and shipped
individually verified. The remaining 5 (`func_02026f84`,
`func_ov002_021d630c`, `func_ov002_022959f8`, `func_ov011_021ce410`,
`func_ov011_021ceef0`) refuse even at MEDIUM confidence in both
regions — root cause is a genuine cross-region symbol rename
(`port_to_region.py`'s own docstring scopes this out explicitly: e.g.
`data_0219a8e4` has no USA entry under any name, and two callees don't
exist under their EUR names in EUR's own `symbols.txt`, implying
they've been semantically renamed). Parked; out of this brief's scope
per the tool's documented boundary.

## 2 sub-1.0 candidates: parked, unchanged from brief 677

`func_0204f34c` / `func_020500a4` need brief 677's already-documented
57-slot shared-context-struct field-offset table, not a quick fix.
Re-confirmed brief 677's diagnosis holds rather than re-deriving it;
left as `.s` in both regions.

## Mandatory verification: .c-added == delinks.txt-flipped == .s-deleted

Per the queue's explicit requirement: **26 == 26 == 26**, both
regions combined (13 USA + 13 JPN each). Verified by diff, not just
commit-count symmetry:

```
.c files added (src/usa|jpn/**):      26
.s files deleted (src/usa|jpn/**):    26
delinks.txt .s: -> .c: flips:         26
```

## Gate

`python tools/gate3.py --scope all --no-tests` — 3-region PASS (EUR,
USA, JPN). Every one of the 26 shipped candidates individually
`ninja sha1`-verified (USA and JPN each, gate-fails re-verified after
each hand-fix) before the final aggregate gate.

## Remaining backlog for a future brief

Both regions now converge on the identical 7-item residual: 5
cross-region-rename refusals + 2 sub-1.0 struct-offset-table
candidates. Two concrete follow-ups:

- `port_to_region.py`'s two bugs (regex `\b`-boundary gap; address-keyed
  base/alias dict collision) should be fixed at the source — Bug B in
  particular is a silent-wrong-byte hazard, not just an inconvenience,
  and will keep costing hand-diagnosis time on every future
  Technique-2 alias candidate that gets auto-ported.
- Cross-region symbol-rename resolution (the 5 refused candidates) is
  explicitly out of `port_to_region.py`'s current scope; closing it
  requires building the rename mapping the tool's own docstring
  anticipates, likely by diffing EUR/USA/JPN `symbols.txt` address
  coverage directly rather than trusting name matches.
