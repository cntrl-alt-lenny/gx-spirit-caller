[//]: # (markdownlint-disable MD013 MD041)

# Brief 393 — ov004: the real C the `.s`-pivot skipped (Thumb harness + cohort + ARM builders)

**Brief:** 393 (decomper). The Windows session 2 went all-in on the `.s` byte-
completion endgame and never did the real-C work the overlay re-sweep (brief 364)
surfaced. Two veins, both ov004: **(B)** a missed ARM builder/status-message family
(no harness), **(A)** the `021dbxxx`–`021ddxxx` Thumb cohort, which needed a new
`*.thumb.c` harness rule. Gate = 3-region `ninja sha1`; carve-size audit. Branch
`decomper/ov004-realc`.

## Headline — 16 byte-identical real-C funcs + a new Thumb compile lane

**16 matched (8 ARM `.c` + 8 Thumb `.thumb.c`), 3-region `ninja sha1` EUR/USA/JPN =
OK; carve-size audit clean (all 16 sizes exact, 0 overlaps).** The deliverable beyond
the funcs is **the Thumb harness**: a `*.thumb.c` routing tier that opens the whole
call-having Thumb cohort (~37 more funcs) for future waves. The named C-levers were
never the point here (brief 364 already showed they score 0 on re-sweeps) — this is a
normal drain + a compiler-lane unlock.

## Vein A (the bigger prize) — the `*.thumb.c` harness

The brief framed the call-having Thumb frame as a `-proc` difference. **It is not — it
is a compiler-VERSION difference.** The original ROM's Thumb cohort uses the ARMv4T-
safe interworking frame:

```
push {lr}; sub sp, #4        …        add sp, #4; pop {r3}; bx r3
```

Empirically (021dbea0, a real call-having predicate):

| compiler / proc | frame emitted | matches orig? |
|---|---|:---:|
| 2.0/sp1p5, arm946e (default) | `push {r3,lr}` … `pop {r3,pc}` | no |
| 2.0/sp1p5, **arm7tdmi/v4t** | `push {r3,lr}` … `pop{r3};pop{r3};bx r3` | no (dummy-push, not sub-sp) |
| **1.2/sp2p3, arm946e** | `push {lr};sub sp,#4` … `add sp,#4;pop{r3};bx r3` | **yes, byte-identical** |
| 1.2/sp3, arm946e | `… pop {pc}` | no |
| 1.2/sp3, v4t | `… pop{r3};bx r3` | yes (but sp2p3 already wins under the default proc) |

So **mwcc 1.2/sp2p3 — the binary already wired as the `.legacy.c` compiler — emits the
interworking frame under the standard `-proc arm946e`**. The proc is irrelevant; the
service-pack is everything. (2.0 merged the `bx`-return into `pop {pc}`; the `sub sp`
vs dummy-`push` alignment idiom is also a 1.2-vs-2.0 split.)

### The harness (3 files)

1. **`tools/configure.py`** — `THUMB_C_SUFFIX = ".thumb.c"`, `is_thumb_c()`, and a
   new `mwcc_thumb` ninja rule that reuses `LEGACY_CC` (1.2/sp2p3) with the unchanged
   `CC_FLAGS`/`CC_INCLUDES`. Routed in `add_mwcc_builds` (checked before `.legacy.c`;
   they share the binary so order is cosmetic). Source files carry `#pragma thumb on`.
2. **`tools/patch_objects_legacy.py`** — `.thumb.c` added to `LEGACY_SUFFIXES`. The
   `mwcc_thumb` rule emits `func_X.thumb.o`, but `dsd lcf` writes `func_X.o` into
   `objects.txt` (the same bug the legacy tiers hit). The generic rewrite
   (`qualifier = suffix − ".c"`) fixes it. +2 test pins.
3. **dcheck** already had the Thumb `.n`/`.w` branch-suffix normalisation (banked in
   brief 364). One new gotcha: drop a trailing literal-pool `.word` from the objdump
   side — `m2c_feed` folds pools into `ldr =sym`, so a pool-having func shows a
   spurious extra `.word` (021dc128).

**Caveat (unchanged from 364): 4-aligned starts only.** mwcc emits Thumb `.text` with
`sh_addralign=4`; a 2-aligned-start func still needs the `.s` escape. Every func in the
`021dbxxx`–`021dexxx` range happens to be 4-aligned, so this didn't bite — but it
bounds the lane.

### The 8 Thumb funcs — a crypto/util library

`021dbea0` `021dbfa8` `021dc0e8` `021dc128` `021dc19c` `021dbf6c` `021dbecc` `021dc154`.
The cohort is a self-contained crypto/checksum library:

- **XOR** `021dbfa8` (`buf[n+i] ^= key[i]`, `n = func_020b3870(len,2)`).
- **CRC-32** — table generator (deferred, see below), byte loop `021dc0e8`
  (`crc=(crc>>8)^table[(crc^data[i])&0xff]`), finalize `021dc128`
  (`(uchar)(crc ^ 0xFFFFFFFF)`, init `0xFFFFFFFF`).
- **RC4 PRGA** `021dc154` (i/j swap + `S[(S[i]+S[j])%mod]`), keystream-XOR `021dc19c`.
- **interleave** `021dbf6c` (3-way split via the `/2` divmod), **init-seq** `021dbecc`.

Recipes banked: the **divmod helpers** — `func_020b3870` (signed) / `func_020b3a7c`
(used here) — quotient via `extern int`→r0, remainder via `extern long long` +
`(int)(x>>32)`→r1 (mwcc emits `bl` to the runtime; a C `/`/`%` would emit `_s32_div_f`
and pass dcheck but FAIL the link). Keystream XOR needs a **temp**
(`uchar k=f(); dst[i]=k^src[i]`) to land `k` in r1 not r0.

## Vein B — the cursor-validation + status-message family (8 ARM `.c`)

`021cc3c0` `021daa48` `021d2550` `021cc2f0` `021da978` `021cec8c` `021ceb6c` `021d02f4`.
One template, parameterised — match one and the siblings fall (all matched first/second
try). Shape: two out-param helpers (`func_0200612c`/`func_02006110`) fill stack locals,
a short-circuit `&&`-range guard (mwcc's `ldrlt`-predicated form), then a status message
`func_02037208(ID,-1,0,r)`. Key idioms (full list in `ov004_core.h` §VERIFIED b393):

- **Local declaration order = sp offset** (last-declared → lowest offset): declare
  `z,y,x` to get `x@sp0,y@sp4,z@sp8`.
- Pass the **return variable `r`** as msg arg4 and to the field stores, so mwcc shares
  the register (`mov r3,r5`, not `mov r3,#1`); the `-1` const via `r-2` (`sub`).
- `func_02037208(ID,-1,0,…)` ⇒ `mov rX,#ID; sub rY,rX,#ID+1` (mwcc does NOT fold −1).
- A real **`switch`** (021d9d58) for cmp/beq dispatch — if-else-if inlines the bodies.
- `func_02006194` takes **no arg** here (per-TU `(void)` decl).

## What stayed walled / deferred (2)

- **`021d9d58`** (state machine, vein B) — body matches 80/80 after the `switch` fix;
  the 6-instruction **prologue schedule** diverges (mwcc hoists the `b500[92]` branch-
  feeding load before the `e500` store; orig does it after). Unsteerable from C →
  permuter target. `.c` saved aside, not carved.
- **`021dc0ac`** (CRC-32 table generator, vein A) — frameless; instructions identical
  26/26 but **register NUMBERS shifted** (`i`→r0 vs r6, poly→r3 vs r2). All compiler
  versions produce the same allocation; it's the catalogued Thumb reg-mirror wall
  (cf. `021dcbcc`) → permuter/`.s`.

## Verification

| Gate | Status |
|---|:---:|
| EUR / USA / JPN `ninja sha1` | **OK** (16 `.c`, byte-identical) |
| Carve-size audit (16 sizes vs symbols.txt, overlaps) | **PASS** (exact, 0 overlaps) |
| `tests/test_patch_objects_legacy.py` | 43 passed (+2 thumb pins) |
| `tests/test_configure_*.py` | 65 passed |
| `ruff check` | clean |

EUR-only carve (+16 `complete_units`); usa/jpn are the regression gate (the `.thumb.c`
files are EUR-baseline, excluded from usa/jpn builds; the harness rule is unused there).

## Recommendation for the brain

1. **Drain the Thumb cohort.** The harness opens ~37 more 4-aligned call-having Thumb
   funcs (`021dbxxx`–`021ddxxx`) — a real vein, not a wall. They're a coherent
   crypto/util library; the small/medium ones match cleanly with 1.2/sp2p3 + the divmod
   recipes. Next wave should sweep it (sorted small-first), skipping reg-mirror
   (021dc0ac/021dcbcc class) → `.s`/permuter.
2. **Vein B's cursor family is mostly drained** at the clean small tier; the medium tail
   (smull-division, dual-flag, 0x1a0+ branchy) is matchable but slower — lower priority
   than the Thumb vein.
3. **Route the 2 deferred** (021d9d58 prologue-schedule, 021dc0ac reg-mirror) to the
   permuter/`.s` lane.

## Cross-references

- `docs/research/brief-364-overlay-resweep.md` — surfaced both veins; predicted the
  Thumb harness as "the bigger prize" (confirmed).
- `docs/research/thumb-align-wall.md` — the `sh_addralign=4` / 4-aligned-only bound.
- `docs/research/style-a-epilogue.md` — the 1.2/sp2p3 (`.legacy.c`) compiler this tier
  reuses.
