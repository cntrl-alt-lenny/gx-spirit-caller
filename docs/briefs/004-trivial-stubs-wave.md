### claude-pc/trivial-stubs-wave

**Goal:** Match the 56 remaining 4-byte `bx lr` stub functions across 6
passing overlays (ov006, ov007, ov014, ov016, ov017, ov019). Same
template as brief 001's ov005 trivials — copy, change address, verify
100% match, move on. Should close the trivial-tier tail for every
overlay the sinit work touched.

**Context:**

- Brief 001 matched 12 × 4-byte stubs in ov005.
- Brief 003's ctor/dtor follow-up (PR #55) matched 10 × 4-byte stubs
  in ov009 and ov021.
- The remaining 56 live across 6 passing overlays per
  `python tools/next_targets.py --version eur --tier trivial
  --module <ov> --no-outputs`:

  | Overlay | Trivials left |
  |---------|---------------|
  | ov006   | 22            |
  | ov016   | 10            |
  | ov017   | 8             |
  | ov014   | 6             |
  | ov019   | 6             |
  | ov007   | 4             |
  | **Total** | **56**      |

- All 6 modules round-trip byte-identically today (`dsd check modules`
  → 24/27 OK). Regressions are detectable.
- Template: each stub is an empty `void func_<mod>_<addr>(void) {}`
  that compiles to a single `bx lr`. See the ov005 brief 001 pattern
  files under `src/overlay005/ov005_stubs_*.c` for how to bucket
  them (one `.c` per address cluster if the gaps between addresses
  are wide, otherwise batched).
- These are the **easiest possible matches** — the risk is only
  getting the symbol address right and the return type not mismatching.

**Scope:**

- New `src/overlay<NN>/ov<NN>_stubs_<cluster>.c` files for each
  overlay, following the ov005/ov009 naming convention.
- `config/eur/arm9/overlays/ov<NN>/delinks.txt` — append `complete`
  TU entries with the `.text` ranges for each new file.
- **Do not** rename in `symbols.txt`. Keep dsd-canonical
  `func_<mod>_<addr>` until we have real names from call-site
  context.

**Non-scope:**

- ❌ Failing modules (`main`, `dtcm`, `ov004`). `next_targets` will
  surface trivials in main; skip them — the placeholder-symbol
  artifacts in failing modules make regression detection unreliable.
- ❌ Easy-tier leaves (size 0x8+). That's a follow-up brief (005).
  1118 easy candidates are waiting; this brief stays scoped to the
  0x4 tier.
- ❌ The 4 deferred sinit outliers (ov002 0x18, ov011 0x34, ov010 ×2
  0x48). Those need targeted C incantations and get their own brief.

**Success:**

- `ninja rom && ./dsd check modules -c config/eur/arm9/config.yaml`
  still reports **24/27 OK**. No regressions in previously-passing
  modules.
- `ninja objdiff` shows each new stub at 100%.
- `python tools/next_targets.py --version eur --tier trivial`
  breakdown shifts appropriately (56 → near-0 unmatched trivials
  once the wave closes).
- PR cadence: **one PR per 2-3 overlays**, matching the sinit wave
  cadence. Don't batch all 56 in one PR — breaking them up gives
  brain review leverage if the template accidentally diverges.

**Branch:** `claude-pc/trivial-stubs-wave` (or per-overlay-pair,
e.g. `claude-pc/trivial-stubs-ov006-ov007`).

**Useful new tools (both landed today):**

- [`tools/next_targets.py`](../../tools/next_targets.py) — this
  brief's source of truth. Filter by tier+module to get the exact
  address list per PR.
- [`tools/find_callsites.py`](../../tools/find_callsites.py) — if
  you wonder whether a stub is really a leaf or has meaningful
  callers, `python tools/find_callsites.py --version eur <module>
  <addr>` shows callers/callees/loads in one shot. Handy for
  noticing when a "trivial stub" is actually called by many
  callsites with a clear type signature, in which case naming it
  properly earns bulk renames via `tools/rename_symbol.py`.

**After this brief lands:**

Follow-ups in priority order:

1. **Brief 005: easy-tier wave** — 1118 unmatched easy candidates
   surfaced by `next_targets`. Brain will scope to the top ~30
   across the same 6 recently-touched passing overlays, following
   the brief 001 "easy-tier leaves" pattern.
2. **Brief 006: sinit outlier cleanup** — the 4 deferred sinits
   with diffs. Targeted C incantations or reasoned asm exemptions.
3. **Brief 007: medium tier probe** — 22 named-medium candidates
   and 6 unnamed-medium. These need actual disassembly
   understanding rather than pattern-copy.
