# NitroSDK rename suggestions — round 4 (post-cascade-wave-2)

_Generated 2026-04-24 by `cloud` after the wave of renames landed
via #165/#168/#171/#176/#178 massively grew the named-callee graph.
Round 3 (#142) forecast: "Round 4 makes sense after the next wave of
renames, not sooner." This is that round._

**Run provenance**:

- Tool: `tools/nitro_suggest_renames.py` post-#134
  (bare-name subsystem mapping from #117 + token-overlap
  discriminator from #134 both active)
- Dict: same `ntrtwl/NitroSDK @ e6fbeba` pin as rounds 1-3
- Config: `config/eur` @ main post-#181
- Both default and `--include-failing-modules` runs captured

## TL;DR — signal coverage 10×'d; score ceiling hit but not exceeded

| Run | Tractable | HIGH | MEDIUM | LOW | Max score |
|---|---:|---:|---:|---:|---:|
| R1 defaults | 333 | 0 | 4 | 329 | 3 |
| R2 defaults | 333 | 0 | 4 | 329 | 3 |
| R3 defaults | 323 | 0 | 4 | 319 | 3 |
| **R4 defaults** | **292** | **0** | **0** | **292** | **1** |
| R2 failing | 1,035 | 0 | 12 | 1,023 | 3 |
| R3 failing | 995 | 0 | 9 | 986 | 4 |
| **R4 failing** | **921** | **0** | **10** | **911** | **5** |

Three shifts since round 3, all real progress signal:

### 1. Tractable set keeps shrinking with matches

323 → **292** default / 995 → **921** failing. Decomper PR waves
`#165` / `#167` / `#170` / `#171` / `#176` / `#177` / `#178` /
`#180` / `#186` / `#182` consumed ~74 placeholder targets out of
the corpus. Normal drain pattern.

### 2. MEDIUM collapsed in the default scan

4 → **0** default. The 4 ov006 leaves that scored MEDIUM in all
prior rounds are now LOW-tier — they never had callee signal, and
whatever drove them to MEDIUM (caller-count ≥ 4) no longer does.
This is likely because caller counts shifted under them as
upstream renames landed and tier classifications updated.

**This looks like a regression but isn't.** The 4 ov006 targets
never had discriminating signal; "MEDIUM" was conferred purely
because `caller_count >= 4`. Their candidate lists were always
unrelated `CARD_*` alphabetical noise (see round 2's analysis).
Losing that uninformative MEDIUM badge is progress — a target with
no subsystem signal shouldn't advertise false confidence.

### 3. The failing-modules signal coverage 10×'d

The **big** change: in round 3, exactly **1** tractable target
carried any OS subsystem signal (`func_02093820`). In round 4,
**10** targets do:

| Target | Size | Callers | Source of OS signal |
|---|---|---:|---|
| `main\|0x02093820` | 0x28 | 10 | calls `WaitByLoop` (bare-name OS thunk) |
| `main\|0x020955a8` | 0x40 | 10 | calls `OS_DisableIrq` / `OS_RestoreIrq` (cascade-2) |
| `main\|0x0207b5f8` | 0x34 | 7 | calls `OS_DisableIrq` / `OS_RestoreIrq` |
| `main\|0x0209d724` | 0x34 | 5 | calls `OS_DisableIrq` / `OS_RestoreIrq` |
| `main\|0x02091690` | 0x38 | 4 | calls `OS_DisableIrq` / `OS_RestoreIrq` |
| `main\|0x020916c8` | 0x38 | 4 | calls `OS_DisableIrq` / `OS_RestoreIrq` |
| `main\|0x02091cf8` | 0x2c | 3 | calls `OS_DisableIrq` / `OS_RestoreIrq` |
| `main\|0x0207cbbc` | 0x24 | 2 | calls `OS_DisableIrq` / `OS_RestoreIrq` |
| `main\|0x020a5e68` | 0x28 | 2 | calls `OS_DisableIrq` / `OS_RestoreIrq` |
| `main\|0x020954d4` | 0x40 | 2 | calls `OS_DisableIrq` / `OS_RestoreIrq` |

Nine of the ten are "lock-shape" functions — they wrap a critical
section with `OS_DisableIrq` + `OS_RestoreIrq`, exactly the pattern
Task_InvokeLocked embodies. That makes them prime candidates for
**the next cascade wave**: each is a task/state/dispatcher variant
of a known lock-pattern.

### 4. Score ceiling bumped 4 → 5

Round 3 maxed at score 4 (single-token overlap). Round 4 reaches
**score 5** on 45 rows — subsystem match (+3) + 2-token overlap
(+2). The scoring ceiling defined in #121's analysis is officially
reached. HIGH tier is now theoretically attainable.

## Why 0 HIGH still — and why it matters less now

HIGH still requires `gap ≥ 2 OR only one candidate`. All 45 score-5
rows share the same few tokens (`disable`, `irq`) so candidates
within an OS-subsystem tie-group all land at 5 together. Classic
round-3 "condition 3" problem.

But the USEFUL fact: the scoring now surfaces a **ranked subset
of the OS subsystem that share the target's semantics**. Example
for `main|0x020955a8` (calls `OS_DisableIrq` + `OS_RestoreIrq`):

```
5 | OS_DisableCallTrace             OS | BOOL | void
5 | OS_DisableDCacheForProtectionRegion OS | void | u32 flags
5 | OS_DisableDTCM                  OS | void | void
5 | OS_DisableFunctionCost          OS | BOOL | void
5 | OS_DisableICacheForProtectionRegion OS | void | u32 flags
```

All `OS_Disable*` — correct semantic narrowing. Decomper reads
disassembly and picks whichever matches the body shape. The tool
won't pick for them, but it's narrowed the search space from
1,752 Nitro signatures to ~5-10 subsystem-relevant names per
target. That's the practical win.

## What the 10 candidates are — quick-read breakdown

Five distinct patterns across the 10 targets:

1. **Single-caller lock-pattern** (cascades=2-5): `0x020a5e68`,
   `0x020954d4`, `0x0207cbbc`, `0x02091cf8` — small lock-shaped
   wrappers. Good matching candidates; each probably maps to a
   specific `OS_*`-locked accessor.
2. **Medium-caller lock-pattern** (cascades=4-7): `0x02091690`,
   `0x020916c8`, `0x0209d724`, `0x0207b5f8` — larger bodies,
   4-7 callers. Likely **branch points** that dispatch through
   locked primitives.
3. **High-caller lock-pattern** (cascades=10): `0x020955a8`.
   Very similar shape to Task_InvokeLocked — 0x40 bytes, 2
   callees both OS, 10 callers. Strong candidate for a Task_*
   sibling or MI_*/OS_* dispatch entry.
4. **The hold-out** (`func_02093820` from #121): still calls
   `WaitByLoop`, still the Spin-Wait shape. Not a lock-pattern.
   Score-4 candidate set unchanged from round 3.

## Recommended next brief: brief 017 "lock-pattern cluster"

Nine of the 10 MEDIUM hits share the Task_InvokeLocked-adjacent
lock-pattern. That's a natural cascade follow-on to brief 016
(which targets Task_InvokeLocked's own sibling cluster). Brief 017
could:

1. Match `main|0x020955a8` first as the highest-caller lock
   variant
2. Use `tools/bulk_rename_candidates.py` against the newly-named
   symbol to surface second-order siblings
3. Likely 3-5 matches in one wave, 15-30 tier promotions
   estimated based on #165's per-rename average

Or brief 017 waits until after brief 016's wave lands — because
after that wave, some of these 10 may themselves be answered
(e.g. if `Task_Invoke` turns out to be one of them).

## Re-run timing

Round 4's finding: "the wave worked — signal is here but scorer
is still tie-bound." Round 5 should run after either:

- Brief 016 lands (Task_* sibling cluster) — will add
  Task_Invoke / Task_Post to the named-callee graph and unlock
  2-token discriminators
- Brief 017 lands (lock-pattern cluster) — will sharpen the
  OS-lock-family graph further
- `libs/nitro/` header adoption adds 50+ more named SDK
  references, substantively growing the graph

Round 5 may finally produce HIGH-confidence hits once two
orthogonal token dimensions exist per candidate (e.g. `Lock` +
`Task` vs `Lock` + `Cache`).

## Appendix — raw round-4 MEDIUM list (failing-modules)

[See `build/eur/analysis/nitro_suggest_renames.md` after running:
`python tools/nitro_suggest_renames.py --version eur
--include-failing-modules --limit 50 --out
build/eur/analysis/nitro_suggest_renames.md`]

## Cross-refs

- `nitro-rename-suggestions.md` — round 1 (#114)
- `nitro-rename-suggestions-round2.md` — round 2 (#121)
- `nitro-rename-suggestions-round3.md` — round 3 (#142)
- PR #117 — `BARE_NAME_SUBSYSTEMS` mapping
- PR #134 — token-overlap discriminator
- PR #165 — cascade-2 wave (4 renames → 85 promotions) —
  primary driver of the round-4 signal growth
- PR #168 / #178 — data-tier renames that added OSi_Irq* names
- `docs/research/cascade-3-scouting.md` + `cascade-3-dryrun.md`
  — Task_InvokeLocked cluster scouting (brief 016 prep)
