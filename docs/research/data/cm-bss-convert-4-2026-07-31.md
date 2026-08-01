# cm-bss-convert-4 — fourth `.bss` carve batch (2026-07-31)

Follow-up to [`cm-bss-convert-3-2026-07-31.md`](cm-bss-convert-3-2026-07-31.md).
Two parts: a focused resolution of wave 3's two flagged struct-shape leads,
and a fresh reconciliation batch continuing to favor `Named-struct`
candidates.

## Result

**19 fresh symbols investigated (11 CONVERT/RETYPE, 8 DECLINE) plus 2
retypes of already-shipped symbols. 8 of 9 reconciled CONVERTs shipped
this wave** — the 9th (`data_ov001_021ca420_alias`) hit a genuine
build-tooling limitation and is deferred, reconciliation intact.

```
Typed-array:   158,276 -> 159,508 bytes  (+1,232 B,  3.31% -> 3.34%)
Named-struct:   52,068 ->  52,836 bytes  (+768 B,    1.09% -> 1.11%)
```

Measured against a **freshly re-baselined** `git stash` snapshot of this
exact branch point (`origin/main` at `12f62dbf6`) — not wave 3's own
reported numbers, per this wave's explicit filing instruction. The
`codex-scaffolder` lane's `q-typed-array-brace-nesting-fix` (PR #1408)
landed between wave 3 and this wave, correcting `Typed-array`'s
struct-internal-field over-count; the baseline measured here already
reflects that fix, so this wave's own delta is clean and directly
comparable to the per-symbol predictions (both deltas matched exactly).

## Part 1: the two wave-3 leads, resolved

Both `data_0218fd10` and `data_021a071c` were previously shipped as
conservative `char[]` with a flagged-but-unshipped struct alternate. Both
resolved to real retypes this wave — moving `Named-struct` only, since the
bytes were already counted in `Typed-array` under the old `char[]` form:

- **`data_021a071c` -> `slot_t data_021a071c[4]`** (+368 B Named-struct).
  Independently re-confirmed every field's offset *and* access width
  across all 5 ground-truth `.s` files (not just the stride wave 3 had
  already established). The one previously-unaccounted-for trailing byte
  turned out to be ordinary ARM EABI tail-padding, not a mystery field —
  resolving the exact blocker wave 3 flagged.
- **`data_0218fd10` -> `struct El02010f84 data_0218fd10[2]`** (+368 B
  Named-struct). A genuine breakthrough, not just more scrutiny: tracing
  transitively through a ground-truth `.s` call into a *separately*
  100%-matched callee (`func_020110c4`, confirmed via `report.json`)
  revealed 180 of 184 bytes (97.8%) are real, not the ~50 previously
  assumed. Only a 4-byte gap remains, cleanly isolated and padded
  explicitly.

Both moves are a pure reclassification of already-shipped bytes, not new
data coverage — the "fresh" byte totals below don't include them.

## Part 2: fresh batch, 9 reconciled CONVERTs, 8 shipped

### The alias carve: reconciled, but deferred on a real build-tooling limitation

`data_ov001_021ca420_alias` is the canonical partial-coverage-trap symbol
referenced throughout this campaign (`data_ov001_021ca420`, a 0-byte
marker, aliased to its real 32-byte storage under a second name — the
established C-34 literal-pool-dedup trick). Investigation found a fully
matched, 100%-shipped consumer proving a 4-byte bitfield struct at the
front, and reconciled the first real execution of the "partial-struct-
plus-honest-gap" pattern this project has referenced three times but never
shipped: a 4-byte proven struct plus an explicit 28-byte honest gap.

**First attempt failed the build**, not `ninja sha1` but the delink/LCF
generation step itself: `Error: .bss in file 'data_ov001_bss.s' has mixed
section order with previous file 'data_ov001_021ca420_alias.c'`. Root
cause: every prior wave's "front-peel" carve (target is the first symbol
in a cluster) left *no* preceding fragment at all. This is the first case
where the *remaining* fragment (the 0-byte marker, kept alone in its own
TU) has a truly **zero-width** `.bss start:X end:X` delinks entry — dsd's
section-ordering validator does not accept a zero-width `.bss` TU
adjacent to a real one. This is a new, previously-unencountered mechanical
wall, distinct from wave 1's alignment bug and wave 2's declaration-order
bug — both of those were compiler/linker behaviors this project could
work around in source; this one is dsd's own delink-stage validation.

