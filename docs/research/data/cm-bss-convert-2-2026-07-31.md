# cm-bss-convert-2 — second `.bss` carve batch (2026-07-31)

Follow-up to [`cm-bss-convert-1-2026-07-30.md`](cm-bss-convert-1-2026-07-30.md).
Continues the same per-symbol reconciliation procedure against a freshly
re-derived candidate pool, and attempts to unblock the 2 symbols wave 1
had to defer for mechanical (not evidentiary) reasons.

## Result

**28 fresh symbols investigated. 17 CONVERT, 11 DECLINE.** Both wave-1
alignment-pairing investigations also succeeded, unblocking
`data_ov006_021cf1b0` (4173 B) and `data_0219060c` (4863 B). **19 symbols
shipped this wave, 19,248 bytes total.**

```

Typed-array:   139,104 -> 158,304 bytes  (+19,200 B,  2.91% -> 3.31%)
Named-struct:   50,112 ->  52,040 bytes  (+1,928 B,   1.05% -> 1.09%)

```

Measured directly via `tools/progress.py` before/after (`git stash`/`git
stash pop` against a clean checkout of the exact commit this branch is
based on — `origin/main` at `77e64a1f9` — not against wave 1's own
end-of-wave numbers, since other lanes' work had already landed on `main`
in between and would have polluted a naive comparison; the code-progress
figures moved independently of this wave for exactly that reason).

## Batch composition — why the decline rate is higher than wave 1

Wave 1 shipped 13/18 CONVERT (72%). This wave shipped 17/28 (61%). The
batch was deliberately weighted toward harder candidates once the basic
method was proven: several symbols whose only extern was a bare scalar
`int` (a known partial-coverage-trap shape), several never-before-referenced
symbols investigated purely to solve wave 1's alignment blocker, and a
cluster of named-struct/typedef candidates specifically sought out to move
`Named-struct` (still only 1.05% after wave 1, which shipped zero
struct-typed conversions). Harder candidates decline more often; that's
the tradeoff for deliberately surfacing the higher-value, harder-to-reach
finds, not a quality regression in the reconciliation discipline.

## The alignment fix: 2 further findings, one mechanical bug caught before shipping

Both wave-1-deferred symbols (`data_ov006_021cf1b0` odd 4173 B,
`data_0219060c` odd 4863 B) had a size that wasn't a multiple of 4. This
wave paired each with its immediate next neighbor in the same cluster
file (`data_ov006_021d01fd` / `data_0219190b`) so the *combined* TU exit
boundary lands 4-byte-aligned. Both neighbors were investigated from
scratch (neither had any existing extern reference anywhere in the tree)
and came back CONVERT as plain `char[]` — but on a different evidentiary
basis than usual, explicitly flagged as such by both investigations:
zero real consumers exist for either one. `data_ov006_021d01fd`'s only
apparent evidence (a relocation entry) was traced and disproven as a
coincidental bit-pattern false positive in an unrelated table.
`data_0219190b`'s address is genuinely taken and stored inside an
unrelated, still-uncarved pointer-table blob, but nothing ever
dereferences it — a third category, distinct from both "dead" and
"evidenced."

**First attempt at combining the pairs into one TU shipped a real, new
bug**, caught before merging: `ninja sha1` failed with the two symbols
written as two separate declarations
(`char data_0219060c[4863]; char data_0219190b[1301];`). `ninja check`
showed both landing at overlapping/swapped addresses relative to what was
expected. The real linker map (`build/eur/arm9.o.xMAP`) confirmed it
directly — mwldarm placed the two objects in the **opposite** order from
how they were declared:

```

0219060C 00000515 .bss    data_0219190b   (data_0219060c.o)
02190B22 000012FF .bss    data_0219060c   (data_0219060c.o)

```

Reversing the declaration order in source had **zero effect** on the
compiled output (byte-identical rebuild) — proving the layout isn't
driven by declaration order at all, so no source reordering could fix
it. Since neither pairing symbol has a real named consumer, the correct
and much simpler fix was to stop trying to control two independently-named
objects' relative placement and instead **merge each pair into one
array** covering the full combined range, keeping only the evidenced
symbol's name (`data_0219060c[6164]`, `data_ov006_021cf1b0[6476]`). This
is a genuinely new, previously-undocumented fact about this toolchain:
**mwccarm/mwldarm does not preserve declaration order for multiple
`.bss` tentative definitions in one translation unit** — its real
ordering rule wasn't identified (both an alphabetical-descending-by-name
and an ascending-by-size theory fit the two observed data points equally
well and weren't disambiguated further, since the merge fix made it
moot) — but the practical rule for future waves is clear: **never put
two independently-referenced `.bss` symbols in one TU expecting a
specific relative order; merge them into one declaration whenever
possible, and treat "two separately-named symbols in one non-single-symbol
TU" as unsafe in general.**

