[//]: # (markdownlint-disable MD013 MD041)

# Brief 536 — the last easy c-match wave: safe-queue-v4's final 8

**Brief:** 536 (Claude scaffolder). Own worktree `claude-536`, branch
`claude/cmatch-final8-536`. Attempt the 8 genuinely-untried candidates from
[`safe-queue-v4.md`](campaign-analytics/safe-queue-v4.md)'s "The 8 genuinely
open rows" — the last candidates from the safe-queue methodology that had
never actually been drafted, verified via the brief-534-fixed module-aware
`containment_check.py`. Also owns a small byproduct cleanup: 6 EUR `main`
delinks.txt lines flagged stale by brief 534.

## What shipped — 1 of 8, 3-region

| addr | module | size | result |
|---|---|---:|---|
| `0225368c` | ov002 | 92B | **MATCHED, 3-region** |

`func_ov002_0225368c` (`CardHandlerTable` dispatch) — binary-search a card
ID to a handler-table index via `func_ov002_02253638`, clear a ctrl-state
result field, then (if found) call the stride-8 handler-table's function
pointer with `(ctx, card_id, arg2)`; return whatever the handler left in
the result field. First-draft C matched byte-for-byte on the first
compile — confirmed via `objdump -h` exact-size match, the brief-534-fixed
`containment_check.py` (module auto-resolved to `ov002`, 0-byte diff), and
a direct `cmp -l` on the rebuilt `ov002.bin` against both the EUR and
ported USA overlay (0 differing bytes, matching sizes, both regions).
Ported to USA/JPN via `port_to_region.py` (4/4 symbols HIGH/EXACT/
SYNTHESIZED, address `022535a4` both regions) — the tool only writes the
`.c` file and prints (doesn't apply) the delinks.txt entry, so both
regions' `delinks.txt` were hand-edited to swap the existing `.s` line to
`.c` at the matching `start`/`end`.

Note: the dossier's own recipe sketch for this address had the RIGHT
general shape but the wrong stride assumption (guessed a plain 4-byte
function-pointer array; the real table is stride-8, `{fn_ptr; pad;}`) —
resolved by reading the real `.s`'s `ldr r3,[r1,r2,lsl#3]` directly rather
than trusting the sketch's array type.

## Candidates attempted and parked (real near-misses, not walls)

All four compiled to their exact declared size on a first or early draft —
none avalanched — but each has a small residual that resisted every lever
tried (declaration reordering per gotcha 11, expression restructuring,
`goto`-based shared tails, exact source-idiom matching for shift
sequences). Consistent with this session's broader finding: these are
genuine mwcc register-allocator tie-breaks or codegen-fusion floors, not
missing C-shape insight.

| addr | module | size | residual |
|---|---|---:|---|
| `020384e8` | main | 172B | 3 of 4 upstream register roles fixed exactly (row/dst/counter-equivalent locals) via gotcha-11 reordering; the `sum`-loop's `n`/scratch pair (r1↔r2) stayed swapped through 3 different restructurings (statement reorder, fold-away, `k`-before-`n`). |
| `021b0a30` | ov002 | 220B | Upstream (32 instructions incl. two redundant `handler` re-fetches) now matches **exactly**, register-for-register, after discovering the fix was to stop caching the struct pointer in a local (`data_ov002_022d016c.field` direct access, not `struct *dss = &data_...`) — original reloads the pool constant fresh at each use site. Tail (`f_d00==2` parity flip) is stuck between two extremes: a shared-variable form the compiler over-optimizes to a single predicated `eorNE` (208B), and a duplicated-per-branch form that needs one extra branch the original avoids via full 4-instruction predication (224B, `+4` over) — neither hits 220B exactly. |
| `0228791c` | ov002 | 176B | The 6-way type-dispatch ladder (`bgt`/`bge`/`blt`/`cmpne` chain for `{6,7,8,0x1f,0x20,0x21}`) matches **exactly** once the `switch` cases branch directly into the match-check block instead of setting an intermediate flag; walking-pointer restructuring (matching original's incremental `lr++`/`r4+=4` instead of indexed `[i]` access) closed most of the gap (196→172B). Final 4B residual is mwcc fusing a `(f0<<15)>>31 ^ (f0<<22)>>31` bit-XOR into fewer instructions than original's un-fused sequence — resisted reordering, named temps, and `volatile`. |
| `021ae218` | ov000 | 180B | Dossier's own recipe sketch had the **wrong bit numbers** (guessed bits 20/21/22; real bits, decoded from the `lsl`/`lsr` shift amounts, are 11/9/10) and wrong toast-call argument order — both corrected via direct `.s` tracing, and the corrected control-flow (a `busy = e84() \|\| e5c()`-style short-circuit OR, not the sketch's nested if/else) reproduced the exact idle-check structure. Final 6-byte residual is a stable r0↔r1 swap for which register holds the persistent `f270` value during the two-bit-test sequence — unmoved by explicit temps, statement order, or condition nesting (nesting also risked reordering the actual bit11-then-bit9 test sequence, which had to stay put). |

**Not attempted this wave** (deferred, higher complexity/risk than the
remaining time budget supported): `021ae2cc` (ov000, 200B — 3 unknown-
signature callees, hand-built 3-word stack-argument block, fused `mla`
2D table indexing); `021ca70c` (ov013, 192B — contains a **manually-
encoded `.word` branch** to `0x021b13b8`, a call target `relocs.txt`
marks `module:none`, i.e. dsd itself couldn't attribute an owning module
to the destination; reproducing an unnamed cross-module relative branch
from C isn't a normal `extern`+`bl` case); `021cca04` (ov011, 212B — two
independent clamp operations with an early-return embedded mid-sequence,
a `GetSystemWork()`-gated conditional low-bound, and a repeated bit-field
re-extraction). All three remain genuinely untried, not walled — a future
wave with a full budget could reasonably attempt them.

## Byproduct cleanup — 6 stale EUR `main` delinks.txt lines

Brief 534 flagged these as declaring a deleted `.s` while only the
matched `.c` exists (lost in an earlier multi-branch merge): `0200c078`,
`0200c284`, `02030b84`, `02031208`, `02031684`, `02031c8c`. Fixed all six
(`.s` → `.c` in `config/eur/arm9/delinks.txt`). Confirmed cosmetic-only —
`ninja` reported "no work to do" for all six objects post-fix, since
`configure.py` already discovered and built from the `.c` files by
filesystem glob, not by trusting delinks.txt's text (the same mechanism
that let the staleness go unnoticed).

## Process note

Two dossier sketches this wave (`021b0a30`, `021ae218`) had verified-
looking "Complete C sketch" / "Recipe sketch" blocks that turned out to
have real errors (wrong argument order, wrong bit numbers, missing a
conditional store, wrong control-flow shape) once checked against the
actual `.s`. Both were still useful as a starting orientation (struct
field offsets, callee names, overall shape), but neither was safe to
apply verbatim — consistent with this whole campaign's running lesson
that ground-truth dossiers speed up *understanding*, not codegen, and
the `.s` remains the only authority for exact behavior.

## Final gates

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

EUR and USA additionally confirmed via direct `cmp -l` on the rebuilt
`ov002.bin` against each region's extracted original (0 differing bytes,
matching sizes) — not just the aggregate ROM sha1.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
