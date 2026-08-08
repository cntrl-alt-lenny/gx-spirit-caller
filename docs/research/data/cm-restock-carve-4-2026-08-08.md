# cm-restock-carve-4 — applying TU composition at scale, and testing backward absorption (2026-08-08)

Fourth wave of the restock-census carve series. Wave 3
([`cm-restock-carve-3`](cm-restock-carve-3-2026-08-08.md), #1476)
established that the `ALIGNALL(2)` alignment wall is avoidable by TU
composition, on one verified pair, under a precondition the brain's
review corrected before merge: the composed span must be **4-aligned
at both ends** (start AND size, not size alone). This wave applies
that corrected recipe to the rest of the misaligned population, and
tests the other open half — backward absorption — on the one group the
recipe structurally cannot reach.

## Part 1 — the both-ends screen

Fresh cross-reference of the census's 35 misaligned struct candidates
against the **current** `delinks.txt` state (2 of the 35 — the
`data_ov016_021b9000`/`_021b900a` pair — were already carved in wave 3
as the Part 2 experiment; they passed this exact screen, which is why
they shipped). Adjacent misaligned symbols were grouped into
contiguous runs (a run = consecutive symbols where one's end address
equals the next's start), then each run's combined span was checked
for 4-alignment at **both** the start and the end.

| Run (module: symbols) | Span | Start%4 | End%4 | Verdict | Reason |
|---|---|---:|---:|---|---|
| ov000: `021b55de` | `0x021b55de`-`0x021b55e4` (6B) | 2 | 0 | **FAIL** | Isolated single symbol, start misaligned, no adjacent misaligned partner |
| ov004: `021de7e5` | `0x021de7e5`-`0x021de7f9` (20B) | 1 | 1 | **FAIL** | Isolated single symbol, 1-byte-misaligned at both ends (harder class, matches `ov004-odd-aligned-slot-recipe.md`'s territory) |
| ov005: `021b1a44`,`021b1a76`,`021b1aa8`,`021b1ab2` | `0x021b1a44`-`0x021b1abc` (120B) | 0 | 0 | **PASS** | 4-symbol run, both ends aligned |
| **ov006: `021ce38a`,`021ce3ae`,`021ce3d6`,`021ce3fe` (the wave-1 `kv_t` group)** | `0x021ce38a`-`0x021ce426` (156B) | **2** | **2** | **FAIL** | Every member's own size is `%4==0`, but the run's start AND end both sit at `%4==2` — self-composition can never reach a 4-aligned span; this is exactly wave 3's corrected finding. Routed to Part 2 (backward absorption). |
| ov011: `021d2fb4`,`021d2fbe` | `0x021d2fb4`-`0x021d2fc8` (20B) | 0 | 0 | **PASS** | 2-symbol run, both ends aligned |
| ov011: `021d2fc9` | `0x021d2fc9`-`0x021d2fd4` (11B) | 1 | 0 | **FAIL** | Isolated single symbol, start misaligned, no adjacent misaligned partner |
| ov011: `021d3034` | `0x021d3034`-`0x021d305f` (43B) | 0 | 3 | **FAIL** | Isolated single symbol, end misaligned, no adjacent misaligned partner |
| ov011: `021d32ba` | `0x021d32ba`-`0x021d32d8` (30B) | 2 | 0 | **FAIL** | Isolated single symbol, start misaligned, no adjacent misaligned partner |
| ov011: `021d3583`,`021d358b` | `0x021d3583`-`0x021d3594` (17B) | 3 | 0 | **FAIL** | 2-symbol run, but run start itself is `%4==3` (odd-aligned) — same harder class as `ov004`'s, not the `%4==2` class the recipe covers |
| ov016: `021b9184`,`021b918e`,`021b9198`,`021b91a2` | `0x021b9184`-`0x021b91ac` (40B) | 0 | 0 | **PASS** | 4-symbol run, both ends aligned |
| ov016: `021b9374`,`021b937e` | `0x021b9374`-`0x021b939c` (40B) | 0 | 0 | **PASS** | 2-symbol run, both ends aligned |
| ov017: `021b80a0`,`021b80aa`,`021b80b4`,`021b80be` | `0x021b80a0`-`0x021b80c8` (40B) | 0 | 0 | **PASS** | 4-symbol run, both ends aligned |
| ov017: `021b816c`,`021b8176` | `0x021b816c`-`0x021b8180` (20B) | 0 | 0 | **PASS** | 2-symbol run, both ends aligned |
| ov019: `021b5ba0`,`021b5baa` | `0x021b5ba0`-`0x021b5bc8` (40B) | 0 | 0 | **PASS** | 2-symbol run, both ends aligned |
| ov022: `021ab8e4`,`021ab8fe` | `0x021ab8e4`-`0x021ab98c` (168B) | 0 | 0 | **PASS** | 2-symbol run, both ends aligned |

**8 runs PASS (22 symbols), 7 runs FAIL (11 symbols).** Combined with
the 2 already-shipped wave-3 symbols (also a PASS run), that's **24 of
35 PASS, 11 of 35 FAIL** — matching the kickoff's expectation exactly.

Two distinct failure shapes emerged among the 11, worth separating for
future waves:

- **Isolated single symbols with no adjacent misaligned partner**
  (`021b55de`, `021d2fc9`, `021d3034`, `021d32ba` — 4 symbols): these
  have no self-composition option at all, aligned or not — there's
  nothing to pair them WITH. Each would need its own backward (or
  forward) absorption into a neighboring already-claimed TU.
- **Runs whose start is `%4 == 1` or `%4 == 3`** (`021de7e5`,
  `021d3583`/`_358b` — 3 symbols): a genuinely harder alignment class
  than this project's `%4 == 2` recipe covers, closer to
  `ov004-odd-aligned-slot-recipe.md`'s 1-byte-misaligned territory.
- **The `ov006` `kv_t` run** (4 symbols): every member individually
  `%4==0`-sized, but the run's own start and end both land at
  `%4==2` — no amount of internal regrouping fixes this; it needs
  Part 2's backward absorption, tested below.

4 + 3 + 4 = 11, matching exactly.

## Part 1 — composing and carving the 8 passing runs

All 22 symbols across the 8 PASS runs were investigated to this
project's standard evidentiary bar (real byte extraction via
`extract_bytes.py`, real consumer proof via `relocs.txt` and
transitive-callee tracing, section discipline checked directly against
each module's `delinks.txt`), then independently spot-verified byte-for-
byte and citation-for-citation against the investigating agents' claims
before anything was written to `src/`.

**CANARY**: `data_ov017_021b816c`/`_8176` (the run closest in shape to
the exact proven wave-3 recipe: 2 named scalar globals of one struct
type) went through the full 3-region gate alone first —
`[eur] SHA1 PASS`, `[usa] SHA1 PASS`, `[jpn] SHA1 PASS`.

**The n>2 spot-check caught a real bug before it could ship.** Three of
the 8 runs are 4-symbol groups (`ov005`, `ov016`'s first run, `ov017`'s
first run). Per the recipe doc's explicit "spot-test a 3+ symbol group
for reordering, don't assume safe by extrapolation" warning, each was
compiled standalone (no linking) and its `.o` symbol table inspected
directly. All three reordered:

| Run | Declared order | Compiled order |
|---|---|---|
| `ov005`: `_1a44,_1a76,_1aa8,_1ab2` | `[0,1,2,3]` | `[3,2,1,0]` (full reversal) |
| `ov016`: `_9184,_918e,_9198,_91a2` | `[0,1,2,3]` | `[2,1,0,3]` |
| `ov017`: `_80a0,_80aa,_80b4,_80be` | `[0,1,2,3]` | `[2,1,0,3]` |

The `.data` section *size* was correct in all three (a 4-byte multiple)
— only the internal byte *layout* was wrong, which would have shipped
every symbol's bytes at the wrong address and failed SHA1 silently at
gate time rather than obviously at compile time. This independently
reproduces wave 1's original n=11 reordering finding at n=4, closing
the "n>2 IS UNPROVEN" question this wave's kickoff opened: **not safe**,
confirmed twice now (wave 1 at n=11, this wave at n=4, and again at
n=13 in Part 2 below).

**Fix**: each 4-symbol run has an interior symbol whose own address is
4-aligned (`ov005`: `0x021b1aa8`; `ov016`: `0x021b9198`; `ov017`:
`0x021b80b4`), so each splits cleanly into two independently
both-ends-passing n=2 TUs. Recompiled all 6 resulting files standalone
and confirmed declaration order preserved in every one before batching.

**A second, unrelated mwcc quirk surfaced in the `ov011` pair**: a first
draft declared both symbols as bare `const unsigned char name[10]` (this
project's normal convention for a solo byte-array TU). Compiling that
draft showed mwcc emits raw top-level array-of-primitive globals into
their own separate `.rodata` input section *each* — two 10-byte sections
(each individually `%4==2`) instead of one combined 20-byte section,
silently defeating the composition (each section would independently hit
the `ALIGNALL(2)` wall). A throwaway scratch test isolated the cause:
reproduces identically with or without `const` (not a const-vs-`.data`
distinction), and disappears when each array is wrapped in a trivial
one-field struct. Every other composed file this wave already used
struct types (even for array *members*), which is why only this pair hit
it. Fixed by wrapping both in a shared `Ov011Bytes10` struct.

All 22 symbols (11 files, all now n=2, all individually spot-checked for
both section-merging and declaration-order preservation) went through
the full 3-region gate together: `[eur] SHA1 PASS`, `[usa] SHA1 PASS`,
`[jpn] SHA1 PASS`.

## Part 2 — backward absorption on the `ov006` kv_t group

Re-derived the gap structure from **current** `delinks.txt`/
`symbols.txt`/`relocs.txt` rather than trusting wave 1's possibly-stale
numbers. The already-shipped TU `data_ov006_021ce2ac.c` ends at
`0x021ce2bc`; the next already-shipped TU `data_ov006_021ce4a4.c` starts
at `0x021ce4a4`. Everything between is one unclaimed dsd gap containing
17 real, individually-referenced symbols (confirmed via `relocs.txt`
`kind:load` hits from actual code, not deduction artifacts). Checking
every symbol's address mod 4 found only two interior 4-aligned points:
`0x021ce2bc` (the gap's own start) and `0x021ce450`. Since the 4 declined
`kv_t` symbols (`0x021ce38a`-`0x021ce426`) sit strictly between those,
the *smallest* valid both-ends-4-aligned span reaching them is
`0x021ce2e0`-`0x021ce450` (368 bytes) — no smaller composition is
possible; this group is structurally all-13-or-nothing, unlike every
Part 1 run.

**Scope correction**: that 368-byte span holds **13** real symbols, not
12 — the investigating agent found `data_ov006_021ce426` (42 bytes),
which the kickoff's own byte table had omitted (the kickoff's
18+20+20+20+20+24+24+24+36+40+40+40 = 326 B undercounts the true 368 B
span by exactly 42 B). `data_ov006_021ce426` is referenced by name from
the same two already-shipped cluster files as 8 of its siblings,
confirming it belongs to the same must-stay-individually-named
population.

**Wave-1-claim verification** (explicitly requested by the kickoff):
wave 1 Part 5 attempt #3 said 4 of 8 "no consumer found" placeholders
were referenced by name from `data_ov006_021ce650.s`/`_8a8.s`. Directly
re-reading both files this wave: confirmed for those 4, but an
undercount — **all 8** original placeholders are referenced by name
from **both** files (16 references total), plus the 9th,
`data_ov006_021ce426`, also is. All 9 non-`kv_t` names in the gap must
therefore be preserved exactly as-is, a broader constraint than wave 1
reported, though it doesn't change the file's required shape (every
symbol individually named regardless).

**Result — declined, a clean negative.** Wrote the full 13-symbol
composed TU (4 `kv_t` members reusing the existing typedef, fully
evidenced against the dossier'd lookup-table family; 9 index/ID tables
typed as `short[]`, address-taken-by-name evidenced but not
per-element loop-bound-traced). Compiled it standalone — the `.data`
section size came out correct (368 B, a 4-byte multiple) — but the `.o`
symbol table showed mwcc did **not** preserve declaration order,
independently reproducing wave 1 Part 5 attempt #2's original finding
(an 11-symbol bundle spanning nearly this same range, which also
reordered) at a very similar scale (n=13). Because no smaller
4-aligned-at-both-ends sub-bundle exists inside this gap — unlike every
Part 1 n=4 run, which could be split into two clean n=2 halves — this
group cannot be de-risked the way Part 1's was.

**Verdict on the open question**: `cm-restock-carve-1` Part 5 attempt
#1's dsd-containment-check rejection (trying to absorb just 2 bytes
backward) was symptomatic of a real structural wall, not an artifact of
that attempt's narrow framing — this wave's full, correctly-scoped,
every-symbol-accounted-for 13-way retry hits a *different* checkpoint
(mwcc codegen, not dsd's containment check) but is blocked all the same.
The 4 `kv_t` symbols remain declined. Per `cm-restock-carve-1`'s own
"Handoff" section, the only remaining avenue is a patcher-level fix
(`docs/research/ov004-odd-aligned-slot-recipe.md`'s Variant E), not a
further source-level retry at this scale. The drafted 13-symbol file
was not committed to `src/` (it does not compile to correct output) —
its full derivation is preserved above for any future patcher-level
attempt.