## A second real classifier finding: struct-internal fields can leak into `Typed-array`

The measured `Typed-array` delta (+19,200 B) is 1,792 bytes higher than
a naive per-symbol sum predicts (+17,408 B, correctly separating
primitive-array-only symbols from named-struct-only scalars). Traced and
confirmed directly against `tools/progress.py`'s own regex
(`_DATA_ARRAY_DECL_TYPE_CAPTURE_RE`), not assumed: the regex is
line-based and does not track brace nesting, so a struct-internal field
declaration that happens to look like `Type name[N];` at the start of a
line — e.g. a padding or buffer field inside an otherwise-scalar
struct's typedef body — matches the *same* regex a genuine file-scope
array declaration would, crediting the whole owning TU to
`typed_array_bytes` even though the file-scope declaration itself is a
bracket-less scalar instance. Confirmed empirically for the exact 3
files responsible (1216 + 544 + 32 = 1792 B, exact match):
`data_021a5340.c` (`thread_state[0xc0]`, `stack[0x400]`),
`data_021a8b00.c` (`_unk0c[0x14]`, `buffer[0x200]`), `data_0219a8f4.c`
(`_pad1[3]`, `_pad7[0x14]`). This is not a bug in the shipped C — every
one of these is a correct, gate-passing scalar struct instance, verified
end-to-end via the real build — it's a real, newly-documented blind spot
in the metric script's line-based classifier (a sibling finding to the
already-documented `q-metric-singleton-struct-gap`). Not fixed here
(out of scope for a data-carving wave); worth a dedicated tooling item if
the project wants `Typed-array` to track "genuine file-scope arrays"
more strictly.

## Per-symbol results

### Shipped (19, 19,248 bytes)

| Symbol | Type | Bytes | Movement | Why |
|---|---|---:|---|---|
| `data_021a09f4` | `char[1024]` | 1,024 | Typed-array | Whole-buffer fill, one of 3 structurally identical siblings, independently verified |
| `data_021a0f34` | `char[1024]` | 1,024 | Typed-array | Same sibling group |
| `data_021a1474` | `char[1024]` | 1,024 | Typed-array | Same sibling group |
| `data_ov004_02292008` | `char[968]` | 968 | Typed-array | Opaque payload, scripted-scan undercounted its own confidence (RE-only `Rec` typedef discounted) |
| `data_ov004_022916b0` | `char[640]` | 640 | Typed-array | Clean opaque pass-through, 2 consumers, zero field access |
| `data_021a9928` | `T_020a5d74 data_021a9928;` | 12 | Named-struct | Objdiff-matched writer constructs all 3 fields; 3 independent raw-asm readers agree |
| `data_0219c4a0` | `Entry02038d2c data_0219c4a0[6];` | 72 | both | 2 structurally-independent consumers confirm 6-element/12-byte-stride shape; arithmetic closes exactly |
| `data_ov009_021adc94` | `Ov009DispatchState data_ov009_021adc94;` | 8 | Named-struct | "Pattern A2" cross-overlay convention, 100%-fuzzy-matched consumer |
| `data_ov017_021b8520` | `Ov017DispatchState data_ov017_021b8520;` | 8 | Named-struct | Same pattern; resolved an apparent conflict with a never-compiled "knowledge sketch" header |
| `data_ov019_021b5e20` | `Ov019DispatchState data_ov019_021b5e20;` | 8 | Named-struct | Same pattern |
| `data_021a1998` | `triple_020822c8_t data_021a1998;` | 12 | Named-struct | Matched writer + independent word-count corroboration from a 2nd call site |
| `data_0219a8f4` | `Overlay0219a8f4 data_0219a8f4;` | 32 | Named-struct | sizeof confirmed 3 independent ways, cross-region-verified |
| `data_0219a914` | `Pair78 data_0219a914[4];` | 16 | both | Size-closure arithmetic corrected the existing extern's stale `/* [3] */` comment to the real bound of 4 |
| `data_021a5340` | opaque proven-span struct | 1,216 | Named-struct | Ground-truth-traced full 1216-byte span (thread-control-block-shaped region + guard/zero-filled stack); declined to assert the specific vendored `OSThread` type since no `src/` precedent exists for including it and field semantics were flagged as corroborated-not-certain |
| `data_021a8b00` | opaque proven-span struct | 544 | Named-struct | 96% of the object evidenced across 3 independently-confirmed fields + a byte-exact buffer-boundary derivation; one 20-byte gap left honestly unlabeled/padded rather than guessed |
| `data_0219060c` (merged) | `char[6164]` | 6,164 | Typed-array | Absorbs the evidence-free `data_0219190b` (see alignment-fix section) |
| `data_ov006_021cf1b0` (merged) | `char[6476]` | 6,476 | Typed-array | Absorbs the evidence-free `data_ov006_021d01fd` (see alignment-fix section) |

### Declined (11)

