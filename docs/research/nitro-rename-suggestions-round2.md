# NitroSDK rename suggestions — round 2 (post-#117)

_Generated 2026-04-23 by `cloud` on brain's request following the
self-merge of PR #117 (bare-name → OS subsystem mapping for brief
011 BIOS thunks)._

**Run provenance**:

- Tool: `tools/nitro_suggest_renames.py` post-#117 (bare-name
  `BARE_NAME_SUBSYSTEMS` lookup added)
- Dict: `tools/nitro_dict.py build` against `ntrtwl/NitroSDK` @
  [`e6fbeba`](https://github.com/ntrtwl/NitroSDK/commit/e6fbeba60332e660639ad664eda2dc85c0e14649)
  (same pin as round 1's #114 run — reproducibility) —
  **1,752** function signatures across 45 subsystems
- Config: `config/eur` @ main `71b3e9c` (post-#115/#116/#117/#118/#119)
- Flags: `--include-failing-modules --limit 100` (see headline below
  for why failing-modules was unlocked)

## Headline: bare-name mapping is correct, blocked on `FAILING_MODULES`

Round 1 (#114) ran with defaults and produced 0 HIGH / 4 MEDIUM / 329
LOW. Round 2 with the same defaults produces **the same buckets**:
0 HIGH / 4 MEDIUM / 329 LOW. Same targets, same candidates.

The #117 bare-name mapping (`Halt` / `Div` / `SoftReset` / 15 others →
`OS`) _is_ wired correctly, verified by the 18 new regression tests
in that PR. It just can't fire in the default-scan corpus because:

| Fact | Count | Source |
|---|---|---|
| BIOS thunks named by brief 011 | 18 | `SoftReset`, `WaitByLoop`, `Halt`, `Div`, `Mod`, `Sqrt`, `CpuSet`, `CpuFastSet`, `GetCRC16`, `IntrWait`, `VBlankIntrWait`, `IsDebugger`, `BitUnPack`, `LZ77UnCompReadNormalWrite8bit`, `LZ77UnCompReadByCallbackWrite16bit`, `HuffUnCompReadByCallback`, `RLUnCompReadNormalWrite8bit`, `RLUnCompReadByCallbackWrite16bit` |
| Where those thunks live | **`main` only** | All 18 at `0x02000086`–`0x0200078a` |
| Call-graph callers of those thunks | **20 pairs, all in `main`** | No overlay calls into them in the current match state |
| Default scan behaviour | skips `main` | `FAILING_MODULES = {main, dtcm, ov004}` in `tools/analyze_symbols.py` |

So: every single function that could benefit from the bare-name-→-OS
signal is in `main`, which the default scan excludes. The #117 fix is
dead-code-in-default-mode until the `main` checksum gate drops (i.e.
until `dsd check modules` is 27/27 OK).

## With `--include-failing-modules`, the signal does fire

Re-running with the flag surfaces a **larger tractable corpus (1,035
vs 333)** and a **larger MEDIUM tier (12 vs 4)**. Exactly **one**
MEDIUM hit carries genuine callee-subsystem signal contributed by
PR #117: `func_02093820`. Every other MEDIUM still leans on caller-count
alone.

### The single new-signal hit

**`main|0x02093820` `func_02093820`** — size=0x28 (40 bytes),
out_degree=2, callers=10 across `main` (3), `ov004` (1), `ov016` (1),
`ov017` (5).

Callees:

- `main @ 0x02000400 = WaitByLoop` (one of the 18 bare-name OS thunks)
- `main @ 0x020903d4 = func_020903d4` (size=0x80, unmatched)

This function is the only non-leaf in the entire tractable set whose
callees resolve to a known NitroSDK subsystem. The scorer emits **5
score-3 OS candidates** tied on subsystem match alone:

| Score | Name | Subsystem | Args |
|---:|---|---|---|
| 3 | `OS_AddToHeap` | OS | `OSArenaId, OSHeapHandle, void*, void*` |
| 3 | `OS_AllocFixed` | OS | `OSArenaId, void**, void**` |
| 3 | `OS_AllocFromArenaHi` | OS | `OSArenaId, u32, u32` |
| 3 | `OS_AllocFromArenaLo` | OS | `OSArenaId, u32, u32` |
| 3 | `OS_AllocFromHeap` | OS | `OSArenaId, OSHeapHandle, u32` |

**These are noise** — the scorer alphabetises ties, and allocation
functions don't call `WaitByLoop`. The decomper should instead look
at NitroSDK's `OS_*` functions that themselves call `WaitByLoop`
(grep the NitroSDK tree) — probably something like `OS_SpinWait`,
`OS_Sleep`, timing-loop primitives. The score-3 tie surfaces the
problem, not the answer. But it _is_ the first real signal the tool
has given us on a non-leaf target.

## Why no HIGH-confidence hits

The classifier in `classify_confidence()` requires `top_score ≥ 5`
AND `gap ≥ 2`. Score distribution across the full 1,035-target run:

| Score | Candidate rows |
|---:|---:|
| 0 | 4,905 |
| 3 | 155 |
| 5+ | **0** |

Nothing scores 5. Breaking down the sources:

- **+3**: subsystem match (only `func_02093820` contributes; see above)
- **+2**: leaf-shape match (fires for 0-arg void leaves — all 11
  leaf MEDIUMs)
- **+1**: arg-count match (0 args, void return)

For a leaf at best: +2 leaf + +1 arg-count = **3** (saturates on
shape, no callees → no subsystem signal → no +3).

For a non-leaf at best: +3 subsystem = **3** (no leaf bonus applies;
`inferred_argcount` is `None` for non-leaves so +1 doesn't fire).

**The tiers are structurally unreachable under the current scorer
with the current named-callee coverage.** A target would need EITHER:

1. More named callees on non-leaf code, enabling a target to hit +3
   subsystem on _multiple_ callees — still caps at +3 per candidate.
2. A new scoring axis that isn't currently present (e.g. string-ref
   match, register-use fingerprint, size bucket beyond leaf/non-leaf).
3. The scorer to award +3 once AND stack a shape bonus for
   non-leaves. Today, non-leaves get no shape bonus.

Path 3 is a scorer change. Paths 1-2 are cascading work.

## Suggested next steps for brain

### Near-term (no tool changes)

1. **Inspect `func_02093820` first** — the single real signal hit.
   It calls `WaitByLoop` and one 128-byte internal. Grep NitroSDK for
   `OS_*` functions whose body touches `WaitByLoop`; it's a narrow
   candidate set. `func_02093820`'s 10 callers across ov004/ov016/ov017
   suggest a widely-used wait/sleep helper.

2. **Prioritise `main|0x0201e7ec`** among the leaf MEDIUMs — 18
   callers across **8 different overlays** is the widest cross-module
   distribution in the set, strongly suggesting a fundamental util
   (memcpy/memset/string primitive). Leaf so scorer offers no
   subsystem signal, but the caller distribution is distinctive.

3. **Cluster the 4 ov006 leaves** (`0x021c9ef4`, `0x021c6990`,
   `0x021c757c`, `0x021cac30`) via `tools/find_duplicates.py` — they
   share the 8-byte 0-out-degree shape and are all internal to ov006.
   Almost certainly sibling getters (`ldr r0, [r0, #N]; bx lr` with
   different `N`). Match one manually, run `propagate_template.py`.

### Medium-term (enables more signal)

4. **Rename the 20 `main`-resident callers of BIOS thunks** once
   `main` clears the checksum gate. These are the targets whose
   callee-graphs touch `Halt` / `Div` / etc.; once `--include-failing-
   modules` is off by default, the #117 signal starts firing for them.

5. **Adopt NitroSDK headers in `libs/nitro/`** so cross-module calls
   resolve to canonical `OS_*` / `GX_*` / etc. — that grows the
   "named callees" graph globally, not just in the BIOS corner.

### Scorer work (optional, low priority)

6. **Add a non-leaf shape bonus** to `_score_nitro_fn`. A 40-byte
   function with 2 callees and matching callee-subsystem should
   score higher than a bare subsystem match — right now they both
   cap at +3. Not urgent; the near-term paths above produce more
   practical signal.

## Raw report

The full Markdown output of the `--include-failing-modules --limit
100` run is below verbatim, unmodified, for provenance.

---

<!-- begin raw suggester output -->
## NitroSDK rename suggestions

Scanned **1035** tractable unmatched function(s) against a dictionary of **1752** NitroSDK signatures.

**Confidence breakdown:** 🟢 **0 HIGH**, 🟡 **12 MEDIUM**, ⚪ **1023 LOW**. LOW suggestions are hidden by default — re-run with `--show-low-confidence` to surface them.

_Dict source: `/tmp/NitroSDK`. Rebuild with `python tools/nitro_dict.py build --nitro-sdk <path>` after a NitroSDK update._

**Interpreting this report**: these are recommendations, not decisions. The decomper still verifies each candidate by inspecting the extracted assembly and running a match attempt. A single high-confidence pick unlocks more signal (re-run this tool after renames to tighten downstream subsystem inference).

### 🟡 MEDIUM-confidence (showing 12 of 12)

#### `main|0x02054140` `func_02054140` — size=0x8, out_degree=0, callers=34

Shape hints: inferred args: **0**.

| Score | Name | Subsystem | Return | Args |
|------:|------|-----------|--------|------|
| 3 | `CARD_CancelBackupAsync` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckEnabled` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPullOut_Polling` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPulledOut` | `CARD` | `void` | `void` |
| 3 | `CARD_Init` | `CARD` | `void` | `void` |

<sub>Rename hint: `python tools/rename_symbol.py main 0x02054140 <Candidate>`</sub>

#### `main|0x0201e7ec` `func_0201e7ec` — size=0x8, out_degree=0, callers=18

Shape hints: inferred args: **0**.

| Score | Name | Subsystem | Return | Args |
|------:|------|-----------|--------|------|
| 3 | `CARD_CancelBackupAsync` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckEnabled` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPullOut_Polling` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPulledOut` | `CARD` | `void` | `void` |
| 3 | `CARD_Init` | `CARD` | `void` | `void` |

<sub>Rename hint: `python tools/rename_symbol.py main 0x0201e7ec <Candidate>`</sub>

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
| 3 | `OS_AddToHeap` | `OS` | `extern void` | `OSArenaId id, OSHeapHandle heap, void * start, void * end` |
| 3 | `OS_AllocFixed` | `OS` | `extern void *` | `OSArenaId id, void ** rstart, void ** rend` |
| 3 | `OS_AllocFromArenaHi` | `OS` | `void *` | `OSArenaId id, u32 size, u32 align` |
| 3 | `OS_AllocFromArenaLo` | `OS` | `void *` | `OSArenaId id, u32 size, u32 align` |
| 3 | `OS_AllocFromHeap` | `OS` | `extern void *` | `OSArenaId id, OSHeapHandle heap, u32 size` |

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

#### `main|0x0201e7e4` `func_0201e7e4` — size=0x8, out_degree=0, callers=4

Shape hints: inferred args: **0**.

| Score | Name | Subsystem | Return | Args |
|------:|------|-----------|--------|------|
| 3 | `CARD_CancelBackupAsync` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckEnabled` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPullOut_Polling` | `CARD` | `void` | `void` |
| 3 | `CARD_CheckPulledOut` | `CARD` | `void` | `void` |
| 3 | `CARD_Init` | `CARD` | `void` | `void` |

<sub>Rename hint: `python tools/rename_symbol.py main 0x0201e7e4 <Candidate>`</sub>

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
