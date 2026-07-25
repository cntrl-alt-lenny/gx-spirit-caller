# cm-parked-reaudit-2: batch 2 of the C-34 parked re-audit (2026-07-25)

Continuation of `cm-parked-reaudit-1` (PR #1337, 13/29 shipped, 44.8%).
This batch drew a fresh, live census of the C-34 corpus rather than
trusting a static list, applied the corrected distinct-symbol lever
from the start (not re-derived from scratch), and used 4 parallel
worktree-isolated agents (proven pattern, `cm-overlay-small-sweep` /
`cm-parked-reaudit-1`).

**Result: 8/39 attempted shipped (20.5%).** Below the >25% "restocks
itself" bar batch 1 set — reported honestly, not spun. The corpus is
visibly getting harder as the easiest members drain: batch 1 sampled
30 candidates cold and got 44.8%; this batch sampled the NEXT 39 (a
mix of batch-1-adjacent and previously-untouched members) and got
20.5%. Still a real, positive yield (8 more functions converted, 4
more mistagged citations corrected, several new sub-pattern and
tooling findings for future sessions) — just a declining one. See
*Verdict* at the end for what this means for a hypothetical batch 3.

## Building the candidate pool

`cm-parked-reaudit-1`'s own writeup didn't persist the exact 30-name
list it sampled from (the worktree agents worked from an ephemeral
in-session list), so rather than guess, this batch built a **fresh,
live census**: `grep -rl "C-34" src/ --include=*.s` — every `.s` file
still citing the C-34 taxonomy tag today, independent of any prior
sampling record. **47 files.**

Excluded before assigning any batch, all backed by direct evidence,
not just trusting prior citations:

- **2 confirmed mistagged** (`func_020037d0`, `func_02003d98`) —
  cm-parked-reaudit-1 found these have only ONE pool word for the
  cited address, not a genuine duplicate. **Re-verified independently
  this batch** by reading each file's actual pool tail before
  excluding: both show exactly one `.word data_02102c7c` entry. Fixed
  both files' stale "C-34 candidate" header comments to state the real
  finding instead of repeating the wrong citation forward.
- **1 already-investigated composite wall** (`func_02021b38`, tagged
  C-35 not pure C-34) — cm-parked-reaudit-1 already applied the
  pool-fix + a push-list fix (10%→37.93%) and identified the residual
  as a genuine loop-strength-reduction + store-reordering wall.
  Excluded from fresh attempts as already-diagnosed.
- **5 giant out-of-scope functions** (`func_ov002_021aba60/021c4c9c/
  021d9828/021e4ba8/0220eb00`, 1380-3172 instructions each) —
  cm-parked-reaudit-1 triaged these as full-decompilation projects, not
  lever applications. Same triage still applies; a lever-application
  pass isn't the right tool for a from-scratch 1000+-instruction body.

**39 remaining**, split into 4 batches of ~10 for worktree-parallel
agents, including `func_ov002_022b595c` (cm-parked-reaudit-1's own
deferred item — explicitly assigned to batch C with instructions to
give it a real attempt but not force a ship).

## Per-batch results

| Batch | Scope | Shipped | Mistagged corrected | Notes |
|---|---:|---:|---:|---|
| A | main (10) | 1/10 | 0 | 2 new C-34 sub-patterns found |
| B | main + ov002 (10) | 6/10 | 2 | best hit rate this batch |
| C | ov002/ov004/ov006/ov008 (10, incl. deferred item) | 0/10 | 0 | rich negative-result diagnostics |
| D | small overlays (9) | 1/9 | 0 | 2 new levers found |
| **Total** | **39** | **8/39 (20.5%)** | **2** | |

### Batch A (1/10) — `func_02024430` shipped

100.00% match, literal-address-cast + hoisting a persistent alias
pointer before an adjacent call. Real `ninja sha1` PASS.

The other 9: all confirmed genuine C-34 (no mistags this batch), with
substantial partial credit (15-93%). Two **new C-34 sub-patterns**,
distinct from the documented cases:

- **Twice-read-across-a-call-free-gap** (`func_020234f8`,
  `func_02024024`, `func_02024574`): a "find first empty slot" loop
  reads the same address twice with no `bl` in between; mwcc
  re-materializes it a second time regardless of literal-cast or
  registered-alias phrasing. Confirmed the SAME residual occurs with
  BOTH techniques on `func_02024024` (it has a pre-existing alias) —
  this rules out "literals just don't get CSE'd" as the mechanism;
  something about the call-free gap itself is the trigger.
- **Deferred-materialization-despite-call-crossing** (`func_020244e8`,
  `func_02027048`): a persistent literal-cast pointer used inside a
  call-bearing loop still gets its pool load positioned one block
  later than the original — unlike the otherwise-identical pattern
  that worked cleanly on 3 OTHER shipped candidates in this campaign.

Also found: **declaration/assignment order of an UNRELATED local
variable can gate whether a persistent pointer materializes early** —
the fix for 2 candidates was reordering other locals relative to the
pointer and nearby calls, not touching the pointer's own declaration
at all.

### Batch B (6/10) — best batch, plus a real scoping finding

Shipped: `func_020270d0`, `func_0202a27c`, `func_020318b8`,
`func_020285bc`, `func_02028790`, `func_020286a0` — all registered-alias
lever, all verified via real `ninja sha1` (run twice this session, both
green). Three reused an alias already on `symbols.txt` from prior
work; two needed a **new** alias (`data_0219a92c_alias`, wired via
`symbols.txt` + a matching zero-size split in
`src/main/bss/data_main_bss.s`).

2 more mistagged citations found and corrected (headers fixed, left as
`.s`, not counted as attempted-and-failed):

- `func_ov002_022a1870.s` — **zero** pool words, not two.
- `func_ov002_021f2ca8.s` — **one** pool word, not two. Real content is
  a 3-bitfield comparison.

1 genuine wall with a **real scoping constraint worth recording**:
`func_020988a8` needs a registered alias for `data_02102c44`, but that
address sits in an **unclaimed gap** of main's giant `.data` blob (no
owning `delinks.txt` TU) — wiring an alias there means claiming the
gap first, which is out of scope for a lever-application pass. This is
a different kind of blocker than a pure codegen wall: the FIX is known
and would work, it's just gated on unrelated data-carving work.