| Symbol | Bytes | Why |
|---|---:|---|
| `data_ov006_0225dc34` | 560 | Mechanically clean (4/4 externs agree, size checks pass) but 2 separately-matched sibling files each declare partial `struct Ov006Obj` definitions hitting the same real offsets — flat read would bury already-load-bearing field semantics |
| `data_021a19a4` | 20 | Near-identical twin of a shipped-wave-2 sibling (`data_021a1998`), but this one's declared 20-byte object only has 12 bytes of typed evidence — an unexplained 8-byte shortfall the prescan missed |
| `data_021a19e8` / `data_021a1a18` | 48 / 260 | Shared type name was a false positive (a locally-scoped shim typedef, `sizeof`=256, matching neither target's real size) |
| `data_021a6710` | 32 | `sizeof` of its only typed extern is 24 bytes against a real 32-byte object; 2 independent sibling `.s` functions demonstrably touch the missing +0x18/+0x1c bytes — would have silently under-allocated storage if forced |
| `data_0219b760` | 480 | Consumers walk a 28-entry, 0x78-stride record array that provably spans 3 separately-declared `.bss` symbols (exact arithmetic match, zero slack) |
| `data_02106a58` | 44,703 | The single largest candidate in the pool. Only "evidence" is a self-flagged unverified-draft scalar `int` that's never dereferenced. Tracing found real structure for ~7% of the span, but the code's own size-budget arithmetic implies a 512KB arena spanning ~27 other placeholder symbols — the declared boundary is actively misleading, not just under-evidenced |
| `data_0219b3d0` | 12 | Arithmetic fails outright — not even divisible by its only proposed element type's size. 3 shipped ground-truth `.s` consumers prove the real object is a 3-element array spanning this symbol AND its neighbor |
| `data_0219d00c` | 92 | Turns out to be element 31 (the last) of a 32-element table whose real base is a different, still-raw sibling symbol, confirmed by 4 independent ground-truth `.s` consumers |
| `data_ov008_021b2dc0` | 0 | A 0-byte marker — its real 8 bytes belong to a same-address `_alias` sibling, a deliberate, documented literal-pool-dedup workaround (not dead scaffolding) |
| `data_ov008_021b2dce` | 6 | Its only struct accounts for 2 of 6 real bytes; the identical unexplained gap is confirmed present across all 3 regions, ruling out a one-off drafting slip |

## Process notes

- **Risk-flagged scalar-`int` externs don't predict the outcome**: 3
  candidates were dispatched with an explicit risk flag for having only a
  bracket-less `extern int` (the classic partial-coverage-trap shape).
  2 of 3 (`data_021a5340`, `data_021a8b00`) converted anyway once traced
  into their real `.s` consumers; only the largest (`data_02106a58`)
  genuinely declined. The extra tracing effort the reconciliation
  procedure requires is worth it — a weak surface extern is a reason to
  look harder, not a reason to stop early.
- Wave-14 safeguards applied throughout (sizes re-verified against
  `symbols.txt`/`.space` before writing; `git status --short` file-count
  check after writing (49 files: 17 modified, 32 new, exactly as
  planned once the mid-wave collision and merge fixes were folded in)
  before building);
  every claim in this doc and the queue result block reconciled against
  `git diff --stat`/`git status --short` before writing it.
- **Bash cwd drift recurred twice this wave** (the documented idle-drift
  bug), self-caught both times via an unexpected `not a git repository`
  / wrong-path error, fixed by re-`cd`.
- **A file-naming collision from wave 1 recurred and was fixed
  generically**: the ov006 carve tried to create `data_ov006_bss_2.s`,
  which wave 1 had already used for a different fragment. The carve
  script's fragment-naming logic is now directory-aware (scans for
  already-used numeric suffixes before picking a new one) rather than
  assuming a fresh cluster file always starts at `_2` — this can't
  silently recur against any cluster file a prior wave has already split.

## Next steps

- Several DECLINE reasons point to concrete future combined-pass
  candidates: `data_0219d00c`'s real 32-element table at
  `data_0219c4e8`; `data_0219b760`'s 28-element table spanning 3
  symbols; `data_0219b3d0`'s 3-element table spanning 2 symbols;
  `data_02106a58`'s ~512KB arena spanning ~27 placeholder symbols (the
  single largest architectural lead surfaced by this campaign so far).
- `data_ov008_021b2dc0`/`_alias` needs joint reconciliation with its
  alias pair if ever carved — not a single-symbol action.
- The `Named-struct`/`Typed-array` classifier's struct-internal-field
  blind spot (see above) is a real tooling nuance worth a dedicated fix
  if the project wants stricter tracking; not attempted here as it's
  outside a data-carving wave's scope.
- The `.bss` pool has ~390+ symbols remaining after this wave (335 fresh
  pool minus 28 investigated, plus whatever the next fresh-pool
  re-derivation finds after this wave's carves remove more raw
  placeholders).
