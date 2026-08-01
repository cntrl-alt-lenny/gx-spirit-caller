# cm-bss-convert-7 — cross-region aliasing audit + OSMutex scan + eighth carve batch (2026-08-01)

Follow-up to [`cm-bss-convert-6-2026-08-01.md`](cm-bss-convert-6-2026-08-01.md).
Three parts: a full-scope investigation of the cross-region symbol
aliasing wave 6 first noticed, the second application of the
vendored-SDK scan technique (`OSMutex`), and a small volume batch.

## Result

**Cross-region aliasing: investigated to full scope (105 addresses,
not 2) and resolved as confined to raw `.bss` data with zero live
risk — see the dedicated audit doc and PR, not folded into this one.**
**Vendored-SDK scan: 6 real `OSMutex` candidates found and shipped
(144 B)**, the second application of the technique that found
`MtxFx33`/`43` last wave. **Volume batch: 6 symbols investigated, 2
clean CONVERT / 4 declined-as-`char[]`-but-flagged-as-real-structs**,
the 2 CONVERTs shipped (128 B). 8 symbols / 272 B total this wave.

```
Typed-array:   160,900 -> 161,028 bytes  (+128 B,  3.37% -> 3.37%)
Named-struct:   53,580 ->  53,724 bytes  (+144 B,  1.12% -> 1.12%)
```

Measured against a freshly re-baselined `git stash` snapshot of this
exact branch point (`origin/main` at `ceefe98c1`), matching wave 6's
own reported ending values exactly. Both deltas match the per-symbol
hand-predicted totals exactly.

## Part 1: the cross-region aliasing audit (separate PR, not this one)

Wave 6 found 2 cases where EUR and JPN/USA assign the same symbol
name/address to genuinely different objects. This wave's filing
instruction asked for a full-scope investigation, with an explicit
"stop and flag immediately" bar if any already-ported code turned out
to be affected.

