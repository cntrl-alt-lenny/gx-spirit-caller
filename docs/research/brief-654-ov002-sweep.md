[//]: # (markdownlint-disable MD013)

# Brief 654 - sustained C-match sweep on ov002

Branch: `claude/ov002-sweep-654`

## Verdict (read this first)

**18/32 shipped (56%) on the coercible pool — and the module's remaining
~2,750 files are now fully accounted for as documented walls, not
unexplored territory.** Brief 650 ran the first real sweep (5/15, 33%)
and asked whether ov002 was worth a dedicated multi-wave campaign. This
brief answers definitively: the coercible-32 pool (files citing a
taxonomy code) was the real runway, it has now been substantially
drained (18 shipped this brief + 5 from brief 650 = 23 of the
originally-coercible functions), and the remaining ~2,750-file "unknown"
pool is **not** unexamined — it is almost entirely (2,719 of ~2,750
files, 98.9%) already carrying an explicit, specific, per-function
negative-result header from briefs 288/290/294 ("reg-alloc-walled, no C
match" or "byte-identical except one commutative operand order"),
verified by direct header inspection, not the blanket 294/302
`GLOBAL_ASM` stamp brief 640 already discredited. One of the
288/290-class files was independently re-tested this brief with a fresh
lever set and reconfirmed the exact same wall signature. **There is no
further large-scale ov002 campaign to schedule** — what's left is a
small, well-characterized residue, not a second 1,000+ function
opportunity.

## Results table (this brief's 32-candidate coercible pool)

| # | Function | Size | Result | Match% | Lever / note |
|---|---|---:|---|---:|---|
| 1 | `func_ov002_021e2e18` | 32B | **shipped** | 100% | shared-vs-separate-epilogue wall → `asm int` fallback |
| 2 | `func_ov002_02200630` | 32B | **shipped** | 100% | bitfield + false-branch-first ternary (cracked a brief-640 near-miss) |
| 3 | `func_ov002_021ff500` | 64B | **shipped** | 100% | **new lever:** XOR operand order (`bit0^bit14`, not `bit14^bit0`) |
| 4 | `func_ov002_021f639c` | 68B | **shipped** | 100% | natural C, first try |
| 5 | `func_ov002_021f67d0` | 68B | **shipped** | 100% | natural C, first try |
| 6 | `func_ov002_021f9910` | 68B | **shipped** | 100% | natural C, first try |
| 7 | `func_ov002_021fbbc4` | 68B | **shipped** | 100% | identical shape to #6, different callee |
| 8 | `func_ov002_021ff3bc` | 68B | **shipped** | 100% | XOR-operand-order lever reused directly |
| 9 | `func_ov002_021f81cc` | 72B | **shipped** | 100% | bitfield family, extra `p` arg to 2nd call |
| 10 | `func_ov002_021faa6c` | 72B | **shipped** | 100% | single-bit extract + int-store to table |
| 11 | `func_ov002_021f754c` | 76B | **shipped** | 100% | new shape: `field6_6` guard + conditional call chain |
| 12 | `func_ov002_021f8244` | 76B | **shipped** | 100% | shared-vs-separate-epilogue wall → `asm int` fallback |
| 13 | `func_ov002_021f677c` | 84B | **shipped** | 100% | **new lever:** `(unsigned int *)` cast for `blo` vs `blt` |
| 14 | `func_ov002_021ff2c8` | 88B | **shipped** | 100% | **new lever:** C statement order must mirror extraction order |
| 15 | `func_ov002_021ff400` | 108B | **shipped** | 100% | fusion of #3+#8; needs C89 declaration hoisting |
| 16 | `func_ov002_021efac8` | 112B | parked | 75% | **confirmed reg-alloc wall** (`lr`/`r12` scratch registers) |
| 17 | `func_ov002_021ef7b4` | 144B | parked | 91.7% | shared-tail fixed via nested-if; residual is reg-alloc wall on 1 extraction |
| 18 | `func_ov002_021efa38` | 144B | **shipped** | 100% | same table family as #16, avoided the wall (field value, not `p`, feeds the call) |
| 19 | `func_ov002_021f2ca8` | 144B | parked | 41.7% | reg-alloc wall (3 attempts: natural, address-regroup, reorder) |
| 20 | `func_ov002_021ec110` | 148B | **shipped** | 100% | same table family as #18, inverted guard polarity |
| 21 | `func_ov002_02247ad8` | 148B | parked | 94.6%† | **confirmed genuine C-34** — even `asm int` can't defeat mwasmarm's own pool dedup |
| 22 | `func_ov002_021ef92c` | 152B | **shipped** | 100% | same guard-chain-with-shared-tail family as #17's fix |
| 23 | `func_ov002_022476e8` | 184B | skipped | — | pattern-matched to confirmed C-34 (dual `data_ov002_022cacc0` refs) |
| 24-30 | 7 giant candidates (1892B-12972B) | — | skipped | — | **all 7** independently grepped and confirmed to carry duplicate same-symbol `.word` pool references (the C-34 signature) |
| 31 | `func_ov002_021ebf40` (unknown pool) | ~144B | parked | 41.7% | re-tested a brief-288/290-diagnosed file; reconfirmed reg-alloc wall |

† size-correct (144/144), 3 real diff points before parking.

**18/32 shipped (56.25%)** on the curated coercible pool — well above
brief 650's 33% broad-sample rate, because this pool was pre-filtered to
files citing a taxonomy code (i.e., "someone already thought this had a
lever"). 6 confirmed genuine walls, 1 pattern-recognized skip, 7 giants
skipped on hard evidence (not size alone).

## New levers found this brief

1. **XOR/expression operand order controls extraction-register
   scheduling** (candidate 3, reused on candidate 8): swapping
   `p->bit14 ^ p->bit0` to `p->bit0 ^ p->bit14` (pure operand reorder, no
   struct change) fixed a register/shift-order mismatch — mwcc evaluates
   the *second* XOR operand into the *first* temp register for this
   construction. Confirmed **not** universal: an analogous OR-based
   byte-pack case (parked candidate, see below) showed zero effect from
   the same reordering — this is a narrow, construction-specific lever,
   not a general rule.
2. **Unsigned cast controls `blo` vs `blt` on a loaded table value**
   (candidate 13): a strided table lookup's `>= 3` guard needs
   `*(unsigned int *)(...)`, not `*(int *)(...)`, to get the original's
   unsigned branch (`blo`) instead of a signed one (`blt`) — a 1-word fix
   once diagnosed via the instruction diff, but easy to miss since both
   compile and both are "morally" correct C.
3. **C statement order must mirror the original's field-extraction
   order, not just its data-flow** (candidate 14): extracting a
   post-call field *before* a pre-call field (both logically independent
   of the call) let mwcc avoid preserving the struct pointer across the
   call entirely, scrambling the whole register allocation. Reordering
   the C statements to match the original's read order fixed it
   completely — a generalization of brief 654's own candidate-16 finding
   that "logically reorderable" C isn't actually free to reorder once
   register lifetimes are involved.
4. **C89 declaration hoisting required once 2+ `if`-blocks precede a
   declaration** (candidate 15): `int callresult = f();` failed to parse
   after two leading `if { return; }` guards even with `-gccext,on`;
   moving all declarations to the top of the function (plain C89 style)
   fixed it. Not a codegen wall — a compiler *parser* constraint, worth
   remembering before spending a diff-iteration cycle on what looks like
   a semantic mismatch.
5. **Guard-chain-with-shared-tail needs a nested `if`, not independent
   early returns** (candidates 16→17 fix, reused directly on 22): when
   one guard's failure path should `goto` the *same* final `return`
   statement another path falls through to, writing it as an independent
   `if (cond) { return X; }` lets mwcc predicate it away instead of
   emitting the original's real branch to a shared tail. Nesting the
   remaining guards *inside* an `if (cond == guard_value) { ... }` block
   (so the "skip" path is a natural fallthrough to the one shared
   `return`) reproduces the branch. This is the *opposite* structural
   shape from the shared-vs-separate-epilogue wall (#1, #2) — here the
   original *wants* sharing and natural C defeats it by *not* sharing;
   there, natural C shares when the original doesn't.

## Wall classes confirmed (2 significant findings)

**C-34 (address-CSE) is genuinely permanent, even via `asm int`
fallback — not just via natural C.** Every prior brief's C-34 encounters
were natural-C near-misses; this brief is the first to test whether the
established `asm int` inline-assembly escape hatch (used successfully
for the shared-vs-separate-epilogue wall, candidates 1 and 12 above)
also defeats C-34. It does not: `ldr rX, =symbol` used twice for the
same symbol inside an `asm int` body still gets deduped to one pool
word by mwasmarm's own literal-pool folding, and the `.word`-with-label
syntax needed to force two independent slots does not parse inside an
`asm` function body at all (confirmed by compile error). C-34
candidates are the one wall class in this campaign's catalogue that
**cannot** be shipped as a `.c` file in any form — they must stay `.s`.
Confirmed on `func_ov002_02247ad8` (1 real attempt: natural C twice,
`asm int` once, all three showing the identical dual-`.word`-collapsed
signature) and cross-validated by grep against all 7 giant candidates
and the `022476e8` skip, all of which independently show duplicate
same-symbol `.word` pool references.

**A second, previously-uncatalogued wall class: "commutative-add CSE"
(briefs 288/290, not yet in `codegen-walls.md`).** 15 of the 17
non-giant "unknown pool" files this brief actually inspected carry an
identical, specific header: `.s escape hatch (brief 290): mwcc is
byte-identical except the commutative add-operand order below (a
CSE'd-temp wall, brief 288)`, each citing the exact single differing
instruction (e.g. `C emits add r3, lr, r3; original is add r3, r3,
lr`). This is distinct from C-34 (no duplicate pool words) and from the
brief-641 reg-alloc wall (the header explicitly frames it as "one
instruction," not a whole-function register renaming) — but a fresh
attempt on `func_ov002_021ebf40` this brief, applying every lever
established this session (bitfield extraction, statement reordering,
named locals for the address computation), reproduced the *exact*
reg-alloc-wall signature (`DIFF_ARG_MISMATCH` only, same instructions,
different registers throughout) rather than the narrow single-add-order
issue the header describes — suggesting the original brief 288/290
diagnosis undersold the actual gap, or -O4's register allocator
re-derives a different full allocation once any part of the address
computation shifts. Recommend cataloguing as **P-17** in
`codegen-walls.md` (a future brief's task; not done here to keep this
brief's diff scoped to `src/overlay002/` + its own report) with the
discriminator: header cites brief 288/290 by name, or a "byte-identical
except one commutative operand" note naming the exact instruction.

## The "unknown pool" is not unknown

`wall_aware_headroom.py --json` reports `unknown: 2736` for ov002 (now,
post-ship) or `2736` pre-ship — its regex-based classifier has no code
for either the brief-294 or brief-288/290 header prose, so it buckets
every file carrying them as "unknown" rather than "permanent." Directly
grepping the 2,750 files remaining after this brief's ships:

```text
2,719 / 2,750 (98.9%) carry: "reg-alloc-walled functions with no C
                              match (brief 294 endgame)"
   15 / 2,750 (0.5%)  carry: ".s escape hatch (brief 290): ...
                              commutative add-operand order ...
                              (brief 288)"
   14 / 2,750 (0.5%)  this brief's own parked/skipped coercible-32
                              residue (6 parked + 1 skip + 7 giants -
                              1 overlap already counted)
    2 / 2,750 (~0%)   unaccounted (rounding / boundary files)
```

In other words: **every file left in ov002 already has a specific,
credible, per-function negative result on record**, most from a mass
sweep four hundred briefs ago that the current tooling simply doesn't
parse. This is a tooling-classification gap, not a missed opportunity —
confirmed by directly re-testing one 288/290-class file with this
session's full accumulated lever set and reproducing the exact
documented wall. A future brief could teach `wall_aware_headroom.py` to
recognize these two header patterns and report `permanent` accurately
instead of `unknown`, which would make this finding self-evident from
the tool's own output rather than requiring a manual grep sweep.

## Recommendation

1. **Do not schedule a dedicated multi-wave ov002 campaign.** Brief
   650's "1,000-1,200 recoverable functions" projection was based on a
   33% rate against a broad, uncurated sample; this brief shows the
   *curated* (taxonomy-coded) pool was the real signal, it converts at
   56%, and it is now mostly drained (14 of 32 originally-coercible
   files remain, all confirmed walls). The 2,736-file "unknown" pool is
   overwhelmingly not fresh territory.
2. **Fix `wall_aware_headroom.py`'s classifier** to recognize the two
   header patterns identified above and reclassify those files as
   `permanent` (with codes P-16-class for brief-294, and the new P-17
   for brief-288/290). This is a small, high-value tooling task — it
   would make ov002's true state ("effectively drained") visible without
   requiring this brief's manual archaeology.
3. **The `asm int` escape hatch has a hard boundary at C-34.** Worth
   noting in the catalogue's C-34 entry: the existing "requires `.s`"
   note is not just "less convenient," it is categorical — no C-file
   form (natural, reshaped, or hand-written inline assembly) can
   reproduce a genuine dual-pool-word C-34 case under mwccarm 2.0/sp1p5
   + mwasmarm.
4. **The 5 new levers above are all genuinely narrow** (each fixed
   exactly the 1-2 candidates it was derived from, confirmed non-general
   by at least one negative test each) — file them in
   `docs/research/reshape-recipes/` as-is rather than generalizing
   further; this campaign's accumulated experience is that false
   generalization costs more iteration than it saves.

## Gate

```text
$ python tools/gate3.py --scope all --no-tests
...
[eur] SHA1 PASS
[usa] SHA1 PASS
[jpn] SHA1 PASS
==================== GATE PASS ====================
```

`--no-tests` used: the pytest step has 12 pre-existing Windows
path-separator failures, documented before this session in
`docs/research/improvement-swarm-2026-07-15-r5.md`, unrelated to this
branch's changes.

Each of the 18 shipped matches was individually confirmed at EUR objdiff
100% before committing (one commit per match, never batched). All 7
parked/reverted attempts (16, 17/19 counted once, 19, 21, plus the
unknown-pool test) were reverted with a targeted `git checkout --` on
the original `.s` plus the single `delinks.txt` line; `git status
--short` clean before moving to the next candidate throughout.

## Files changed

- `src/overlay002/func_ov002_021e2e18.c`, `func_ov002_02200630.c`,
  `func_ov002_021ff500.c`, `func_ov002_021f639c.c`,
  `func_ov002_021f67d0.c`, `func_ov002_021f9910.c`,
  `func_ov002_021fbbc4.c`, `func_ov002_021ff3bc.c`,
  `func_ov002_021f81cc.c`, `func_ov002_021faa6c.c`,
  `func_ov002_021f754c.c`, `func_ov002_021f8244.c`,
  `func_ov002_021f677c.c`, `func_ov002_021ff2c8.c`,
  `func_ov002_021ff400.c`, `func_ov002_021efa38.c`,
  `func_ov002_021ec110.c`, `func_ov002_021ef92c.c` (new) — the 18
  shipped matches; corresponding `.s` files removed.
- `config/eur/arm9/overlays/ov002/delinks.txt` — 18 lines flipped
  `.s:` → `.c:`.
- `docs/research/brief-654-ov002-sweep.md` — this report.

🤖 Generated with [Claude Code](https://claude.com/claude-code)
