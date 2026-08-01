# cm-bss-convert-6 — vendored-SDK type-signature scan + sixth carve batch (2026-08-01)

Follow-up to [`cm-bss-convert-5-2026-08-01.md`](cm-bss-convert-5-2026-08-01.md).
Two parts: a dedicated scan for `.bss` symbols matching NitroSDK vendored
concrete-type signatures (following the `OSThread` precedent), and a
fresh reconciliation batch continuing to favor `Named-struct` candidates.

## Result

**Vendored-SDK scan: 5 real `MtxFx33`/`MtxFx43` matrix candidates found
and shipped (228 B) — a first for this project's math types.** Two
full-family negative results (`VecFx32`/`VecFx16`, 87 candidates
screened; `OSLockWord`, 72 candidates screened) — genuinely useful,
thoroughly-evidenced "no," not a shortage of effort. **Fresh batch: 12
symbols investigated (9 CONVERT, 2 DECLINE, 1 reconciled-but-blocked),
all 9 CONVERTs shipped** (828 B), for 14 symbols / 1,056 B total this
wave.

```
Typed-array:   160,072 -> 160,900 bytes  (+828 B,  3.35% -> 3.37%)
Named-struct:   53,352 ->  53,580 bytes  (+228 B,  1.12% -> 1.12%)
```

Measured against a freshly re-baselined `git stash` snapshot of this
exact branch point (`origin/main` at `37b143ca5`), matching wave 5's
own reported ending values exactly (160,072 / 53,352). Both deltas
match the per-symbol hand-predicted totals exactly.

## Part 1: the vendored-SDK type-signature scan

This project's vendored NitroSDK subset (`libs/nitro/include/nitro/`)
is narrower than initially assumed — only 8 headers exist (no `fs.h`,
no `gx*.h`), so `FSFile`/`GXOamAttr`-style types aren't available yet.
The real candidate set, confirmed by reading every header directly:
`OSThread` (already exploited, 2 members shipped last wave),
`OSLockWord` (8 B, inter-CPU spinlock), and 6 fixed-point math types in
`fx_vec.h`/`fx_mtx.h` — `VecFx32`(12B)/`VecFx16`(6B),
`MtxFx22`(16B)/`MtxFx33`(36B)/`MtxFx43`(48B)/`MtxFx44`(64B). All were
**zero-usage in `src/`** going into this wave, confirmed by direct grep.

### 5 real matrix candidates, all shipped

| Symbol | Type | Bytes | Evidence |
|---|---|---:|---|
| `data_021a1974` | `MtxFx33` | 36 | Direct `bl MTX_Identity33_` call (already-shipped vendored SDK function) at its address, plus 3 sibling `MI_Copy36B` sites |
| `data_021a19b8` | `MtxFx43` | 48 | Matrix-concat-shaped raw asm: 3+3 `smull`/`smlal`/`smlal` dot-product triples, a `src==dst` alias guard, `MI_Copy48B` |
| `data_021a19e8` | `MtxFx43` | 48 | Direct `bl MTX_ScaleApply43` call with its own address as both src and dst — strongest single piece of evidence in the batch |
| `data_02186b00` | `MtxFx43` | 48 | Direct call into the same matrix-multiply routine as `data_021a19b8`, in-place (`dst=src2`) |
| `data_02186b30` | `MtxFx43` | 48 | 2 sites call an **already-matched C function** (`func_020115e0.c`) whose literal stores decode, column-major, to a textbook identity-rotation-plus-translation `MtxFx43` constructor |

All 5 ship as bracket-less scalar declarations (`MtxFx43 data_XXX;`) —
no evidence any pair is accessed as an indexed array, so 5 independent
declarations rather than a merged array. All move `Named-struct` only.

**One boundary nuance resolved, not hidden**: `data_021a1974`'s
consumer `func_0208b32c` (the same matrix-multiply routine used by
`data_02186b00`) reads 12 bytes past `data_021a1974`'s own 36-byte
end, into the immediately-following, already-separately-shipped
`data_021a1998` (`triple_020822c8_t`, 3 ints). Investigated directly:
the read lands exactly on `data_021a1998`'s own 3 fields (offsets
`+0x24/+0x28/+0x2c` relative to `data_021a1974`'s start = bytes 0/4/8
of `data_021a1998`). This is that one caller treating the two
adjacent, independently-correct globals as a combined 48-byte view for
its own purposes — a valid, if slightly emergent, C/asm pattern that
threatens neither symbol's own boundary. `data_021a1974`'s other 3
consumers (the identity-init call plus 3 `MI_Copy36B` sites) are
unambiguous, exact 36-byte reads/writes.