**Deferred, not declined** — the reconciliation stands (this is a real,
evidenced CONVERT), only the mechanical split failed. Reverted cleanly;
`ninja sha1` passed immediately once reverted, confirming the ov001
carve was the sole cause. Left for a future wave to solve with a
different mechanical approach (e.g. keeping the 0-byte marker's `.global`
inside the alias's own TU via inline assembly, if that proves compatible
with the C-34 dedup mechanism's requirements — not attempted here).

### 8 shipped

| Symbol | Type | Bytes | Movement | Why |
|---|---|---:|---|---|
| `data_ov005_021b1e4c` | `Ov005DispatchState` (corrected, 5 fields) | 20 | Named-struct | The cited already-matched consumer's own typedef was itself incomplete — a ground-truth `.s` write plus 2 more matched `.c` consumers all touch a 5th field (+0x10) the original 4-field typedef never declared |
| `data_ov021_021ace80` | `Ov021DispatchState` (corrected, 3 fields) | 12 | Named-struct | Same class of finding — a ground-truth `.s` write plus 3 matched `.c` reads all touch a 3rd field (+0x8) |
| `data_ov021_021ad7d4` | `char[264]` | 264 | Typed-array | Opaque address-of, matches 4 already-shipped wave-1 precedents exactly |
| `data_ov015_021b66c4` | `char[208]` | 208 | Typed-array | Sole consumer's callee is a fully empty stub — zero structural evidence, zero contradiction |
| `data_ov019_021b6848` | `char[204]` | 204 | Typed-array | 200 of 204 bytes evidenced via a genuinely un-decompiled function disassembled directly from the ROM to trace the call graph; strong struct alternate documented, not shipped (same conservative call as wave 3) |
| `data_ov012_021cc86c` | `char[200]` | 200 | Typed-array | 3 scattered fields in the first 84 bytes; matches the established "thin evidence, ship conservative" precedent |
| `data_0219b490` | `char[192]` | 192 | Typed-array | Unusually strong `OSThread` evidence (exact size match + a call into an already-matched vendored SDK function dereferencing the exact predicted field) — held conservative anyway, flagged alongside `data_021a5340` for a dedicated future pass rather than establishing a first-ever vendored-SDK-type precedent in an already-complex wave |
| `data_ov015_021b5d4c` | `char[164]` | 164 | Typed-array | Sibling of `data_ov015_021b66c4`, same template, confirmed flat via one-level call-graph tracing |

**Fresh bytes shipped: 1,264** (8 symbols; `data_ov001_021ca420_alias`'s
32 B deferred). Combined with the 736 B of Named-struct-only retypes,
total delta matches the measured Typed-array (+1,232) and Named-struct
(+768) exactly.

### Declined (8)

| Symbol | Bytes | Why |
|---|---:|---|
| `data_ov006_0225dc34` | 560 | Wave-2 decline re-investigated in full: reconciled the two matched consumers' divergent partial structs into one (they didn't actually conflict), found 2 more real fields via a previously-uncaught raw-`.s` consumer — but only ~22-24% of the object is hard-evidenced; explicitly declined to trust a "coincidentally tiles exactly" argument for the trailing table, citing the project's own prior rejection of that exact reasoning (`data_0219adcc`) |
| `data_ov010_021b8c2c` | 164 | One confirmed field (+0xc) disproves a flat buffer; remaining 160 bytes unevidenced |
| `data_ov016_021bab44` | 156 | 7 confirmed fields found by tracing one level into the call graph; also disproved a prior research doc's offset claims (belonged to a different global) |
| `data_ov004_022113f8` | 152 | 7 fields cluster at both ends of the buffer; 124 middle bytes unevidenced |
| `data_ov008_021b2eac` | 148 | 2 confirmed fields; 146 of 148 bytes unevidenced |
| `data_ov017_021b8570` | 148 | 4 confirmed fields from a matched consumer; ~115 of 148 bytes unevidenced; also resolved an ambiguous doc reference (described a different sibling symbol) |
| `data_02186a58` | 144 | Every real reference stays within the first 16 of 144 bytes — neither `char[144]` (contradicts 6 proven fields) nor a 16-byte struct (contradicts the confirmed 144-byte allocation) is defensible |
| `data_ov006_0225e068` | 140 | Densest evidence of the batch — 13 confirmed fields — but still only ~72 of 140 bytes; also disproved 2 prior-research function-signature guesses (real functions are no-op stubs) |

## Process notes

- **A matched consumer's own extern is not proof of an object's full
  extent** — the headline finding of this wave. Both `data_ov005_021b1e4c`
  and `data_ov021_021ace80` are members of an already-6-times-shipped
  cross-overlay pattern, cited from an already-matched, byte-identical
  consumer — and both were still 4 bytes short. A matched consumer's
  extern is only guaranteed correct for *that function's own usage*, not
  the object's true size. Worth checking explicitly on every future
  pattern-family member, not just symbols with weak/absent evidence.
- **Tracing one level into the call graph continues to be where the real
  evidence lives** — decisive for both DECLINEs (`data_ov016_021bab44`,
  `data_ov006_0225e068`, several others) and the `data_0218fd10` RETYPE
  breakthrough (a transitively-matched callee).
- A new build-gate step appeared this wave: `docs/state-table.md` now has
  a committed-freshness test (`tests/test_generate_state_table.py`) — run
  `python tools/generate_state_table.py` alongside the research index
  regen before gating, going forward.
- Wave-14 safeguards applied throughout; every claim in this doc and the
  queue result block reconciled against `git diff --stat`/`git status
  --short` before writing it.

## Next steps

- `data_ov001_021ca420_alias`: reconciliation stands, needs a different
  mechanical approach to the TU split (see above) before it can ship.
- `data_0219b490` and `data_021a5340` (from `cm-bss-convert-2`) are both
  strong `OSThread` candidates — worth a dedicated wave that resolves the
  vendored-SDK-type-in-`src/` question once, for both symbols together.
- `data_ov019_021b6848`'s struct alternate (two ~92-byte "edit records" +
  a 16-byte animation-state tail, ~200 of 204 bytes evidenced) is ready
  for the same kind of focused follow-up that resolved this wave's two
  leads.
- `data_ov006_0225dc34` now has a fully reconciled *partial* field layout
  (0x0-0x7c) even though the trailing table remains unbounded — worth
  preserving so a future pass doesn't re-derive it from scratch; the
  concrete unblocking condition is getting `func_ov006_021b53d4` (or
  another `f_4c`-touching callee) matched to C.
