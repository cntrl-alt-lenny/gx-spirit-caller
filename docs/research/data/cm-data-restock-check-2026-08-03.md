[//]: # (markdownlint-disable MD013 MD041)

# cm-data-restock-check (2026-08-03)

Follow-up to [`cm-bss-convert-9-2026-08-01.md`](cm-bss-convert-9-2026-08-01.md),
filed as item 2 of the 2026-08-03 (M1 Mac brain) round, after item 1
(`cm-main-sweep-h`, [PR #1437](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/1437))
landed. Three deliverables: (1) re-census the fresh data-candidate pool and
report honestly whether it restocked, (2) resolve `data_02101e64`'s flagged
sibling `data_02101e7c`, (3) resolve the `data_0210594c`/`data_02105989`
boundary conflict. **No source files changed** — this is a pure research/
investigation item; both open leads are resolved as declined, and the
"restock" question resolves to something more interesting than a yes/no.

## Result

- **Part 1 — the pool did not "restock" in the depletion→regrowth sense
  wave 9 asked about. It was never actually visible to that series'
  methodology.** A shape-classified re-census (`tools/data_worklist.py
  --shape {struct,array,fnptr_table,jump_table}`, `ov002` excluded as the
  Decomper lane's active territory) turns up **274 non-primitive candidates,
  24,753 bytes**, spread across `main` and 19 overlays. Cross-checked by
  exact symbol name against all 23 prior wave docs (`cm-data-inference-3`
  through `-15`, `cm-data-typing-16`, `cm-bss-convert-1` through `-9`,
  `cm-bss-carve-scope`) — **none of the 274 were ever shipped or declined
  by name in any of them.** Full table:
  [`cm-data-restock-census-2026-08-03.md`](cm-data-restock-census-2026-08-03.md).
- **Part 2 — `data_02101e7c`: declined (4th confirmation), with one new,
  documented lead for whoever wants to invest further.**
- **Part 3 — `data_0210594c`/`data_02105989` boundary conflict: still
  blocked, but now precisely characterized** — the conflict is worse than
  previously described (it's a 3-symbol chain, not 2), and it's confirmed to
  be a naming/typing-boundary artifact rather than a functional risk.
- **Before/after data metrics: unchanged** (no ship this item):
  ```
  Typed-array:   161,052 -> 161,052 bytes  (+0 B,   3.37% -> 3.37%)
  Named-struct:   55,204 ->  55,204 bytes  (+0 B,   1.16% -> 1.16%)
  ```
  Measured via `python3.13 tools/progress.py --version eur --json` on the
  current branch tip (`e5f789ed8` + this doc), which is exactly wave 9's own
  reported ending state — confirming item 1 (a pure code-C-match sweep)
  correctly left the data metrics untouched.

## Part 1: the pool-yield check, and why it isn't the number you'd expect

Wave 9's own framing was: *"the non-primitive pool is down to 9 candidates
totaling 92 bytes."* Re-deriving that exact number by running the same kind
of shape-classified census produces 274, not 9 — a 30x difference that is
**not** restocking. Reading wave 9's own closing paragraph precisely:

> *"Re-derived the fresh candidate pool (excluding all 167 symbols named
> across waves 1-8): the non-primitive pool is down to 9 candidates..."*

That statement is scoped to the `cm-bss-convert` series' own discovery
method: a pre-curated pool of **already-extern-referenced `.bss` cluster-file
symbols** established by `cm-bss-carve-scope`, filtered to symbols already
having a `kind:bss` entry and a live `.extern` reference from already-matched
code. It is **not** a claim about `.data`/`.rodata` struct/array/fnptr_table
shapes project-wide — that was a *different, already-closed* series
(`cm-data-inference`/`cm-data-typing`), whose own wave 15
(2026-07-30) separately claimed **zero fresh candidates, "fully recursive
census across entire src/, all regions."**

That wave-15 claim is the one this report actually contradicts, and there's
good reason to believe it: this campaign has hit this exact failure mode
twice before.

- Wave 12: *"Flat-glob census (main+overlay\*, non-recursive) found 0
  fresh; confirmed later (wave 13) this glob was buggy/incomplete, not a
  real exhaustion."*
- Wave 13: *"First wave into `src/overlay004/data/` (nested subdir the flat
  glob had always missed) — 42 fresh candidates found."*
- Wave 16 (`cm-data-typing`, the renamed continuation): *"Different framing:
  measures the WHOLE data byte landscape (not just `unsigned char[N]`
  blobs)"* — i.e. its own author already knew waves 1-15's method had a
  structural blind spot around anything that wasn't a flat byte-blob
  declaration.

`tools/data_worklist.py`'s shape classifier (struct/array/fnptr_table/
jump_table via cross-reference and reader-density analysis, not a source
grep for `unsigned char foo[N]`) is a materially different — and evidently
newer — detection method than what waves 1-15 used. It can see candidates
those waves structurally could not: a `kind:data(any)` placeholder that's
never been individually named or declared as a flat array in any `.s` file
doesn't show up in a glob for existing byte-array declarations, but does
show up in a census that walks `symbols.txt` unmatched entries directly and
classifies by actual access pattern.

**Spot-checked, not just tool output**: confirmed no `.c` file exists yet
for the top 5 candidates by size (`data_020c9694`, `data_020c3bc0`,
`data_ov006_021cdea8`, `data_02101e7c`, `data_ov011_021d33bc`) — this is a
real gap in `src/`, not a stale-cache artifact of the census tool.

**Caveat, stated plainly**: shape-classification is not the same as
verified typeability. `data_worklist.py` flags these by reference pattern,
not by confirmed field-boundary evidence — the same evidence bar this
campaign has always required (bulk-copy pattern, function-pointer-typed
field, or independent cross-reference corroboration) still applies before
any of these 274 should actually ship as a real struct. This report's job
was to re-census and reconcile honestly, not to pre-verify 274 candidates —
that's exactly the shape of work a future wave series should pick up,
probably numbered as a fresh series rather than a `cm-data-inference`/
`cm-bss-convert` continuation, since it's a third, distinct discovery
method now that the first two are each individually exhausted.

**Top-weight modules** (struct-shape only, most informative for triage):
`main` 58, `ov006` 33, `ov016` 12, `ov011` 11, `ov009` 9, `ov017` 8,
`ov014` 8, `ov000` 7 — `ov006` in particular already has deep, proven
family precedent from `cm-bss-convert-9`'s `Ov006AudioBank` discovery, so a
follow-up wave scanning `ov006`'s 33 struct-shaped candidates against
`src/overlay006/ov006_core.h` (the same cross-reference trick that worked
last time) is the most promising immediate lead.

## Part 2: `data_02101e7c` — declined a 4th time, one new lead documented

`data_02101e7c` is `data_02101e64`'s flagged-but-uninvestigated sibling
(wave 15: *"adjacent uncarved gap sibling... low-value lead for a future
wave"*), 24 bytes at `0x02101e7c`, one reader.

**Its sole reader treats it as a fully opaque pointer** — weaker evidence
than `data_02101e64` itself ever had:

```
; src/main/func_0206bcec.s
    ldr r0, _LIT1        ; _LIT1 = data_02101e7c
    bl func_0206c46c     ; passed as an opaque argument, no field access here at all
```

**New finding**: `func_0206c46c` is the *same* function `data_02101e64`
gets passed to (see `src/main/func_0206eecc.legacy.c`:
`func_0206c46c(&data_02101e64)` / `func_0206c46c(&data_02101e4c)` on a
`sel` branch). That makes `data_02101e4c` / `data_02101e64` / `data_02101e7c`
three parallel instances of whatever `func_0206c46c` expects — a real,
previously-undocumented structural relationship, and exactly the kind of
"shared consumer" signal that made `cm-bss-convert-9`'s `Ov006AudioBank`
family provable.

**Why this doesn't clear the bar today**: `func_0206c46c` immediately
forwards the pointer into `func_0206c380`, which forwards it again into
`func_0206c2f4` (unread this session) before diverting into an
`OS_DisableIrq`/global-handle/vtable-dispatch sequence
(`ldr r1,[data_0219ecd8]; ldr r1,[r1,#0x18]; blx r1`). Every one of these
is itself a permanent `.s` wall (brief 294/302 GLOBAL_ASM endgame — reg-
alloc-walled, no C match), so there is no C-level field access anywhere in
the chain to anchor a struct layout on. Getting real field evidence would
require reading `func_0206c2f4` and whatever the vtable slot at `+0x18`
dispatches to by hand from raw disassembly — a genuinely open-ended dig,
not a quick follow-up.

**Verdict: declined**, consistent with 3 prior independent waves on
`data_02101e64` itself. The shared-`func_0206c46c` relationship is
documented here for whoever wants to fund the deeper vtable-chain dig; not
chased further this wave to stay within a bounded restock-check scope.

## Part 3: `data_0210594c` / `data_02105989` — still blocked, now precisely scoped

Both are `kind:bss` placeholders in `src/main/bss/data_main_bss_2.s`:

```
        .global data_0210594c
data_0210594c:
        .space 0x3d        ; 61 bytes: 0x0210594c .. 0x02105988
        .global data_02105989
data_02105989:
        .space 0x15         ; 21 bytes: 0x02105989 .. 0x0210599d
        .global data_0210599e
```

Declared boundaries tile exactly (no gap, no overlap) — `0x0210594c + 0x3d
== 0x02105989`. The conflict isn't in the declaration; it's that real code
reads past it. Two confirmed over-reads, both against `data_0210594c`'s
base:

- **Already shipped**, `src/main/func_020191cc.c`: `*(unsigned short
  *)(data_0210594c + 0x52)` — offset `0x52` (82) is already past
  `data_0210594c`'s declared `0x3d` (61) span, landing inside
  `data_02105989`'s territory (offset `0x52 - 0x3d = 0x15` = 21 relative to
  `data_02105989`... which is exactly at `data_02105989`'s own declared
  end, i.e. one halfword straddling into whatever comes right after it).
  This already builds and gates green today — the linker doesn't care
  which symbol name we've drawn a box around a given address, only that
  the absolute address and byte content are right.
- **Still `.s`**, `src/overlay004/func_ov004_021d3de4.s`: `ldrh r2, [r1,
  #0x58]` where `r1 = &data_0210594c` — offset `0x58` (88) is **27 bytes
  (0x1b) past** `data_0210594c`'s declared end, which is **past
  `data_02105989`'s entire 21-byte declared span too** (`0x1b > 0x15`),
  landing 6 bytes into `data_0210599e` — a **third** symbol. This is a
  more precise characterization than the prior filing (which described a
  2-symbol conflict against `data_02105989` alone); it's at least three
  symbols deep.

**Both readers are real and both already ship correctly** (one as merged C,
one as `.s`) purely because absolute-address arithmetic doesn't care about
our symbol boundaries. There is no functional risk here — the risk is
purely that `data_0210594c`/`data_02105989`/`data_0210599e` are almost
certainly one contiguous, larger structure (or a struct with a trailing
array) that got sliced into 3+ arbitrarily-bounded placeholder symbols by
whatever earlier heuristic first named this cluster, and no single-symbol
carve can fix that without redrawing all three boundaries together.

**Scale of a real fix**: `data_0210594c` alone has 16 reader files across 8
modules (`main`, `ov002`, `ov004`, `ov008`, `ov009`, `ov017`, `ov020`, plus
the bss cluster file itself); `data_02105989` has 21 reader files across 8
modules (`main`, `ov004`, `ov006`, `ov014`, `ov015`, `ov017`, `ov023`, plus
the cluster file). That's the same scale of investigation the two prior
attempts already flagged as needing "a dedicated joint investigation, not a
single-symbol carve attempt" — confirmed, not attempted this wave, and
sizing it now for whoever picks it up: expect to read on the order of 30+
distinct reader sites (with overlap between the two symbols' lists) before
a combined boundary can be proposed with confidence.

**Verdict: declined (4th confirmation)**, more precisely characterized
than before. Not attempted as a joint carve this wave — that's a
dedicated-wave-sized task in its own right, exactly as the prior two
declines recommended.

## Recommendations for a future wave

- The 274-candidate list in
  [`cm-data-restock-census-2026-08-03.md`](cm-data-restock-census-2026-08-03.md)
  is real, spot-checked, and ready to carve against — start with `ov006`'s
  33 struct-shaped candidates cross-referenced against
  `src/overlay006/ov006_core.h` (proven method, `cm-bss-convert-9`
  precedent), then `main`'s 58.
- `data_0210594c`/`data_02105989`/`data_0210599e` joint boundary: worth a
  dedicated wave that reads all ~30+ reader sites and proposes one combined
  layout, rather than another single-symbol attempt.
- `data_02101e4c`/`data_02101e64`/`data_02101e7c`: not worth revisiting
  without first reading `func_0206c2f4` and the `data_0219ecd8`-indexed
  vtable dispatch by hand — flagging, not scheduling.
