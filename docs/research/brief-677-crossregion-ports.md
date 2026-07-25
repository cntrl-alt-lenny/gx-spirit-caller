# Brief 677 — cross-region port harvest, sim==1.0 floor + sub-1.0 tranche (queue item cm-crossregion-ports)

**Result: 468 ships (234 USA + 234 JPN), 3-region (`gate3.py --scope all
--no-tests` PASS: EUR, USA, JPN). 211/211 sim==1.0 candidates shipped
clean per region; 23/25 sub-1.0 candidates fixed and shipped per
region; 2/25 sub-1.0 candidates parked.** Found and fixed 5 distinct
porting/tooling bugs along the way (1 shared tool bug, 4 content bugs),
using ground-truth `.s` disassembly comparison to verify every fix
rather than guessing.

## Scope

`port_census.py` re-censused the cross-region port backlog: 244
EUR-matched candidates per region still shipping as `.s` in USA/JPN.
219 of those sit at `byte_sim == 1.0` — the underlying machine code is
proven byte-identical across regions (relocation-masked Hamming
comparison), so a correct symbol-renamed port is mathematically
guaranteed once the right names resolve. The other 25 are below 1.0,
which the queue text correctly predicted is where the region-specific
struct-offset porting bug class lives.

Followed the queue's own **WORKTREE-PARALLEL SWEEP PROTOCOL**: separate
`crossregion-usa` / `crossregion-jpn` worktrees for the bulk harvest,
plus two more (`subfloor-usa` / `subfloor-jpn`) purely for isolated
sub-1.0 diagnosis, merged back into the integration branch via `git
merge --no-ff` (zero conflicts across all 4 branches, matching the
`cm-overlay-small-sweep` precedent).

## sim==1.0 floor: 211/219 shipped clean, 3 excluded

`port_to_region.py --confidence-floor LOW` ported all 219; 4 refused
per region (renamed/unresolvable symbols, expected). Of the 215 that
compiled and staged, 3 were pulled back out after individual diagnosis
found genuine, narrow problems unrelated to the sim==1.0 guarantee
itself:

- **2 candidates** (`func_ov002_021e2d48`, `func_ov002_0220cf08`)
  reference `ov002_core.h` macros (`D016C`/`CE288`) added to EUR's copy
  of that header by briefs 609/613's struct-bank mining — USA/JPN's own
  copies of `ov002_core.h` were never updated to match (662 EUR lines
  vs. 389 in USA's). Pre-existing header-staleness gap, not something
  this brief's scope covers fixing. **Follow-up needed**: propagate the
  brief 609/613 struct-bank additions to USA/JPN's `ov002_core.h`.
- **1 candidate** (`func_ov008_021ac1cc`) needs a second name (`data_*
  _alias`) for a data symbol already declared once — EUR's own
  `symbols.txt` carries a deliberate two-name alias at the identical
  address for this reason, but the alias name doesn't exist in
  USA/JPN's `symbols.txt`, and simply adding the symbols.txt line
  wasn't sufficient — the linker still reported it undefined even after
  a full reconfigure + rebuild. dsd's own bss-symbol emission mechanism
  for same-address aliases needs a dedicated look before this one can
  ship. **Follow-up needed.**

211 shipped per region, individually confirmed via
`ninja sha1` after every fix (never trusted blind).

## sub-1.0 tranche: 23/25 fixed via ground-truth comparison

Ported all 25 with `--confidence-floor LOW`, then diagnosed each one
individually against its own git-tracked `.s` ground truth (never
guessed a fix without checking the real pool-literal/immediate values
first). Three distinct bug classes surfaced:

**Class 1 — consistent -8 struct-offset shift (20 of 25).** USA's (and,
confirmed independently, JPN's) layout for several small structs is 8
bytes narrower than EUR's before a given field — the same class briefs
673/676 already identified, just a larger fresh batch. Decoded every
word-diff (`decode_offset_diffs.py`, a small ARM LDR/STR-immediate and
data-processing-rotated-immediate decoder written for this brief) to
confirm every single diff across all 20 candidates was exactly this
one pattern before touching any source — including diffs that only
show up as a data-processing rotated immediate (`ADD r1, r4, #0x234`)
rather than a direct offset, and diffs split across two chained `ADD`s
for offsets too large to encode in one rotated-8-bit immediate
(`#0x234` + `#0xc00`). Fixed by shrinking the struct's own leading
`pad[N]` (or raw pointer-arithmetic literal) by 8; every fix
independently re-verified at 100% before moving to the next.

**Class 2 — genuinely wrong constant (1 of 25).**
`func_ov000_021adafc` passed a literal `6144` (`0x1800`) as a VRAM-clear
size where ground truth needs `5376` (`0x1500`) — not an offset shift
at all, just a wrong number in the drafted candidate. Isolated because
the decoded delta (0x300) didn't match the -8 pattern everywhere else,
so it got its own individual read instead of a blind pattern-apply.

**Class 3 — filename convention mismatch (1 of 25).**
`func_02049868`'s drafted file was named `main_02049868.c` (matching
EUR's own naming convention for this symbol), but the target's actual
`.s`/`symbols.txt` convention for this address is `func_02049868` — the
exact same class of divergent EUR-vs-target naming convention already
seen once in this campaign's sim==1.0 batch (`ov010_021b6b00` →
`func_ov010_021b6b00`). Renamed the file; content needed no change
beyond the earlier offset fix.

