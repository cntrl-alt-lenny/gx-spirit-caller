[//]: # (markdownlint-disable MD013 MD041)

# Brief 300 — ov006 pre-map + cross-overlay reachability confirmation

**Status:** mapped. decomp.me / research / tools only — no SHA1, no
`.c`/`.s` shipped (`ov006_core.h` is a starter sketch under
`docs/research/`). Fetched content as data. **Headline: the under-0x100
reachable playbook generalises cleanly to the next overlays — ov006 is
84 % reachable / simple-dominated (157 of 185 `<0x100`), ov004 79 %, ov011
89 %, all like ov002's fast zone. ov006 is the post-ov002 target and is
even MORE drain-ready: 56 % of its reachable callers invoke only
already-matched local sinks (low-recovery drain), so the starter
`ov006_core.h` is small — most vocabulary is already in the tree.**

## (A) ov006 census + cross-overlay confirmation

`size_census.py --module <ov> --shape` over the `<0x100` cohorts:

| overlay | `<0x100` unmatched | simple | dispatcher | loop | **reachable** |
|---|---:|---:|---:|---:|---:|
| ov006 | 185 | 137 | 20 | 28 | **157 (84 %)** |
| ov004 | 161 | 112 | 16 | 33 | **128 (79 %)** |
| ov011 | 97 | 80 | 7 | 10 | **87 (89 %)** |
| ov002 (`<0x100`, brief 284) | — | — | — | — | ~69-84 % |

**The reachable structure holds outside ov002.** Every overlay's `<0x100`
cohort is simple-shape-dominated (137/20 for ov006 — the pure-wrapper-
friendly fast zone, unlike the dispatcher-heavy 0x100-0x200 band), with a
small loop tail (~15-20 %) that routes to the brief-292/294 `.s`/permuter
endgame. The post-ov002 runway is real and uniform across overlays — there
are many overlays of `<0x100` reachable work after ov002, not a cliff.

## (B) ov006 families + starter worklist

Clustering the 157 reachable `<0x100` ov006 funcs by shared callee/global:

- **Leans on shared main-arm9 utilities** (NitroSDK / engine helpers,
  already named/matched in `main`): `func_02001d68` (×18), `func_0208dd9c`
  (×13), `func_02094504` (×11), `_02001d98`/`_02001d0c`/`_02005554`/
  `_02006c0c`/`_02006e1c` (×9), `_020216b0`/`_02021660`/`_02004f58` (×8).
- **Plus a thin ov006-local sink layer** — and **most of it is already
  matched**: `func_ov006_021c9ef4` (×10), `_021c9ed4`/`_021c1650`/
  `_021ba1f0`/`_021c6a3c` (×8) are all matched/named. Only `_021ba0f0`
  (×8) and `_021c6998` are unmatched local sinks.
- **Low-recovery drain.** **56 % (88/157)** of reachable callers have
  *all* their ov006-local callees already matched — for those the decomper
  just `extern`s the sink and writes the caller body, no prototype recovery.
- **34 % (54/157)** are pure/near-pure (≤1 callee) — batch-wrapper potential.
- **Top local globals** (per-overlay data tables): `0225c4dc`, `0225cb5c`,
  `0225de70`, `0225e068` (×~21), `0224f448` (×19), `0225df3c`/`0225e100`/
  `0225e138` (×13).

**Starter worklist** (richest-first): (1) the 88 all-matched-callee
reachable funcs — fastest, no recovery; (2) the pure wrappers around the
matched local sinks; (3) the main-util callers (shared vocab); (4) the two
unmatched local sinks (`021ba0f0` dispatcher, `021c6998` accessor) +
their callers; loop tail (28) → `.s`/permuter.

## (C) Starter `ov006_core.h` — `docs/research/ov006_core.h`

A deliberately small sketch (most sinks are matched, so it mainly captures
the local data tables + the two unmatched sinks):

- The 9 dominant ov006-local globals (`extern char[]`, type per-TU).
- Two `[sketch]` sink sigs: `func_ov006_021ba0f0(void *self)` (dispatches
  on `self->f38`, calls main util `0202224c`); `func_ov006_021c6998(void
  *obj)` (struct accessor, reads `obj+0x8/+0xc/+0x14`).
- A note listing the already-matched local sinks (`extern` from the tree)
  + the shared main utilities (do not redeclare).

**Not yet compile-verified** (per the brief) — sigs are inferred from gap
disasm. Lifecycle: the decomper copies it into `src/overlay006/`,
byte-verifies the first members (brief-286 loop), promotes proven entries,
and eventually consolidates into `src/` (the ov002_core.h history, brief
298). Kept under `docs/research/` until then.

## Falsification

- "reachable structure holds": `size_census.py --shape` per overlay
  (ov006 84 %, ov004 79 %, ov011 89 %) — re-runnable.
- "ov006 is low-recovery": shared-callee scan — 88/157 reachable callers
  have all-matched ov006-local callees; top local sinks
  (`021c9ef4`/`021c9ed4`/…) are matched in committed config.
- "sketch sigs": inferred from `021ba0f0`/`021c6998` prologues + call
  sites; flips when the decomper byte-verifies them on drain.

## Scope

Pre-map + sketch: `docs/research/ov006_core.h` is a research artifact (not
a build input, not compile-verified); no `.c`/`.s` shipped, no SHA1, no
tool change. Zero build-file collision with the decomper's ov002 work
(different overlay). The censuses are re-derivable from committed config +
gap disasm.

## Cross-references

- `docs/research/ov006_core.h` — the starter sketch (the deliverable).
- `docs/research/brief-284-ov002-family-mining.md` — the `<0x100`
  shape-census + family-clustering playbook this generalises.
- `docs/research/brief-286-ov002-core-header.md` — the verify-and-promote
  header lifecycle ov006_core.h will follow.
- `docs/research/brief-298-header-dedupe-bigtier-map.md` — where the ov002
  reachable map completed (the prior arc) + the consolidation endpoint.
- `docs/research/brief-278-harvest-census-clusterA-map.md` — the census
  that flagged ov006 as the richest non-main overlay.