1 more (`func_ov002_02247b6c`, the 473-word dispatcher) reached a
**structurally complete and correct** translation — exact branch
topology, exact 24/24 call-instruction match — blocked purely by mwcc
picking a different *starting* callee-saved register than the
original for the same *count*, cascading through the whole function.
Draft preserved in the `.s` header notes for a follow-up session (not
committed as a half-finished `.c`, per project convention).

### Batch C (0/10) — negative result, but a clean and informative one

**All 10 confirmed genuine C-34** (no mistags). The literal-address-cast
lever mechanism itself worked correctly in every case reached compile
(verified via `objdump -r` showing two genuinely distinct pool
words — one bare literal, one relocation — 6/6 times) — every gap to
100% is a **separate, unrelated** wall (instruction scheduling,
register allocation, or a pre-documented struct-copy quirk), not a
pool-splitting failure. This is useful negative evidence: it confirms
the corrected lever generalizes correctly even where it doesn't
produce a full ship.

Best partial results: `func_ov004_021ca198` 23.6% (compounds a
**pre-existing, independently documented** non-C-steerable wall —
`ov003_core.h`'s "CALLER-SAVED COIN-FLIP" class), `func_ov004_021cab44`
21.3% (227 vs 230 words — closest structural fidelity in this batch),
`func_ov004_021cb060` 18.3% (7+ iterations; root-caused to a genuine
mwcc list-scheduling divergence that survived every source-level
countermeasure tried).

**`func_ov002_022b595c`** (the deferred item): re-verified size
directly (2801 lines — matches cm-parked-reaudit-1's figure). The two
duplicate pool words are **5576 bytes apart** — beyond the ±4095B
`ldr [pc,#imm]` range, meaning the duplication may be reach-forced
rather than discretionary CSE (a naive C rewrite might reproduce it
without any lever at all). Still deferred: the blocker is the sheer
size of a from-scratch decompile (3 nested jump tables, 56 case
labels, 65 distinct external calls), not the C-34 mechanism. Needs its
own dedicated session, as cm-parked-reaudit-1 already concluded.

**Corrected reference data for future sessions** — a magic-constant
divisor table error from an earlier pass in this same investigation,
caught and fixed before it propagated: for ARM's multiply-high
division-by-constant idiom, magic `0x66666667` pairs with shift
1→÷5, shift 2→÷10, shift 3→÷20, shift 4→÷40; magic `0x2aaaaaab` pairs
with shift 0→÷6, shift 1→÷12, shift 2→÷24, shift 3→÷48.

### Batch D (1/9) — `func_ov016_021b8774` shipped

100.00% match on the first attempt, literal-address-cast — the
already-shipped sibling functions' own `void **arg1` signatures
directly confirmed the table-of-pointers interpretation needed for the
raw-address site.

The other 8: all confirmed genuine C-34, 5-94% partial credit. Best:
`func_ov012_021c9f48` at 94.48% — closest non-ship of the whole batch —
after correcting a mis-analysis mid-session (a call originally read as
having dead trailing args turned out to be a genuine 5-argument call;
fixing this alone moved the match 25.5%→93.8%). Two **new levers**
found, neither yet in `codegen-walls.md`'s C-34 entry:

- **Caching a persistent base pointer into an explicit local** when the
  original visibly keeps it live in one register across many calls
  (drove `func_ov018_021ab1c4` from 2.2%→53.3%).
- **`goto`-based control flow to force a real branch** over mwcc
  predicating a small `if`/`else` (drove the same candidate
  53.3%→77.65%).

Across 5 of the 9 candidates in this batch, mwcc's instruction
scheduler hoists independent pool-address loads or predicates small
conditionals in ways that did **not** respond to statement reordering,
explicit temporaries, or declaration-order changes (10+ independent
A/B experiments) — consistent with batches A and C's own findings that
the residual walls here are scheduling/allocation-level, downstream of
a correctly-applied C-34 lever, not evidence against the lever itself.

## Tooling gaps found (flagged, not fixed — out of scope for a C-match sweep)

- **`tools/batch_sha1.py` false-FAIL on a delinks-flip-without-.s-removal
  race**: flipping a `delinks.txt` entry to `.c` before deleting the
  sibling `.s` produces a "multiple rules generate the same output"
  ninja configuration error, which `batch_sha1.py` misreports as a
  SHA1 mismatch rather than an infra/config error. Batch A hit this
  and worked around it manually (remove `.s` first, reconfigure, bare
  `ninja sha1`). Flagged as a follow-up task (see PR).
- **`tools/objdiff_resolve_relocs.py`'s `_NAME_ADDR_RE`** only
  recognizes symbol names ending in exactly 8 hex digits, so any
  `_alias`-suffixed symbol (the registered-alias lever's own naming
  convention) resolves to a fictional hash address in `fastmatch.py`'s
  resolved-comparison mode, always showing as a false pool-word
  mismatch there — a known blind spot for verifying the alias lever
  specifically. Worked around via raw relocation inspection + the real
  link gate throughout this campaign; not fixed here.

## Verification

3 non-empty worktree branches (batch C's was a genuine no-op, verified
via `git diff --stat` against the shared base — zero lines, matching
its own report of 0/10 shipped) merged via `git merge --no-ff` into
`claude/cm-parked-reaudit-2` — **zero conflicts** despite 2 batches
independently touching `config/eur/arm9/delinks.txt`. Sanity check: 8
new `.c` files == 8 deleted `.s` files == 8 flipped `delinks.txt`
lines, nothing orphaned. 3-region `python tools/gate3.py --scope all
--no-tests`: **GATE PASS** (EUR/USA/JPN all SHA1 OK) — confirms the 8
shipped functions are region-neutral (no USA/JPN porting step needed,
consistent with cm-parked-reaudit-1's own precedent). `python -m
pytest -q tests`: 3,008 passed, 16 skipped (no Python tooling touched
this item; run as a sanity check, not required by this item's own
gate).

## Verdict

**20.5% hit rate (8/39 attempted) — below batch 1's own >25%
"restocks itself" bar, but still a real, positive yield.** The corpus
is visibly thinning: batch 1's cold sample of 30 got 44.8%; this
batch's next 39 (drawing from what's left after batch 1's own picks)
got 20.5%. Combined with the volume of "genuine wall, technique
correctly applied, real but unrelated residual" results across all 4
batches (versus batch 1's cleaner win/lose split), this suggests
future C-34 batches should expect **diminishing, not steady, returns**
— the easiest members of this corpus are draining faster than the
harder ones resolve.

The full live census (47 files) is now fully accounted for: 8
pre-excluded with reasons (2 mistagged, 1 composite wall, 5
out-of-scope giants) + all 39 remaining attempted. **There is no
untouched slice of this specific census left to sample cold** — a
hypothetical batch 3 would mean RE-attempting the 31 non-shipped
genuine walls from batches A/C/D with the 2 NEW levers found this
round (persistent-base-pointer caching, goto-based branch forcing;
neither yet tried against most of them) rather than a fresh sample, or
re-censusing for C-34 citations that may have appeared since (other
concurrent campaign work ships functions continuously). Given that
shift in character — targeted re-attempts on a known-hard residual
pool, not a fresh untried sample — batch 3 is not automatically
warranted the way batch 2 was; recommend re-scoping it explicitly as
"apply the 2 new levers to the 31 documented residuals" rather than
"sample the next N," if pursued.