**Include-mechanism status**: `fx_mtx.h` is already compiled
successfully by 2 shipped `libs/nitro/*.legacy.c` files, but only
through the *legacy* mwcc rule — these 5 files are the first to compile
it through the *default* rule. `ninja sha1` passing on the first
attempt confirms it, resolving the same open risk flagged for
`OSThread` last wave.

### 2 full-family negative results

- **`VecFx32`/`VecFx16` (87 candidates, all 6-and-12-byte raw symbols
  in the EUR baseline): zero survive contact with their consumers.**
  Every one resolved to a real, evidenced non-vector shape — 46% are
  CodeWarrior C++ `__register_global_object` `chain_slot` bookkeeping
  (a project-documented pattern), the rest are linked-list/tree heads,
  state-machine records, handle-registration structs, or fragments of
  larger tables. This project's "no vendored-type precedent beyond
  `OSThread`-family" status for vector math is unchanged, on genuine
  evidence rather than absence of search.
- **`OSLockWord` (72 candidates, all 8-byte raw symbols): zero
  matches.** The actual lock-adjacent code in this codebase is a
  *different*, larger (>=16-24 byte) `OSMutex`-style intra-CPU
  recursive mutex (owner field + recursion count + wait-queue,
  `func_020927b8`/`func_02092748`), plus separate IRQ-disable critical
  sections — neither is the ARM7/ARM9 hardware spinword this type
  models. `OS_LockByWord`/`OS_SpinWait`/`OS_TryLockByWord` never appear
  as real symbol names anywhere in this codebase.

Both negative results are worth keeping on record for the same reason
as wave 5's DispatchState audit: they mean no future wave re-spends
effort re-checking a family that's already been ruled out on evidence.

## Part 2: fresh batch, 9 CONVERT / 2 DECLINE / 1 blocked

### 9 shipped

| Symbol | Type | Bytes | Notes |
|---|---|---:|---|
| `data_ov017_021b867c` | `char[256]` | 256 | **Cross-region symbol-address aliasing discovered**: JPN/USA assign this same name/address to a *different*, 12-byte object (a render-job handle array); EUR's own 256-byte object is a card-name string scratch buffer. A naive cross-region-blind consumer count would misattribute JPN/USA's consumers to EUR's object |
| `data_ov014_022350f4` | `char[92]` | 92 | Ship-confirmed 4-pointer-array-plus-flag struct shape found via one-level-deeper trace; held conservative (char[]) since full field typing wasn't completed this pass — flagged as a strong future Named-struct lead |
| `data_ov007_022334d0` | `char[80]` | 80 | Ship-confirmed 2-field (state/timer) sub-struct at +0x34/+0x38; same conservative-char[] treatment |
| `data_ov014_02235094` | `char[76]` | 76 | Ship-confirmed struct shape across 3 independent functions (8 distinct offsets); same treatment |
| `data_ov009_021adc00` | `char[72]` | 72 | Accessed via `int *` by 2 already-shipped consumers with named fields (surface handle, frame, enable flag, sub-struct); this wave's best-evidenced future Named-struct lead |
| `data_ov017_021b8794` | `char[64]` | 64 | Confirmed 4th member of the already-characterized "text-window handle-table cell" family (siblings `_87d4`/`_8814`/`_8854` remain uncarved) |
| `data_0218ff0c` | `unsigned short[32]` | 64 | **Type correction**: the dispatch prompt's "generic buffer" framing was incomplete — 2 raw `.s` consumers a `.c`-only search missed do genuine mod-32-indexed halfword arithmetic (a ring buffer), not a flat memset target |
| `data_02191fe0` | `char[64]` | 64 | **Lower-bound trap avoided**: its matched consumer's own struct (`ctx_0209eee0_t`) covers only 56 of 64 bytes, but the same function separately cache-flushes the full 64 bytes as one unit — shipped conservative rather than the truncating struct |
| `data_ov008_021b2cec` | `char[60]` | 60 | Opaque, `Fill32`-zeroed buffer, zero field evidence, zero contradicting evidence |

