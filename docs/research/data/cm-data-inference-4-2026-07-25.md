# cm-data-inference-4: data wave 4 (2026-07-25)

Continuation of `cm-data-inference-3` (24 investigated, 14 shipped, 58%).
This wave handled the 4 explicitly-named priority candidates from that
wave's own deferred list, plus a fresh batch of 16 main-module blobs —
20 investigated total, matching wave 3's own scale.

## Live census correction (yet again)

The queue item's own stated baseline ("~116 opaque blobs remain") was
already stale by the time this wave started: wave 3's 14 ships (PR #1355)
and this session's own 2 intervening carves
(`cm-data-020c3198-carve`, `cm-data-020b4680-carve`) hadn't been
accounted for in that estimate. A live scan on the actual current tree
(after pulling in all 3 predecessors' real source changes, since none
had merged to `origin/main` yet) found **125** opaque blobs remaining
(37 main, 88 overlay) before this wave started — consistent with this
campaign's now-well-established pattern of queued counts drifting from
reality (see `cm-data-inference-3`, `q-itcm-feeder-fix`, the prototype
bank's count, etc.).

## Method: parallel investigation, write-back done centrally (with one exception)

20 agents dispatched in parallel (the tool's own concurrency cap), one
per blob: the 4 named priority items (2 read-only resolution agents for
the already-evidence-complete/contradiction cases, 2 carve-capable
agents for the 2 sibling leads that had no source file yet) plus 16
fresh read-only investigation agents covering the entire remaining main
module.

**A real operational finding mid-wave:** the 2 carve-capable agents and
the `data_021015e4` implementation agent all have Write/Bash access and
were running in this session's actual shared working directory (no
`isolation: worktree` was requested) — not sandboxed. One of the carve
agents diligently detected and correctly avoided a concurrent sibling
agent's uncommitted changes to the same `delinks.txt` file via its own
`git status` check before writing; both carves landed cleanly with zero
clobbering, confirmed independently afterward via `git diff` (both
hunks present, non-overlapping line ranges). Given this real (if
avoided) collision risk, the remaining 16 blob investigations were
dispatched as strictly read-only `Explore` agents with no write access
at all, and every resulting STRONG-classified retype was implemented
directly by the orchestrating session afterward, sequentially — not
by further concurrent write-capable agents. This matches
`cm-data-inference-3`'s own proven-safe pattern
("one read-only Explore agent per blob... implemented directly myself
afterward") and is the right default going forward for any future wave.

## Results: 20 investigated, 12 shipped (60%)

| Blob | Module | Size | Verdict | Shape |
|---|---:|---:|---|---|
| `data_021015e4` | main | 272 B | STRONG, shipped | single 30-field struct instance, 10 confirmed function-pointer fields (not the 6 wave-3 estimated — a wider consumer sweep found 4 more, each individually `blx`-verified) |
| `data_020bec8c` | main | 88 B | STRONG, shipped | single struct instance, 1 confirmed pointer field (reloc-verified) + 8 confirmed 4-byte fields + several honestly-unproven `unkNN` fields |
| `data_020b5a8c` | main | 44 B | STRONG, shipped | `Entry{u8 id, u8 pad, s16 x, s16 y}[7]` + 2-byte pad, bound hard-proven by the enumerator |
| `data_020b4728` | main | 32 B | STRONG, shipped | `unsigned short[16]` RGB555 grayscale palette ramp — 27 consumers across 14 modules, all agree |
| `data_020beedc` | main | 32 B | STRONG, shipped | `unsigned char[4][4][2]` — 3 independent consumers computing the identical formula |
| `data_020bec1c` | main | 32 B | STRONG, shipped | 2-field struct `{order_all[17], order_excl_1_3[15]}`, doubly cross-checked split point |
| `data_020b4a0c` | main | 32 B | STRONG, shipped | `int[8]` ascending-threshold bracket table |
| `data_020be9e8` | main | 68 B | STRONG, shipped | `short[34]` permutation lookup, bound proven via an already-shipped sibling |
| `data_020bec58` | main | 52 B | STRONG, shipped | `int[13]` walking-bit flag table; fixes a pre-existing cross-TU type mismatch (`extern int[]`) |
| `data_ov006_021cb5f4` | ov006 | 24 B | STRONG, carved+shipped | opaque `unsigned char[24]`, sibling lead from wave 3, gap-carved |
| `data_ov006_021cddec` | ov006 | 16 B | STRONG, carved+shipped | `short[8]`, sibling lead from wave 3, gap-carved into `.data` |
| `data_020be6c4` | main | 88 B | STRONG, **no change shipped** | flat byte-stride (1-byte) lookup/dispatch table — already the structurally correct type; confirmation, not a reshape |
| `data_020bed6c` | main | 256 B | WEAK, declined | unrolled full-buffer memcpy feeding strlen/strcat; independently re-confirms an existing wave-2 finding |
| `data_020be754` | main | 40 B | WEAK, declined | only fixed-offset evidence (one-hop-removed via a stack copy); a tempting partial-ship option explicitly declined as sub-precedent-quality |
| `data_020beb8c` / `data_020bebbc` / `data_020bebec` | main | 48 B each | WEAK/mixed, declined | 3-buffer cluster investigated independently by 3 agents; converging facts (mutable path-building scratch buffers, no record structure) but one report correctly flagged an unresolved const-safety tension the other two glossed over — left unchanged pending an actual build-verified check |
| `data_020b59a0` | main | 64 B | CONTRADICTION, declined | computed index but unverified bound; the data's own byte shape suggests a 45/19 split the code doesn't confirm |
| `data_ov011_021d3060` | ov011 | 152 B | CONTRADICTION, declined | same disposition as wave 3 — the `_021d305f` sentinel-byte lead was chased exhaustively and found to be a dead end (worsens pointer-word alignment rather than resolving it) |

## Named-struct metric: a real detection gap found, not a wall

Measured directly (stash/pop isolation of this wave's own changes, not
assumed from a stated baseline): **42,052 → 42,096 bytes (+44)**. That
number badly under-represents this wave's actual struct-typing work.
Traced why: `tools/progress.py`'s `named_struct_bytes` regex
(`_DATA_ARRAY_DECL_TYPE_CAPTURE_RE`) requires a top-level
`Type name[N]` array-bracket declaration and classifies by the
*first* such line's type clause. 3 of this wave's 4 new struct
types (`data_021015e4`, `data_020bec1c`, `data_020bec8c`) are single
struct *instances* (no top-level `[N]` on the symbol itself) whose
internal fields are all primitive-typed arrays (`char[64]`,
`unsigned int reserved[7]`, etc.) — the regex either finds no
qualifying line at all, or matches an internal primitive-typed field
first, so `named_struct_bytes` never sees them. Only
`data_020b5a8c` registers, and only because its wrapping anonymous
struct's first field happens to be a non-primitive-typed array
(`Entry020b5a8c entries[7]`) — a coincidence of field order, not a
meaningful distinction from the other 3. This is a real, reproducible
detection gap (the metric was tuned for the campaign's dominant
"array of records" shape and doesn't model single-instance structs),
not a wall on the data itself. Not fixed here — out of scope for a
data-inference item — but worth a dedicated small follow-up.

EUR Natural-C: **9.03%** (unchanged — data retypes don't move this
metric, matching prior waves' own observation).

## Sibling leads found, not investigated (candidates for a future wave)

- **`data_020beefc`** (main, 64 B) — already has a **matched** C
  consumer (`func_0208147c.c`: `extern int data_020beefc[][4];`)
  proving its shape, but the symbol itself is still an untyped opaque
  blob. Near-zero-risk, evidence already complete.
- **`data_020b4a2c`** (main) — two already-**matched** C consumers
  (`func_02011b4c.c`, `func_02011b68.c`) already declare
  `extern unsigned short data_020b4a2c[]` and index it with genuine
  computed stride. Currently still a raw `.s` byte listing, not even a
  `.c` file yet.
- **5 ov006 palette blobs** (`data_ov006_021cb6d8/718/738/758/798`,
  32 B each) — same exact "load base, `n=0x20`, copy into palette RAM"
  idiom as this wave's `data_020b4728`; 2 spot-decoded and confirmed
  as further RGB555 colour ramps. 3 more addresses
  (`021cb6f8/778/7b8`) sit in the same contiguous run but were not
  found referenced by the same consumer — check before typing as one
  block.
- **`data_020fe480`** (main, 8 B) — evidenced as a small sentinel-value
  state block; no dedicated file yet.
- **`data_020fe488` / `data_020fe49c` / `data_020fe4b0`** (main,
  string literals) — the 3 SDAT filename suffixes strcat'd onto the
  `data_020beb8c`/`bebbc`/`bebec` cluster; genuine string constants,
  currently sitting in an unclaimed `delinks.txt` gap, much lower-risk
  than the buffers that reference them.
- **`data_0219a8ec`-adjacent `data_020be794`** (main, 140 B) — a
  35-entry function-pointer table with a clean, fully computed and
  fixed-bound (`cmp r5,#0x23`) stride, found while investigating
  `data_020b4768`.
- Batch 2's originally-planned scope (12 more main-adjacent blobs,
  ov010 [5 blobs], ov015 [3 blobs]) was not dispatched this round —
  folded into the wave 5 follow-up below instead of extending this
  wave further.

Filed as `cm-data-inference-5` in the queue with all of the above named
explicitly, so this investigation work isn't wasted on a future
re-discovery.

## Verification

- **Byte-for-byte, not just "compiled clean", for all 12 shipped
  items**: 9 implemented directly by this session (parsed from the
  already-committed literals programmatically, never hand-transcribed,
  compared against the compiled `.rodata`/`.data` section output via
  `objdump -s`), 3 implemented by their own investigating/carving
  agents and independently re-verified by this session afterward (full
  rebuild from scratch, `objdump -s` byte comparison against the
  original literal / extracted ground truth for every one of the 3,
  not just re-trusted from the agent's own report).
- **Pointer field verified via relocation, not raw bytes**:
  `data_020bec8c`'s one confirmed pointer field (`+0x48 -> data_020fe4d0`)
  necessarily shows as a zero placeholder in the pre-link object's raw
  section bytes (relocations resolve at link time) — verified instead
  via `objdump -r`, confirming `R_ARM_ABS32 data_020fe4d0` at the exact
  expected offset, matching the original ROM's own relocation exactly;
  all other (non-pointer) bytes in that file separately verified as an
  exact match.
- **Const-consistency**, mechanically checked for every file this
  session wrote directly (`git show origin/main:<file> | grep -c
  '^const '` vs. the same on the new file, all 9 matching) — the
  wave-3 postmortem's lesson applied as a standing habit, not
  re-derived from scratch.
- **A real, self-inflicted false gate failure caught before trusting
  it**, while verifying the reconstructed multi-branch baseline this
  wave builds on: an earlier manually-`&`-backgrounded `gate3.py` run
  (from this session's prior item) outlived a `jobs -l` check in a
  later shell call and collided with a subsequent real run's
  `build.ninja` file lock. Confirmed no stray processes via `tasklist`
  before re-running clean.
- **Full 3-region gate**, run against the fully reconstructed baseline
  (wave 3 + both prior carves' real source changes pulled in via
  targeted `git checkout <branch> -- <paths>`, verified byte-identical
  before this wave's own work started) and again after this wave's 12
  ships: `python tools/gate3.py --scope all` → `GATE PASS`, all three
  of `[eur]`/`[usa]`/`[jpn] SHA1 PASS` grepped individually from the
  log (not assumed from the summary banner alone), `pytest`: 3018
  passed, 16 skipped, 0 failed.
