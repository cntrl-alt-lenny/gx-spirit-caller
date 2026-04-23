# NitroSDK rename suggestions — round 3 (post-#134)

_Generated 2026-04-23 by `cloud` after the name-token-overlap
discriminator from PR #134 landed on main. Brain asked for the
re-run to see whether HIGH-confidence hits now materialise._

**Run provenance**:

- Tool: `tools/nitro_suggest_renames.py` post-#134 (bare-name
  subsystem mapping from #117 + token-overlap discriminator from
  #134 both active)
- Dict: `tools/nitro_dict.py build` against `ntrtwl/NitroSDK` @
  [`e6fbeba`](https://github.com/ntrtwl/NitroSDK/commit/e6fbeba60332e660639ad664eda2dc85c0e14649)
  (same pin as rounds 1-2) — **1,752** function signatures across
  45 subsystems
- Config: `config/eur` @ main `a455c3c` (post-#132/#133/#134/#136/
  #140/#141)
- Both default and `--include-failing-modules` runs captured

## TL;DR

| Run | Tractable | HIGH | MEDIUM | LOW | Max score |
|---|---:|---:|---:|---:|---:|
| Round 1 (#114) defaults | 333 | 0 | 4 | 329 | 3 |
| Round 2 (#121) defaults | 333 | 0 | 4 | 329 | 3 |
| **Round 3 defaults** | **323** | **0** | **4** | **319** | **3** |
| Round 2 (#121) `--include-failing-modules` | 1,035 | 0 | 12 | 1,023 | 3 |
| **Round 3 `--include-failing-modules`** | **995** | **0** | **9** | **986** | **4** |

Two shifts since round 2, both real progress signal rather than
tool regressions:

- **Tractable set shrunk** 333 → 323 default, 1,035 → 995 with
  failing modules. The decomper's waves (#136 especially, which
  matched 6 forwarders around `func_02018b28` — cloud's top
  cascade target from PR #132) removed formerly-tractable
  entries. MEDIUM thinned accordingly (`func_02054140` with 34
  callers, `func_0201e7ec` with 18 callers, `func_02018b28` —
  all previously MEDIUM, all gone).
- **Score ceiling raised** from 3 → 4 in the failing-modules run.
  #134's token-overlap discriminator produced exactly **5
  score-4 candidates**, all on the single tractable target that
  carries token signal (`func_02093820`). Everywhere else the
  scores still cap at 3.

## Still 0 HIGH — and here's the arithmetic

HIGH requires score ≥ 5 AND gap ≥ 2. The theoretical ceilings
under the current scorer are:

| Shape | Max possible score | Ceiling source |
|---|---:|---|
| Leaf (out_degree=0) | +2 leaf + +1 argc = **3** | No callees → no subsystem / token signal |
| Non-leaf w/ OS callees | +3 subsystem + +2 overlap (cap) = **5** | Requires 2+ non-stopword tokens overlap |
| Non-leaf w/ mixed callees | +3 subsystem + +1 overlap = **4** | Single-token overlap |

So a HIGH hit *is* theoretically possible now (max-5 shape
exists), but requires:
1. A non-leaf target with at least one NitroSDK-convention named
   callee.
2. At least **two** non-stopword tokens in the callee's name
   that overlap a specific candidate.
3. The gap to 2nd place must be ≥ 2 (so the winning candidate
   matches 2 tokens and no others match even 1).

Condition 3 is the hard one. If the callee name has two
discriminating tokens, candidates in that subsystem tend to
reuse those tokens (e.g. `OS_SpinWait` + `OS_SpinLock` both share
"spin" with a callee named `SpinWait`). Gap stays 0-1, classifier
drops to MEDIUM.

## Signal coverage reality check

Out of **995** tractable targets in the failing-modules run:

| Signal | Count | % |
|---|---:|---:|
| Any NitroSDK-subsystem callee | **1** | 0.1% |
| Any non-stopword token from callees | **1** | 0.1% |

The single target with signal: `func_02093820`. The other 994 are
either leaves (no callees at all) or non-leaves whose callees are
all still placeholder-named.

So #134's token-overlap discriminator is genuinely active in the
corpus — it just fires for only one target today. That one target
shows the win cleanly:

```
Before #134 (round 2)          After #134 (round 3)
OS_AddToHeap          (3)      OS_LockByWord      (4) ← new
OS_AllocFixed         (3)      OS_SpinWait        (4) ← realistic
OS_AllocFromArenaHi   (3)      OS_TryLockByWord   (4) ← realistic
OS_AllocFromArenaLo   (3)      OS_UnLockByWord    (4) ← realistic
OS_AllocFromHeap      (3)      OS_UnlockByWord    (4) ← realistic
```

Top-5 moved from "alphabetical alloc noise" to "semantically
plausible lock/wait family." Decomper now has something to match
against the disassembly. Same tie within the new top-5 (all
score 4), but every member of the tie is realistic — any of them
could plausibly be the match.

## Why the corpus-wide picture doesn't change much

Signal coverage is gated by the size of the "named callee graph"
— how much of the call graph has real names. The named tier is
22/22 closed, but those 22 names (brief 011/012/013) are:

- 18 BIOS thunks in `main` (brief 011)
- 4 main-runtime entries in `main` (Entry, main, AutoloadCallback,
  __register_global_object — brief 012)
- 10 Thumb thunk wrappers in main (brief 013)

All in `main`. And most tractable-set targets (outside `main`) call
functions in their own overlay — those callees are still
placeholder-named. So the named-callee graph is essentially a
single node in `main` that ~20 overlay-local functions touch.

The signal graph grows when names move OUT of main. That'll happen
as brief 014 (rename cascade) lands, as header adoption for
`libs/nitro/` covers SDK call targets, or as tier-based matching
advances. Round 4 of this tool makes sense after the next wave of
renames, not sooner — re-running now would produce near-identical
results.

## Recommended brief 014 shape (decomper-facing)

The existing round-2 seed doc
(`docs/research/nitro-rename-suggestions-round2.md`) still holds;
round 3's only adjustment is **sharper candidate quality on
`func_02093820`**.

**Primary pick**: inspect `func_02093820` against the top-5
score-4 candidates. Grep NitroSDK tree for which of
`OS_SpinWait` / `OS_LockByWord` / `OS_TryLockByWord` /
`OS_UnlockByWord` actually calls `WaitByLoop` at the body level
— that's the match. Manual disassembly review, not tool output,
settles it.

**Secondary picks**: the 11 leaf MEDIUMs from round 2/3 still hold
(caller-count signal only). Cluster the 4 ov006 leaves via
`tools/find_duplicates.py`; prioritise `main|0x0201e7ec` for its
8-overlay cross-module spread.

**Cascade awareness (new)**: pair any rename pick with a look at
`tools/find_cascades.py` (PR #132) — the top hit `func_02018b28`
was already consumed by #136 (6 forwarders matched), but 672+
other cascade-producing targets remain. The rename-cascade loop
is: pick a high-cascade target → consult nitro_suggest for a
plausible name → match → promote → re-run cascades. Each loop
iteration unblocks downstream medium-tier work without requiring
new matches.

## Appendix — full round-3 failing-modules MEDIUM list

### 🟡 MEDIUM-confidence (showing 9 of 9)

#### `ov006|0x021c9ef4` `func_ov006_021c9ef4` — size=0x8, out_degree=0, callers=11

Shape hints: inferred args: **0**.

| Score | Name | Subsystem | Return | Args |
|------:|------|-----------|--------|------|
| 3 | `CARD_CancelBackupAsync` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckEnabled` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPullOut_Polling` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPulledOut` | `CARD` | `void` | `void` |
| 3 | `CARD_Init` | `CARD` | `void` | `void` |

<sub>Rename hint: `python tools/rename_symbol.py ov006 0x021c9ef4 <Candidate>`</sub>

#### `main|0x02093820` `func_02093820` — size=0x28, out_degree=2, callers=10

Shape hints: callee subsystems: **OS**.

| Score | Name | Subsystem | Return | Args |
|------:|------|-----------|--------|------|
| 4 | `OS_LockByWord` | `OS` | `s32` | `u16 lockID, OSLockWord * lockp, void (*ctrlFuncp)(void)` |
| 4 | `OS_SpinWait` | `OS` | `extern void` | `u32 cycle` |
| 4 | `OS_TryLockByWord` | `OS` | `s32` | `u16 lockID, OSLockWord * lockp, void (*crtlFuncp)(void)` |
| 4 | `OS_UnLockByWord` | `OS` | `s32` | `u16 lockID, OSLockWord * lockp, void (*ctrlFuncp)(void)` |
| 4 | `OS_UnlockByWord` | `OS` | `s32` | `u16 lockID, OSLockWord * lockp, void (*ctrlFuncp)(void)` |

<sub>Rename hint: `python tools/rename_symbol.py main 0x02093820 <Candidate>`</sub>

#### `ov006|0x021c6990` `func_ov006_021c6990` — size=0x8, out_degree=0, callers=8

Shape hints: inferred args: **0**.

| Score | Name | Subsystem | Return | Args |
|------:|------|-----------|--------|------|
| 3 | `CARD_CancelBackupAsync` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckEnabled` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPullOut_Polling` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPulledOut` | `CARD` | `void` | `void` |
| 3 | `CARD_Init` | `CARD` | `void` | `void` |

<sub>Rename hint: `python tools/rename_symbol.py ov006 0x021c6990 <Candidate>`</sub>

#### `ov006|0x021c757c` `func_ov006_021c757c` — size=0x8, out_degree=0, callers=8

Shape hints: inferred args: **0**.

| Score | Name | Subsystem | Return | Args |
|------:|------|-----------|--------|------|
| 3 | `CARD_CancelBackupAsync` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckEnabled` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPullOut_Polling` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPulledOut` | `CARD` | `void` | `void` |
| 3 | `CARD_Init` | `CARD` | `void` | `void` |

<sub>Rename hint: `python tools/rename_symbol.py ov006 0x021c757c <Candidate>`</sub>

#### `ov006|0x021cac30` `func_ov006_021cac30` — size=0x8, out_degree=0, callers=8

Shape hints: inferred args: **0**.

| Score | Name | Subsystem | Return | Args |
|------:|------|-----------|--------|------|
| 3 | `CARD_CancelBackupAsync` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckEnabled` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPullOut_Polling` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPulledOut` | `CARD` | `void` | `void` |
| 3 | `CARD_Init` | `CARD` | `void` | `void` |

<sub>Rename hint: `python tools/rename_symbol.py ov006 0x021cac30 <Candidate>`</sub>

#### `main|0x0207fce0` `func_0207fce0` — size=0x8, out_degree=0, callers=7

Shape hints: inferred args: **0**.

| Score | Name | Subsystem | Return | Args |
|------:|------|-----------|--------|------|
| 3 | `CARD_CancelBackupAsync` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckEnabled` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPullOut_Polling` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPulledOut` | `CARD` | `void` | `void` |
| 3 | `CARD_Init` | `CARD` | `void` | `void` |

<sub>Rename hint: `python tools/rename_symbol.py main 0x0207fce0 <Candidate>`</sub>

#### `main|0x02062510` `func_02062510` — size=0x8, out_degree=0, callers=5

Shape hints: inferred args: **0**.

| Score | Name | Subsystem | Return | Args |
|------:|------|-----------|--------|------|
| 3 | `CARD_CancelBackupAsync` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckEnabled` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPullOut_Polling` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPulledOut` | `CARD` | `void` | `void` |
| 3 | `CARD_Init` | `CARD` | `void` | `void` |

<sub>Rename hint: `python tools/rename_symbol.py main 0x02062510 <Candidate>`</sub>

#### `main|0x02091814` `func_02091814` — size=0x8, out_degree=0, callers=5

Shape hints: inferred args: **0**.

| Score | Name | Subsystem | Return | Args |
|------:|------|-----------|--------|------|
| 3 | `CARD_CancelBackupAsync` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckEnabled` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPullOut_Polling` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPulledOut` | `CARD` | `void` | `void` |
| 3 | `CARD_Init` | `CARD` | `void` | `void` |

<sub>Rename hint: `python tools/rename_symbol.py main 0x02091814 <Candidate>`</sub>

#### `main|0x020689dc` `func_020689dc` — size=0x8, out_degree=0, callers=4

Shape hints: inferred args: **0**.

| Score | Name | Subsystem | Return | Args |
|------:|------|-----------|--------|------|
| 3 | `CARD_CancelBackupAsync` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckEnabled` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPullOut_Polling` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPulledOut` | `CARD` | `void` | `void` |
| 3 | `CARD_Init` | `CARD` | `void` | `void` |

<sub>Rename hint: `python tools/rename_symbol.py main 0x020689dc <Candidate>`</sub>

---
<sub>🤖 Generated by `tools/nitro_suggest_renames.py`. Confidence labels derived from score gap + signal (callee subsystems, caller count) — see `classify_confidence` for the heuristic.</sub>
