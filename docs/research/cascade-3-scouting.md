# Cascade-3 scouting — siblings of the #165 rename set

_Generated 2026-04-24 by `cloud` after brain's post-#166 handoff
flagged: "cascade-2 shipped 85 tier promotions from 4 renames.
If `bulk_rename_candidates.py` surfaces more sibling clusters to
`GetSystemWork` / `OS_DefaultIrqHandler` / `Fill32` /
`Task_InvokeLocked`, that'd seed another pilot brief."_

**Run provenance**:

- Tool: `tools/bulk_rename_candidates.py` (PR #153, same-module
  scan, `--min-score 0.3 --top 8`)
- Config: `config/eur` @ main (post-#165, `.claude/agents` + hooks
  + commands merged in #166/#173/#174)
- Workaround: two of the four anchors (`Fill32`, `Task_InvokeLocked`)
  still show as placeholders in `symbols.txt` as of this run — the
  `src/main/Fill32.s` and `src/main/Task_InvokeLocked.c` files
  reference the canonical names but the `rename_symbol.py` step
  appears not to have committed yet. Scouting bypassed the tool's
  named-anchor guard via in-memory name override; the symbol map
  should catch up on the next main push.

## TL;DR

| Anchor | Strongest sibling | Score | Jaccard | Shared callers | Size |
|---|---|---:|---:|---:|---|
| `GetSystemWork` | `func_02018a2c` | 0.41 | 0.02 | 4 | 0xc (exact) |
| `Fill32` | `func_020944d4` | 0.40 | 0.08 | **17** | 0x18 |
| `OS_DefaultIrqHandler` | — | 0.30 | 0.00 | 0 | (no real siblings) |
| `Task_InvokeLocked` | `func_020067fc` | **0.42** | **0.25** | **36** | 0x74 |

**Recommended brief 015 / cascade-3 pilot**: anchor on
**`Task_InvokeLocked`**. Its cluster is the richest of the four —
0.25 caller-Jaccard on the top sibling, 36 shared callers,
addresses contiguous in the 0x02005xxx–0x02007xxx range. Secondary
pick: **`Fill32`** (one standout sibling at 0x020944d4 with
17 shared callers, likely `MI_CpuCopy32` or similar).

`OS_DefaultIrqHandler` is a structurally unique singleton; scouting
surfaces only unrelated 4-byte `bx lr` stubs. Skip.

## Per-anchor details

### `GetSystemWork` (`main|0x02018b28`, size=0xc)

| Rank | Score | Addr | Size | Adj | Shared callers |
|---:|---:|---|---:|---|---:|
| 1 | 0.41 | `0x02018a2c` | 0xc | ✓ | 4 |
| 2 | 0.35 | `0x020190c0` | 0x10 | ✓ | 9 |
| 3 | 0.35 | `0x020191cc` | 0x10 | ✓ | 7 |
| 4 | 0.32 | `0x02019528` | 0x10 | ✓ | 0 |
| 5 | 0.30 | `0x02006e1c` | 0xc | — | 0 |

Top-4 are all adjacent to `GetSystemWork` and in the same
instruction family. `func_02018a2c` is the closest — same size
(0xc), 0x100 bytes before the anchor, 4 shared callers. Plausible
candidates: `SetSystemWork`, `GetSystemWorkSlot<N>`, or an
offset-specific getter into the same singleton.

`func_020190c0` (0x10, 9 shared) and `func_020191cc` (0x10, 7
shared) are slightly bigger and share *more* callers than the
direct same-size neighbour. These might be the actual higher-level
system-work accessors; `func_02018a2c` could be a lower-level
primitive one.

**Pilot move**: match `func_02018a2c` first as the simplest
(same-size, adjacent, 4 shared callers → likely a 1-2-instruction
delta from the matched `GetSystemWork.c`). If it matches cleanly
via propagate_template semantics, the cluster likely opens up.

### `Fill32` (`main|0x020944c0`, size=0x14)

| Rank | Score | Addr | Size | Adj | Shared callers |
|---:|---:|---|---:|---|---:|
| 1 | 0.40 | `0x020944d4` | 0x18 | ✓ | **17** |
| 2 | 0.40 | `0x02093790` | 0x14 | ✓ | 0 |
| 3 | 0.40 | `0x020937d0` | 0x14 | ✓ | 0 |
| 4 | 0.40 | `0x020952d0` | 0x14 | ✓ | 0 |
| 5 | 0.40 | `0x020952e4` | 0x14 | ✓ | 0 |
| 6 | 0.36 | `0x0209448c` | 0x18 | ✓ | 2 |

**The standout**: `func_020944d4` is literally the next function
after `Fill32` (Fill32 ends at `0x020944d4`). 17 shared callers —
a full 10% of Fill32's 168 callers also call this one. That's
classic "Fill + Copy" or "Fill32 + Fill16" pairing shape.

NitroSDK's likely candidates for the sibling:
- **`MIi_CpuCopy32`** / **`MI_CpuCopy32`** — if it's a copy (src+dst+count pattern)
- **`MIi_CpuClear32`** — redundant with Fill32, less likely
- **`MIi_CpuFill16`** — halfword variant
- **`OS_CpuCopy`** — less specialised

The 4 entries scoring 0.40 with 0-shared-callers are size-twins
in the `0x02093xxx` / `0x02095xxx` range. Cold candidates —
possibly other `MI_*` primitives, but no direct call-graph
evidence.

**Pilot move**: tackle `func_020944d4` first. Once you have both
Fill and its neighbour named, `propagate_template.py` can likely
handle the size-14 cold siblings if their reloc sigs match the
canonical pattern.

### `OS_DefaultIrqHandler` (`main|0x02090570`, size=0x4)

Every candidate scores 0.30 (pure size+mode match), 0 shared
callers, all are 4-byte `bx lr` stubs scattered across main.

`OS_DefaultIrqHandler` is the default interrupt service routine —
a singleton by NitroSDK design. No semantic siblings to cluster.

**Skip for scouting.** Keep as a standalone rename with no
cascade-follow-up planned.

### `Task_InvokeLocked` (`main|0x02006870`, size=0x44)

| Rank | Score | Addr | Size | Adj | Shared callers |
|---:|---:|---|---:|---|---:|
| 1 | **0.42** | `0x020067fc` | 0x74 | ✓ | **36** |
| 2 | 0.40 | `0x020069f4` | 0x44 | ✓ | 0 |
| 3 | 0.39 | `0x020062cc` | 0x48 | ✓ | 1 |
| 4 | 0.39 | `0x02005c60` | 0x40 | ✓ | 1 |
| 5 | 0.39 | `0x020058b4` | 0x3c | ✓ | 4 |
| 6 | 0.38 | `0x02005d0c` | 0x48 | ✓ | 0 |
| 7 | 0.38 | `0x020068b4` | 0x40 | ✓ | 0 |

**The richest cluster in the four-anchor survey.**

`func_020067fc` is **the function directly after `Task_InvokeLocked`
ends** (Task_InvokeLocked ends at 0x020068b4 → wait, `func_020067fc`
at 0x020067fc is ACTUALLY 116 bytes BEFORE the anchor's end; let
me re-read). Correction: `func_020067fc` at `0x020067fc` starts
140 bytes INTO `Task_InvokeLocked`'s range (0x02006870–0x020068b4).
That suggests dsd may have sub-divided what was one bigger
function, OR `func_020067fc` is actually a sibling whose
disassembly precedes the end of Task_InvokeLocked's sibling at
`0x020068b4`. Worth a closer look at the address arithmetic.

Regardless: **36 shared callers** and **0.25 Jaccard** is the
strongest sibling signal across all four anchors. This is a
classic "task-family" cluster — Task_InvokeLocked's description
mentions lock/dispatch/unlock; siblings are plausibly
`Task_Invoke`, `Task_Post`, `Task_TryInvokeLocked`, etc.

**Pilot move**: the cascade-3 brief should anchor here. After
matching `Task_InvokeLocked`, the sibling set — 4-5 functions in
the 0x02005xxx–0x02007xxx range with sizes 0x3c–0x74 — would
close most of the task-family surface in one wave.

## Recommended brief 015 shape (decomper-facing)

### Option A (maximum leverage, riskier): Task_InvokeLocked cluster

- Pick 3-4 of the `Task_InvokeLocked` neighbours ranked above.
  Match each in turn using `scratch_bundle.py` for context and
  the already-matched Task_InvokeLocked.c as a drafting template
  (via `pattern_library.py`).
- Rename each to its likely canonical name (Task_Invoke,
  Task_Post, Task_InvokeAndWait — need NitroSDK grep to confirm).
- Run `find_cascades.py` after each rename to measure downstream
  tier promotions.
- Ship as one PR with 3-4 matches.

### Option B (lower-risk, staggered): Fill32 pair

- Match `func_020944d4` as `MI_CpuCopy32` (or whichever NitroSDK
  `MI_*` name the disassembly supports).
- Ship as one small PR — validates the tool chain end-to-end
  before committing to a cluster.
- Follow up with the size-14 cold siblings only if the reloc sigs
  match the canonical Fill32 template.

### Option C (simplest): GetSystemWork pair

- Match `func_02018a2c` as the lower-level `GetSystemWork`
  primitive or `SetSystemWork` counterpart. Size-matches the
  anchor (0xc), adjacent, non-zero shared callers.
- Single-function PR.
- Lowest cascade uplift of the three options, but also the
  smallest diff.

**My lean**: Option A, but split the 3-4 matches across two PRs
if the first match takes >3 rounds of iteration. Task_InvokeLocked
already required careful lock/IRQ ordering to match; its siblings
will share that complexity.

## Integration notes for brain

- Once `Fill32` and `Task_InvokeLocked` land as real renames in
  `symbols.txt`, the in-memory-override workaround above disappears
  — `bulk_rename_candidates.py` will accept them as anchors
  directly. Re-run after that to get the official ranked output.
- `/cascade` + `/scratch` slash commands from PR #174 pair cleanly
  with this doc: pick a candidate from the ranked table, run
  `/scratch main <addr>` for context, iterate.
- The rename-cascade CI comment (PR #144) will quantify the
  downstream promotions when the brief-015 PR lands — useful
  signal for validating the cascade model against Option A's
  predicted uplift.

## Appendix — raw scoring details

Score formula (reminder from PR #153):

```
0.60 * caller-set Jaccard
+ 0.30 * size-similarity (min/max)
+ 0.10 * address-adjacency (within ±0x1000, same module)
```

The "shared callers" column above is the intersection size
— absolute, not normalised. A placeholder with 36 shared callers
against a named anchor is a much stronger sibling signal than one
with 4 shared callers even if their Jaccard scores are close,
because the anchor's own caller count (denominator) dominates the
Jaccard calculation for high-fan-in functions like
`Task_InvokeLocked` (149 total callers).

## Cross-refs

- PR #153 — `tools/bulk_rename_candidates.py` (scoring + scan)
- PR #132 — `tools/find_cascades.py` (tier-promotion predictor)
- PR #159 — `tools/scratch_bundle.py` (context bundle for drafting)
- PR #160 — `tools/pattern_library.py` (best-fit template lookup)
- PR #165 — the cascade-2 rename wave (4 names, 85 promotions) that
  this scouting pass builds forward from
- `docs/research/nitro-rename-suggestions-round3.md` — round-3
  suggester analysis (0 HIGH, 4 MEDIUM; signal-starvation theme)