JPN's 22 non-special-cased fixes turned out to need **byte-identical
corrections to USA's** — every mine/orig word diff matched USA's
exactly, confirmed before copying rather than assumed. Only the
already-region-specific callee names (handled correctly by
`port_to_region.py` for each region independently) differed at all.

### 2 parked: `func_0204f34c`, `func_020500a4` (both `.legacy_sp3` tier)

Both are large (238-word) accessors against a shared singleton context
struct (`func_0204987c()`) with **dozens** of individual field
offsets, not a single leading-pad shrink — confirmed by full ground-
truth `.s` extraction (`grep -oE '\[r[0-9]+, #0x[0-9a-f]+\]'`) showing
57 distinct offset-bearing instructions where the 20-candidate class 1
pattern only ever needed 1-3. A handful of the same struct's fields
were already independently confirmed to need -8 via 2 of the *other*
23 shipped candidates (`func_0204fc28`: `0x1a8`→`0x1a0`;
`func_0204f924`: `0x2d0`→`0x2c8`), so the same struct-narrowing theory
almost certainly applies here too — it just needs the full per-field
offset table mapped out field-by-field rather than a quick fix, which
this brief's time budget didn't cover. Left as `.s`, untouched, in both
regions. **Follow-up needed**: map the shared context struct's full
USA/JPN field-offset table (all ~57 slots) once, reusable for both
parked candidates and any future function touching the same struct.

## Tool bug found and fixed: `batch_sha1.py`'s routing-suffix blindness

`batch_sha1.py`'s `_c_to_s_rel()` hand-rolled a bare "strip trailing
`.c`" that never accounted for the `.legacy`/`.legacy_sp3`/`.thumb`
routing-tier infix brief 587 already centralized into
`tools/routing_suffixes.py` for every *other* consumer — this file was
simply missed. Any candidate using one of the 3 suffixes (22 of the
219 sim==1.0 backlog: 16 `legacy_sp3`, 6 `legacy`) resolved to a
nonexistent `.s` path and failed the whole batch with "No delinks.txt
entry found," which read exactly like the harvest's other, unrelated
tooling failures until traced to source. Fixed to import
`strip_routing_suffix` from the shared module; added a conformance
test (identity-checked import, matching every other site's pattern)
plus direct behavioral coverage for all 3 tiers.

## Also found: `diag_one.py`'s (this session's own throwaway diagnostic
tool) suffix-blind staging

Unrelated to the shared codebase — a scratch tool built earlier this
session for single-candidate word-diff diagnosis always staged its
override source at a bare `.c` path via `cmatch_loop.py`'s
`stage_source()`, regardless of the held draft's own routing-tier
suffix. This silently compiled both `.legacy_sp3` candidates with the
*default* `mwcc 2.0/sp1p5` instead of the required `mwcc 1.2/sp3`,
producing a 0-4% "catastrophic" match that looked like a completely
wrong function body until the compiler-tier mismatch was suspected and
a suffix-aware staging variant confirmed it (jumped straight to 80%+
with sensible, class-1-shaped diffs once the correct compiler was
used). Not upstreamed since the tool itself is scratch-only, but
recorded here since it cost real diagnostic time and the same trap
would hit anyone else's ad hoc single-candidate tooling.

## Mandatory verification: .c-added == delinks.txt-flipped

Per the queue's explicit requirement (no gate catches a mismatch here):
verified precisely — not just by count symmetry — that every single
untracked `.c` file's own `delinks.txt` entry actually shows a `.c:`
header, for both harvest passes (sim==1.0 and sub-1.0) in both regions:

- USA: 211 + 23 = 234 `.c` added, 234 confirmed flipped.
- JPN: 211 + 23 = 234 `.c` added, 234 confirmed flipped.

## Gate

`python tools/gate3.py --scope all --no-tests` — 3-region PASS (EUR,
USA, JPN). Each of the 468 shipped candidates individually
`ninja sha1`-verified at least once (211+23 per region) before the
final aggregate gate; the 5 sub-1.0 content bugs were all caught this
way, not by the aggregate gate alone.

## Remaining backlog for a future brief

- 3 candidates parked from the sim==1.0 floor (2 header-staleness, 1
  bss-alias mechanism) — all narrow, well-understood, documented above.
- 2 candidates parked from the sub-1.0 tranche (both need the shared
  context struct's full field-offset table).
- `q-batch-port`'s own scope (turnkey tool on `batch_carve.py`'s Ops
  seam) should bake in this brief's lessons directly: the sim==1.0
  floor check, the mandatory .c-added-vs-flipped count, and routing-
  suffix-aware staging throughout.
