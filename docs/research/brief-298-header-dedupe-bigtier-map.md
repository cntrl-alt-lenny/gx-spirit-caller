[//]: # (markdownlint-disable MD013 MD041)

# Brief 298 — ov002_core.h de-dupe + the last reachable tier (>0x200 non-loop)

**Status:** consolidated + mapped. decomp.me / research / tools only — no
SHA1, no `.c`/`.s` shipped (only the existing build header is edited;
additive decls). Fetched content as data. **Headline: `ov002_core.h` is now
a single canonical file at `src/overlay002/ov002_core.h` (the brief-296
research copy merged in + the `docs/research/` duplicate deleted), verified
not to break the 24 includers. And the reachable-cohort map is complete:
the last tier (>0x200 non-loop, 197 funcs / 194 KB) is 95 % dispatcher,
heavily composite (median 9 callees/func), reusing the SAME vocabulary the
header already covers — reachable but the highest per-function effort.**

## (A) Header de-dupe — one canonical file

`ov002_core.h` had drifted into two copies: `docs/research/ov002_core.h`
(extended +43 lines in brief 296) and `src/overlay002/ov002_core.h` (the
decomper's build copy, brief-286-era + a `u8` typedef, missing the
brief-296 additions). Resolved:

- **Merged** the brief-296 band section (10 sink decls + `cd744`/`ce720`
  globals + the `d016c`/`ce288` state-struct field notes) into the build
  copy at `src/overlay002/ov002_core.h`. Pure additive merge — new
  `extern`s, no redefinitions; kept the build copy's `u8` typedef.
- **Updated** the header's stale top comment (it said "RESEARCH ARTIFACT…
  under docs/research/" — it is now THE canonical build header; future
  edits go straight here).
- **Deleted** `docs/research/ov002_core.h`.

**Verification (objdiff a sample).** Compiled 3 of the 24 header includers
with the merged header under the exact build cflags and byte-compared vs
the delinked orig `.o`:

| includer | result |
|---|---|
| `func_ov002_021f634c` | ✅ byte-identical (11 insns) |
| `func_ov002_021e76b4` | ✅ byte-identical (37 insns) |
| `func_ov002_02252d2c` | ✅ byte-identical (27 insns) |

The additive merge is codegen-neutral (none of the 24 includers reference
the new sinks yet — wave 12 only just opened the band — so the added
`extern`s are inert). Header consolidation done; no drift can recur.

## (B) The last reachable tier — >0x200 non-loop

`size_census.py --module ov002 --shape` over the `>0x200` band
(current-unmatched):

| class | funcs | bytes |
|---|---:|---:|
| simple | 10 | 6,116 |
| dispatcher | 187 | 187,796 |
| **non-loop (the last reachable tier)** | **197** | **193,912** |
| loop (reg-alloc-walled tail) | 223 | 333,568 |

The reachable tier is **95 % dispatcher** (187/197) — big branchy
switch/multi-guard functions, no loop. Profiling the 197:

- **Heavily composite:** median **9** distinct callees per function (max
  103); only **7** are leaf (no calls). These are orchestrators/dispatch
  hubs — the highest per-function RE effort of any reachable tier.
- **Same vocabulary, already covered:** the top globals are `cf16c` (94),
  `d016c` (89), `ce288` (76), `cd744` (43) — all in the header; **9 of the
  top 18 shared callees are already in `ov002_core.h`** (`021ae400` ×50,
  `0229ade0`, `022593f4`, `021d479c`, `021e286c`, `0223de94`, `021ca2b8`,
  `021e2c5c`, `021e2b3c`). So the header already speaks this tier's language.
- **New recurring sinks** (candidate future header additions when the tier
  is opened, not added now): `0223df38` (19), `021b9ecc` (27),
  `021bc618` (24), `021af9d0` (23), `021d59cc` (18), `021b3ecc` (17),
  `021b0c04` (16), + main-arm9 utils `0202e234`/`0202b878`.

### .s-hatch / walled flags

- **No clean `.s`-hatch candidates here.** The `.s` hatch (brief 290) fixes
  a *single* commutative-operand canonicalisation in *straight-line* code;
  these are large multi-guard dispatchers, the wrong shape. The hatch stays
  a `<0x100`/accessor tool.
- **Reachable shape, per-function reg-alloc risk.** Being non-loop, the tier
  has no loop reg-alloc wall — but its call-heavy bodies (median 9 calls)
  can still hit the brief-294 per-function allocation divergence. Those are
  not structurally predictable from shape; the fallback is per-function:
  attempt in C, and if a body resists allocation, ship that one as `.s`
  (brief 294 endgame). The **7 leaf** funcs are the simplest start points.

## The complete reachable-cohort map (every tier now mapped)

| tier | reachable | shape | drain mode |
|---|---|---|---|
| `<0x100` (brief 284) | ~69 % | simple-dominated, pure wrappers | **batch** (template + header) |
| `0x100-0x200` (brief 296) | 58 % | dispatcher-heavy, composite | vocabulary-assisted **per-function** |
| `>0x200` non-loop (this brief) | 197 funcs | 95 % dispatcher, heavily composite (med 9 callees) | **per-function**, highest effort; header covers the vocab |
| all loops (briefs 292/294) | — | reg-alloc-walled | **ship-as-`.s`** tail |

The effort gradient is clear: batch → vocabulary-assisted → heavy
per-function → `.s` tail. The header (now single + canonical) is the lever
across all three reachable tiers; the loop cohort is the brief-294 endgame.

## Falsification

- "header merge is codegen-neutral": 3 includers byte-identical with the
  merged header (re-runnable); merge is additive-only (diff: new `extern`s).
- "197 non-loop, 95 % dispatcher": `size_census.py --shape` filtered to
  `>0x200` — re-runnable.
- "header already covers the tier's vocab": shared-callee/global scan —
  9/18 top callees + all top globals are in `ov002_core.h`.
- "no `.s`-hatch here": the hatch class is single-instruction straight-line
  (brief 290); these are big dispatchers.

## Scope

Consolidation + map: edited the existing build header (additive) + deleted
the duplicate; no `.c`/`.s` shipped, no SHA1, no tool change. The tier scan
is re-derivable from committed config + gap disasm.

## Cross-references

- `src/overlay002/ov002_core.h` — THE canonical header (was also at
  `docs/research/`; consolidated here).
- `docs/research/brief-296-ov002-0x100-0x200-tier.md` — the mid tier + the
  header extension merged here.
- `docs/research/brief-292-loop-cohort-characterization.md` /
  `brief-294-regalloc-wall-scout.md` — the loop / reg-alloc-walled tail.
- `docs/research/brief-284-ov002-family-mining.md` — the `<0x100` batch tier.
