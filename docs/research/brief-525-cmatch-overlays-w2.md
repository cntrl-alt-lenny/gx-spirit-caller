[//]: # (markdownlint-disable MD013 MD041)

# Brief 525 — overlay-tail C-match wave 2

**Brief:** 525 (Claude scaffolder). Owns overlay-tail delinks:
ov000/005/006/011/013/016/019/022. Retry the 2 near-misses parked by brief
523 (`021b79ac` ov006, `021ac91c` ov005) with the b524-verified levers
(`recipe-gotchas.md` gotchas 27-34), then attack fresh RETRIAGE candidates.

## Headline finding — `containment_check.py` has a silent truncation blind spot

Before any match results: **`containment_check.py` compares `build/<region>/build/arm9.bin`
against `extract/<region>/arm9/arm9.bin` only over the byte range of the
*shorter* of the two files.** If a candidate's compiled `.text` grows even
by a few bytes relative to the true gap size, every byte beyond the shorter
file's length is simply never compared — the tool reports `0 diff /
CONTAINED` regardless. This is not a hypothetical: it produced false
"contained" verdicts for **three separate candidates this wave**
(`021ac098`, `021b79ac`'s first draft, and `021abcc4`), each confirmed only
by falling back to a fully trusted, independent check:

1. `arm-none-eabi-objdump -h build/<region>/src/overlayNNN/func_....o` —
   the object's own `.text` size must equal `delinks.txt`'s `end - start`
   exactly.
2. `ninja rom` then `cmp -l build/<region>/build/arm9_ovNNN.bin
   extract/<region>/arm9_overlays/ovNNN.bin` on the **whole rebuilt
   overlay** — must report 0 differing bytes, with matching `ls -la` sizes
   as a sanity check on top.

Both checks are needed: size-only would miss a same-size *content*
mismatch (this wave's `021abcc4` and the second-draft `021ac91c` both
compiled to the exact expected size yet still differed in content — see
below), and containment-only would miss a size regression the tool can't
see past. **Recommend the brain treat every prior wave's containment-only
"MATCHED" verdicts (e.g. brief 523's `021b8d9c`/`021ab460`) as unverified
until re-checked with this two-part method** — this bug isn't specific to
this wave's candidates, it's in the shared tool every lane calls.

## What shipped — 1 genuine 3-region match

| addr | module | size | result |
|---|---|---:|---|
| `021b79ac` | ov006 | 116B | **MATCHED, 3-region** |

`func_ov006_021b79ac` — clears a slot's active-bit in a stride bitmask
table, zeroes its u16 slot entry, `Fill32`s its row, then notifies a
sibling function. Brief 523 had parked this as a "2-register role-swap"
near-miss. Re-diagnosis this wave found the *actual* bug was not a
register-allocation issue at all: the notify call's real first argument
(read directly off what's live in `r0` at the call site) is a literal
`0` left over from an earlier unrelated assignment, not the reloaded
`self` pointer a same-named C parameter would suggest:

```c
/* wrong: assumes the call re-passes self */
func_02009278(p, slot);

/* right: r0 never gets reloaded before this call */
func_02009278(0, slot);
```

Confirmed via `objdump -h` exact-size match and `cmp -l` 0-byte diff on
the full rebuilt `ov006.bin`. Ported to USA/JPN via `port_to_region.py`
(2/2 symbols HIGH/EXACT, address `021b78ac` both regions) — note the tool
only writes the `.c` file and *prints* a delinks.txt entry, it does not
apply it; both regions' `delinks.txt` were hand-edited to swap the
existing `.s` line to `.c` at the matching `start`/`end`.

## Candidates re-attempted and parked (with real progress, not just re-confirmed)

| addr | module | size | result | reason |
|---|---|---:|---|---|
| `021ac91c` | ov005 | 104B | near-miss, deepened | See below — 2 of 4 live registers now provably fixed; 1 pair remains. |
| `021ac098` | ov000 | 172B | wall confirmed | Genuine compiler-optimization floor, not a source-shape issue. |
| `021b5f60` | ov006 | fresh find | real bug fixed, 1 remains | New candidate this wave; call-ordering bug fixed (60→28 byte diff), a second register-choice issue persists. |

**`021ac91c`** (`CardList_WriteTileRow`, nested 32-row × f_14-column pack
loop). Brief 523 described this as a single "row-counter vs loop-index"
swap; closer work this wave shows it's a **4-register** tangle
(`row`/`dst`/`counter`/`col` cycling through `{r3,r4,lr,ip}`), of which
splitting the combined `*dst++ = (counter++) | ...;` statement into three
separate statements (assignment, then two independent `++`) fixed `row`
and `dst` outright — both now land on the original's exact registers
(`lr`, `r3`). Only `counter`/`col` remain swapped (mine: counter→`ip`,
col→`r4`; original: counter→`r4`, col→`ip`). Tried against this residual
pair: gotcha 11 declaration reordering (all permutations — zero effect,
byte-identical output regardless of order), scoping `col` inside vs
outside the outer loop (zero effect), and swapping the `counter++`/`dst++`
statement order (zero effect). This pair's allocation appears to be a
whole-function global decision the compiler makes independent of any
source-level reordering tried — a genuine mwcc internal tie-break, not a
lever we're missing. Left as `.s`.

**`021ac098`** (6-way zone classifier over a `word0`/`word1` bitfield
struct). Fully attempted this wave (brief 523 had skipped it). Found and
fixed a real logic bug (a traced register gets overwritten mid-function,
so the final threshold subtraction reads `byte1_of_word1`, not `word0`)
and restructured the shared-tail branches per gotcha 34's `goto`
principle — got to a 4-byte-short `.text` (0xa8 vs 0xac). Root cause:
extracting a byte via `(word1 << 24) >> 24` (equivalently `word1 & 0xff`
or a cast) collapses to a single `AND` under this compiler's optimizer,
while the original's disassembly genuinely spends 2 instructions
(`lsl #0x18` / `lsr #0x18`) on it. Tried `#pragma opt_strength_reduction
off` (gotcha 27) — no effect; this is a different optimization
(symmetric-shift-to-mask collapse) than the pointer-increment case
gotcha 27 documents. A symmetric shift pair reducible to a mask is, as
far as we can tell, **unavoidable** at the C level on this compiler —
every phrasing produces the same one-instruction `AND`. Left as `.s`.

**`021b5f60`** (fresh RETRIAGE find, ov006 — per-slot table-copy against
two literal-pool tables plus a call to a sibling function). Found the
call to `func_ov006_021b805c(self)` was present but positioned after
local setup instead of as the function's first statement — moving it
first cut the overlay-level diff from 60 bytes to 28. Remaining 28 bytes:
the two literal-pool table base addresses land in different physical
registers (`ip`/`r3` here vs `r0`/`lr` in the original) — tried explicit
named locals for both tables and reordering the `slot=0` initialization
relative to the table loads; neither shifted the allocation. Left as
`.s`.

All three parks are semantically 100% correct (confirmed via
instruction-by-instruction mechanical diff against the original
disassembly) — either a register-allocator tie-break resistant to every
source-level lever tried, or a compiler-optimization floor that can't be
worked around from C at all. Not re-grinding further this wave; a fresh
angle (permuter probe, or a lever not yet catalogued) is the likely
unlock for the two register-tangle cases.

## Process note — re-verify before trusting a prior "confirmed" result

Both `021ac098` and `021abcc4` were, at different points earlier in this
same session, believed fixed and confirmed via containment_check before
a fresh `objdump -h` / `cmp -l` pass caught the truncation blind spot
above and reopened them. Lesson carried forward: **any candidate's "green"
result is only as trustworthy as the last time it was checked with the
two-part method** — re-verify fresh after every subsequent edit to the
same overlay, not just once per candidate, since a sibling function's
edit can change the overlay's total size and shift what containment_check
happens to be blind to.

## Final gates

```text
gx-spirit-caller_eur.nds: OK
gx-spirit-caller_usa.nds: OK
gx-spirit-caller_jpn.nds: OK
```

Each region additionally confirmed via direct binary comparison of the
built `ov006` overlay against the extracted original (`cmp -l` — 0
differing bytes, matching sizes), per the trusted two-part method above —
not just the aggregate ROM sha1.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
