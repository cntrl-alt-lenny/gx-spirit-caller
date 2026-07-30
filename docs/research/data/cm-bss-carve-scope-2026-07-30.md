# cm-bss-carve-scope — scoping the `.bss` workstream

2026-07-30. `cm-data-typing-16` established `.bss` as 85.2% of all EUR
data bytes and confirmed 0% C-owned. This item scopes what actually
attacking that would take — with an empirical proof-of-concept, not just
a proposal — and answers the four questions the item asked.

## 1. What does a `.bss` carve require? What exists, what's missing?

**Checked the two named tools directly; neither applies.**
`tools/batch_carve.py` carves `kind:function` symbols out of raw `.text`/
`.init` — its own regexes (`_SYM_RE`, `_CARVED_RANGE_RE`) are
function/code-section-specific by construction, and its whole
verification model (`asm_escape.py`'s disassemble→reassemble→byte-compare
loop) doesn't apply to data at all. `tools/emit_data_blob.py`'s name is
misleading: per its own docstring it's a "whole-function-as-data
emitter" — a workaround for *functions* whose disassemble/reassemble
round-trip can't reproduce the original bytes, emitting the same bytes
as raw `.byte` directives instead of instructions, while deliberately
**keeping `kind:function`** in symbols.txt ("Reclassifying to `kind:data`
... was evaluated and rejected"). Neither tool writes a `.c` declaration,
and neither touches `.bss`.

**What actually exists, and it changes the whole picture**: dsd's own
symbol analysis has already named and addressed **1,592 individual
`kind:bss` entries** across EUR's `symbols.txt` files — the exact same
kind of per-symbol boundary discovery this campaign has relied on for
`kind:data(any)` all along. Beyond that, a prior effort (briefs 118/139,
"Cluster A .bss wave N") already converted every one of those into an
explicit, per-symbol `.global name` / `.space N` breakdown inside one
`.s` file per module (`src/overlay<NNN>/bss/data_ov<NNN>_bss.s`,
`src/main/bss/data_main_bss.s`) — this exists for **every EUR module
except two** (`ov000`, `ov002` — see §4), and in parallel for USA and
JPN too. Example (`src/overlay023/bss/data_ov023_bss.s`, before this
item's proof-of-concept):

```
        .global data_ov023_021b23a0
data_ov023_021b23a0:
        .space 0x8
        .global data_ov023_021b23a8
data_ov023_021b23a8:
        .space 0x58
```

**So "carving" `.bss` does not mean discovering symbol boundaries from
scratch.** That work is already done, project-wide, down to the byte.
What's missing is the step this campaign has always done for `.data`/
`.rodata`: converting each already-named, already-sized, already-bounded
placeholder into a real `.c` declaration — here starting one notch more
raw than usual (assembly `.space` directives instead of an opaque
`unsigned char[N]` array), but mechanically simpler for exactly that
reason.

## 2. Does `progress.py` even see `.bss` work? (measured first, not assumed)

**Yes — `.bss` is in `DATA_SECTIONS`, and `summarize_data_readability`'s
TU-ownership walk is section-agnostic.** Confirmed both by re-reading the
source (wave 16) and empirically, via the proof-of-concept below:

- `Named-struct` moved **exactly +8 bytes**, matching the shipped
  struct's size precisely, when the carved symbol was declared as a
  bracket-less scalar struct instance (`Ov023DispatchState
  data_ov023_021b23a0;`, no `[N]`).
- `Typed-array` did **not** move for that same carve — also expected,
  not a bug: `_DATA_ARRAY_DECL_RE` requires square brackets, so a
  bracket-less scalar instance is invisible to it by design (the
  documented `_tu_has_named_struct_decl` behavior from
  `q-metric-singleton-struct-gap` — `named_struct_bytes` is **not** a
  strict subset of `typed_array_bytes` for exactly this shape).
- An **array-shaped** `.bss` carve (`Type name[N];`, no initializer) would
  be picked up by `Typed-array` too — the regex's `(?:=|;)` alternation
  explicitly allows a declaration with no initializer, which is exactly
  what every `.bss` declaration necessarily is. Not independently
  re-verified with a second, array-shaped proof-of-concept this pass
  (one clean empirical case plus direct confirmation from the metric's
  own source was judged sufficient rigor for a scoping document), but
  there is no part of the regex or the surrounding logic that
  distinguishes `.bss` from any other `DATA_SECTIONS` member.

**This makes `.bss` the highest-leverage-per-byte category available.**
Every other section already has some fraction counted; `.bss` currently
contributes zero to either metric while already being fully counted in
both metrics' shared denominator (`data_total_bytes` includes it
unconditionally) — so converting even a modest slice moves the
percentage far more than an equivalent amount of `.rodata`/`.data` work
would.

## 3. Is `.bss` safely carvable? Where does the risk actually sit?

**Structurally lower-risk than `.rodata`/`.data`, not higher.** `.bss` is
uninitialized/zero-filled RAM, not ROM content — there are no bytes to
preserve or verify, ever, which removes this campaign's single largest
historical risk category by construction (the wave-11 hand-transcription
bug, and the entire class of rule the never-hand-transcribe policy
exists for, simply doesn't apply here: there is no content to transcribe
correctly or incorrectly).

The entire risk surface is:
- **Size.** Already known exactly, for every existing symbol, from the
  `.space N` directive dsd/brief 118 already computed. Getting it wrong
  shifts every later symbol's address and fails `ninja sha1` immediately
  — the same detection this campaign already relies on everywhere else.
- **Section (must stay non-const).** Unlike `.rodata` vs `.data` (a real,
  easy-to-get-wrong choice governed by this project's own const-placement
  rule), `.bss` placement is **self-enforcing by the C language itself**:
  a `const`-qualified global with no initializer is not valid C (`const`
  requires initialization). There is no way to accidentally write a
  `.bss` declaration that compiles *and* ends up in the wrong section —
  the compiler would simply reject a const, uninitialized global outright.
- **TU-splitting mechanics**, carving one symbol out of a cluster file
  that currently claims the whole module's `.bss` as one TU. Not a new
  risk category — this campaign has split TUs at proven boundaries many
  times before — and it was exercised for real in this item's own
  proof-of-concept (below), gate-clean on the first attempt.

## 4. The 0.8% (32,768 B) genuinely-unclaimed slice

**Not a mysterious residual category — it's exactly the two EUR modules
that the brief-118/139 cluster-file sweep never reached.** Every other
EUR overlay (001, 003–023) plus `main` has its own
`bss/data_ov<NNN>_bss.s` (or `bss/data_main_bss.s`); `ov000` and `ov002`
are the sole exceptions, and their `.bss` sections
(`0x021c73e0`–`0x021c9d60`, 10,624 B; `0x022cd300`–`0x022d2980`,
22,144 B) have **zero TU entries at all** — not raw-`.s`-claimed, not
gap-placeholder-claimed, nothing. `ov000`/`ov002` are the two overlays
CLAUDE.md already documents as sharing a base address (an overlay-swap
pair dsd's own analysis has special-cased before, per the `dsd init
--allow-unknown-function-calls` note) — plausibly why the original sweep
skipped them, though this item didn't dig into brief 118's own history
deeply enough to confirm that's the actual reason rather than just an
oversight. **A real, well-scoped "catch up to parity" candidate** (apply
the exact same proven cluster-file convention used everywhere else) —
but not this item's proof-of-concept, since it needs its own check for
whether the ov000/ov002 address-sharing quirk complicates a
straightforward `.space`-cluster construction there specifically.

## Proof-of-concept: `data_ov023_021b23a0` (shipped this item)

Not a proposal — an executed, gate-verified carve, chosen specifically
because it needed zero additional consumer investigation: an
already-matched, byte-verified consumer (`func_ov023_021b2314.c`)
already declares `extern Ov023DispatchState data_ov023_021b23a0;` and
uses both fields (`.idx` as a dispatch-table index, `.f4` cleared on
completion) — `{int idx; int f4;}` = exactly 8 bytes, exactly matching
the original `.space 0x8`. The type was already proven; only the
*definition* side had never caught up.

Split `src/overlay023/bss/data_ov023_bss.s`'s single `.bss` TU entry
(`0x021b23a0`–`0x021b2400`, both symbols) into two: a new
`src/overlay023/data_ov023_021b23a0.c` (`.bss 0x021b23a0`-`0x021b23a8`)
declaring the real struct with no initializer, and the same `.s` file
retained for the second, still-uncarved symbol
(`.bss 0x021b23a8`-`0x021b2400`). `ninja sha1` (EUR) passed on the first
attempt; full 3-region `gate3.py --scope all` PASS. `Named-struct`
44,728 → ... → 50,104 (wave 16) → **50,112 (+8, this item)**.

## A much larger, concrete pool: 462 symbols with an already-proven type

Scripted discovery (session scratchpad, not a committed tool): every
symbol still defined in an EUR `bss/*.s` cluster file (1,422 of them),
cross-referenced against every `extern <Type> data_X;` /
`extern <Type> data_X[...];` declaration in an already-*matched* `.c`
consumer elsewhere in the tree. **462 of 1,422 (32.5%) have at least one
such reference** — meaning the type is already asserted, by real shipped
code, with zero fresh consumer-evidence investigation needed to start
the same substitution this item's proof-of-concept just did once.

**Caveats before treating this as a ready-to-convert list, not a final
count** (consistent with this campaign's standing "state where a count
came from, don't over-claim precision" rule): this was a quick regex
scan, not a verified one. It does **not** check that all of a symbol's
multiple consumers (several symbols have 5-10) agree on an identical
type — a real reconciliation step, same as any multi-consumer struct
this campaign has typed before. It also does **not** check whether the
extern covers the symbol's *full* declared size or only a leading
portion — the `data_ov001_021ca420` case surfaced during this item's own
investigation is exactly that trap: its matched consumer proves a clean
4-byte bitfield struct, but the symbol's real `.space` size is 32 bytes,
meaning 28 bytes are still unevidenced and would need the same
partial-struct-plus-honest-gap treatment this campaign has used
elsewhere (not a blocker, just real per-symbol work, not a rubber stamp).

## Recommendation

**A real, well-scoped, low-risk workstream — not "not worth it."**
Structurally simpler than typical `.data`/`.rodata` work (no byte-content
risk at all), already has its hardest sub-problem (boundary discovery)
solved project-wide, is empirically proven to move both readability
metrics for the shapes that apply, and already has a concrete, sizeable
first-item pool (462 candidates, once individually reconciled) that
needs no fresh per-symbol investigation to start.

**First real item for the next wave**: work the 462-symbol pool,
per-symbol reconciliation (multi-consumer type agreement, full-vs-
partial size) using the exact method this item's proof-of-concept
validated — never hand-transcribe (moot here, no bytes exist to
transcribe, but the size/boundary must still come from `symbols.txt`/
the `.s` file's own `.space` value, not memory), reconcile every claim
against `git diff --stat` before writing docs, one consolidated
verification pass for a multi-file batch. Size-first prioritization
doesn't directly apply the way it did for `cm-data-typing-16` (`.bss`
symbols are individually small relative to `.rodata`'s biggest files),
so prioritize by **evidence strength** instead: symbols with a single,
unambiguous, full-size-matching consumer type first (this item's own
proof-of-concept shape), multi-consumer reconciliation second, and defer
partial-coverage cases (the `data_ov001_021ca420` shape) to their own
pass.

**Mechanically checkable gate for that future wave**: 3-region
`gate3.py --scope all` PASS (as always) + a per-symbol table of which of
the 462 were converted vs deferred and why + `Named-struct`/`Typed-array`
before/after, same as every prior wave.

**Not recommended this pass, explicitly excluded per the filing item's
own instruction**: `ov004`'s unclaimed `.rodata` gaps (already
established as likely more veneer code, wave 13/`cm-data-typing-16`) —
not reopened, not touched.

## Gate

`ninja sha1` (EUR) PASS, first attempt. Full 3-region
`python tools/gate3.py --scope all` PASS (`[eur]`/`[usa]`/`[jpn]` SHA1
individually confirmed; pytest 3125 passed, 15 skipped, 63 subtests).
`Named-struct`: 50,104 → 50,112 (+8, the proof-of-concept). `Typed-array`:
unchanged at 79,664 (correctly — the carved declaration is a bracket-less
scalar instance, not an array; see §2).