**Full writeup, methodology, and the complete 105-row data table:**
`docs/research/cross-region-symbol-aliasing-audit.md`, shipped as its
own PR ([#1426](https://github.com/cntrl-alt-lenny/gx-spirit-caller/pull/1426),
branch `claude/q-cross-region-alias-guard`) rather than folded into
this one, per this project's established practice of not being both
producer and auditor of a cross-lane tooling finding. That file doesn't
exist on this branch yet — it lands with PR #1426, independently of
this PR's merge order.

**Headline numbers**: 105 confirmed collisions (not 2), across `main`
and 21 of 24 overlays. 26 have live consumers in already-ported
`src/usa/**`/`src/jpn/**` code — every one individually verified safe.
**Verdict: confined to raw `.bss`/`.data` layout, zero currently-ported
files are affected.** `ninja sha1` verified directly (not via CI, which
skips the byte-identity check) as green for all 3 regions. The real,
latent risk is narrower than the raw collision count suggests: it's
confined to `port_to_region.py`'s two *fallback*-tier resolution paths
(exact-address match, D3 shift-consensus), which assume address
correspondence — the primary reloc-pairing method is structurally
immune and is what's actually in use everywhere currently live. Filed
`q-cross-region-alias-guard` on the codex-scaffolder queue with the
concrete address list and a mitigation proposal.

## Part 2: the `OSMutex` scan — second application of the SDK-type technique

`libs/nitro/include/nitro/os_thread.h` already fully defines `OSMutex`
(24 bytes: `OSThreadQueue queue` @+0x0, `OSThread *thread` @+0x8,
`s32 count` @+0xc, `OSMutexLink link` @+0x10), alongside the already-
exploited `OSThread`. The prior wave's `OSLockWord` negative result
had already found the *real* lock-adjacent code in this project —
a generic lock/unlock function pair (`func_020927b8`/`func_02092748`)
— without naming it as `OSMutex`-shaped at the time. This wave
confirmed it is, field-for-field:

- `func_020927b8` (lock) and `func_02092748` (unlock) both directly
  touch `+0x8` (owner) and `+0xc` (count).
- `+0x10`/`+0x14` (`link`) confirmed via already-shipped
  `OSi_EnqueueTail.legacy.c`/`OSi_DequeueItem.legacy.c`.
- `+0x0`/`+0x4` (`queue` head/tail) confirmed via `func_02091a0c.legacy.c`
  (the wake path) and the sleep path's `OSi_InsertLinkToQueue.legacy.c`.
- Cross-validated against the already-shipped `OSThread` (`data_0219b490`):
  computing the vendored header's layout by hand independently predicts
  `OSThread::mutex` at `+0x84`, exactly matching `str r5, [r7, #0x84]`
  in the lock function.

### 6 shipped

| Symbol | Bytes | Evidence |
|---|---:|---|
| `data_0219b384` | 24 | 12 relocs: 4 complete lock/call/unlock wrappers, 1 unlock-only, 1 lazy-init, 6 raw `.s`, all opaque |
| `data_021a6734` | 24 | 3 relocs: 2 thunks + 1 lazy-init |
| `data_021a5d18` | 24 | 1 reloc, sole matched consumer |
| `data_0219b36c` | 24 | 6 relocs, all opaque; adjacent sibling of `data_0219b384` in a 4-object cluster |
| `data_0218fedc` | 24 | 3 relocs; corrected a wrong claim in an old research doc that called it a scalar accumulator |
| `data_0218fef4` | 24 | 3 relocs |

All bracket-less scalar declarations, all move `Named-struct` only.

### 2 held back — real size disagrees

`data_021aa0d0` (declared 96 B, only 24 characterized) and
`data_021a089c` (declared 32 B, only 24 characterized plus one genuine
extra word at +0x18) — both fit `OSMutex`'s first 24 bytes but have
real, uncharacterized bytes beyond it. Not shipped as bracket-less
`OSMutex` per the lower-bound rule; left as leads for a future pass
that resolves the remaining bytes.

### Embedded cases correctly excluded

Several `OSMutex`-shaped fields exist as offsets *within* larger,
uncharacterized objects (a function parameter, another symbol's
`+0x13d8`/`+0x11dc`/`+0x1a14`/`+0x1bf4`/`+0xe0`) — none are standalone
`.bss` symbols and none were carved.

## Part 3: volume batch — 2 shipped, 4 real struct leads flagged

| Symbol | Bytes | Verdict |
|---|---:|---|
| `data_021a1334` | 64 | **CONVERT** `char[64]` — sole consumer, uniform 0xFFFF sentinel fill, zero differentiated sub-regions |
| `data_021a1874` | 64 | **CONVERT** `char[64]` — same sole consumer/pattern as `data_021a1334` (adjacent TU) |
| `data_ov005_021b1d4c` | 92 | Declined as `char[]` — real struct, offsets 0x4/0x8/0xc/0x10/0x18 confirmed via 3 still-raw `.s` consumers |
| `data_02105b70` | 64 | Declined as `char[]` — real struct, a 3-word group at +0x4, plus +0x10, +0x1c, confirmed via an already-matched thunk one level into the call graph |
| `data_ov009_021adc54` | 64 | Declined as `char[]` — **richest evidence of the batch**: 13 of 16 possible 4-byte slots confirmed (offsets 0x0, 0x4, 0xc, 0x10, 0x14, 0x18, 0x1c, 0x24, 0x28, 0x2c, 0x30 + 2 more), cross-confirmed by matched C, permanently-shipped ground-truth `.s`, and an existing `ov009_core.h` §VERIFIED annotation ("co-drain wave 1, brief 343, 8 .c, all EUR objdiff 100%") |
| `data_ov016_021babec` | 64 | Declined as `char[]` — real struct, discriminant/field offsets 0x0, 0xc, 0x10, 0x14 confirmed one level into the call graph, corroborated by an existing (unverified-tier) research doc's independent field sketch |

**Two self-corrections during investigation**, worth keeping as
process notes: the first pass on `data_ov005_021b1d4c` and
`data_02105b70` stopped at "ctor/dtor stubs are empty, direct consumers
are opaque memcpy/Fill32 calls" and provisionally called both `char[]`
— both verdicts flipped only after going back and reading *every*
raw-`.s` reference the initial `git grep` had already surfaced. The
generalizable lesson: a memcpy/Fill32-only direct consumer is not
sufficient evidence of opacity when the symbol has any other raw-`.s`
referencing file — each one needs its own offset check before
concluding `char[]`.

## Process notes

- **The vendored-SDK technique is now validated twice** (`MtxFx*` wave
  6, `OSMutex` this wave) on two different type families, both found
  by starting from a *negative* result in an earlier wave (`OSLockWord`
  ruled out the spinword, but named the real mutex code in the process)
  rather than a fresh search. Worth checking future SDK-family negatives
  for the same "named the real pattern without recognizing its vendored
  type" opportunity before writing them off as closed.
- **Cross-lane findings get their own PR, not folded into the carve
  wave.** The aliasing audit is significant enough (105 addresses, a
  concrete tool-hardening proposal) to need independent reviewability
  and discoverability — bundling it into this wave's diff would have
  buried it.
- Wave-6 safeguards applied throughout; every claim in this doc and
  the queue result block reconciled against `git diff --stat`/`git
  status --short` before writing it.

## Next steps

- 4 real struct leads from Part 3, ready for focused follow-up with
  their offset evidence preserved above: `data_ov009_021adc54` (richest,
  13/16 slots), `data_ov005_021b1d4c`, `data_02105b70`,
  `data_ov016_021babec`.
- 2 `OSMutex`-shaped-but-oversized leads from Part 2:
  `data_021aa0d0` (96 B, 72 uncharacterized), `data_021a089c` (32 B,
  8 uncharacterized).
- `q-cross-region-alias-guard` (this wave, PR pending) and
  `q-zero-width-bss-tu-fix` (wave 4, PR #1415, still open) are both
  outstanding cross-lane items — 2 shovel-ready `.bss` carves
  (`data_ov001_021ca420_alias`, `data_0219a924_alias`, 68 B combined)
  remain blocked on the latter.
- The primitive pool continues thinning (this wave's top candidate was
  92 B, all others 64 B or smaller) — future waves may need to lean
  more on the SDK-scan and struct-lead-resolution techniques than on
  fresh pool volume.