All 9 are bracketed arrays of primitive element types, so all 9 move
`Typed-array` only. 8 of the 9 (768 B) came from the volume-batch
reconciliation; the 9th, `data_ov008_021b2cec` (60 B), came from the
non-primitive-pool lead investigation. Sum: 768 + 60 = **828 B**,
matching the measured `Typed-array` delta exactly.

### Declined (2) — both confirmed fragments of larger structures

| Symbol | Bytes | Why |
|---|---:|---|
| `data_0219a834` | 120 | Arithmetic trace (not just field-offset reading) proves this is the tail of a >=13KB stride-0x3c/modulus-0x90 array rooted at the still-raw `data_02197434` — a single conflicting USA/JPN-only consumer (`Pair78[3]`, no EUR analog) does not overturn 3 independently-shipped EUR ground-truth `.s` consumers plus a corroborating research dossier |
| `data_021a1938` | 40 | Confirmed fragment of the >=256-byte structure rooted at `data_021a18b8` (4 already-shipped consumers touch offset +0xfc of that struct) — the specific fragment-risk this candidate was flagged with going in, verified directly rather than assumed |

### Reconciled but mechanically blocked (1) — second instance of the wave-4 pattern

`data_0219a924_alias` reconciles with **zero honest gap** (both fields
of `pool_0219a924_t { void *base; int count; }` fully read+written
across its 2 matched consumers) — arguably stronger evidence than the
wave-4 `data_ov001_021ca420_alias` precedent. Blocked by the same
`q-zero-width-bss-tu-fix` build wall, **confirmed still open by reading
the actual commit** (`4712190c3` only adds a `[TODO]` queue entry, no
code fix exists in `tools/`) rather than trusting the prior wave doc's
prose. This is now 2 shovel-ready carves (68 B combined) waiting on
that one tooling fix.

## Process notes

- **The vendored-SDK-type technique generalizes cleanly beyond
  `OSThread`.** The same 3-step method (survey the header for concrete
  types, check the include mechanism once, search for real
  corroborating consumer behavior — never size alone) found 5 more real
  wins on the first application to a new type family. The negative
  results are equally valuable: 159 candidates (`VecFx32`/`16` +
  `OSLockWord`) were individually resolved with real evidence, not
  batch-dismissed.
- **Cross-region symbol aliasing** (`data_ov017_021b867c`,
  `_021b8794`) is a new mechanical finding: EUR and JPN/USA can assign
  the same symbol name/address to genuinely different objects. Any
  future consumer-count prescan that doesn't scope to EUR specifically
  risks misattributing another region's consumers.
- **Two lower-bound-rule catches this wave** (`data_0218ff0c`'s type
  correction, `data_02191fe0`'s truncation avoidance) reinforce that
  the rule is now standing practice, not just a DispatchState-specific
  fix from wave 5.
- Wave-5 safeguards applied throughout; every claim in this doc and
  the queue result block reconciled against `git diff --stat`/`git
  status --short` before writing it.

## Next steps

- `data_02197434`'s whole cluster (contiguous with `data_0219743c`,
  `data_0219747c`, `data_02198434`, `data_021984e8`, none carved) is a
  real candidate for a coordinated, single combined-pass carve — the
  same shape of opportunity as wave 5's `data_0219c408`/`data_0219b760`
  finding, now with a second confirmed instance (`data_0219a834`) in
  the same under-investigated cluster.
- `data_021a18b8`'s >=256-byte structure (confirmed by 4 already-shipped
  consumers reaching +0xfc, `data_021a1938` confirmed as one fragment
  within it) is a similar coordinated-carve candidate.
- Several strong Named-struct leads flagged but not fully typed this
  wave, ready for focused follow-up: `data_ov009_021adc00` (`int*`
  access, named surface/frame/flag/sub-struct fields already
  ship-confirmed), `data_ov014_022350f4`/`data_ov014_02235094`
  (multi-field structs across `ov014`'s "pane" controllers),
  `data_ov007_022334d0` (state/timer sub-struct).
- `VecFx32`/`VecFx16`/`OSLockWord` are ruled out for the *current* raw
  pool; worth re-checking only if a currently-undecompiled function
  they might route through (e.g. `data_ov004_02291624`'s consumer,
  inside still-unmatched `func_ov004_021dbc8c`) gets matched later.
- `q-zero-width-bss-tu-fix` (filed wave 4, PR #1415) remains open;
  2 fully-reconciled carves (`data_ov001_021ca420_alias`,
  `data_0219a924_alias`) are ready to ship the moment it lands.
