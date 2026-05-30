[//]: # (markdownlint-disable MD013 MD041)

# Brief 273 — C-23-MMIO drainable cohort + the ov006 cf140 family

**Brief:** 273 (decomper). (A) 11 be38-class drainable C-23 MMIO picks
(brief 270). (B) ov006 uniform family (8) + the 21-member ov006
`.p__sinit`/cf140 family (gotchas 18 + 1).

## Headline

**16 .c shipped, all objdiff 100 % + 3-region SHA1 PASS.** 16/19
attempted = 84 % yield. gotcha 18 (reference the **local**
`data_ov006_021cf140`, not the dotted `.p__sinit_ov003`) fully unblocks
the family; gotcha 19 (shifted-term-first) and gotcha 1 (return the
guard) hold. Below the ~35 target — the **(B) "21-member family" is
mostly large state-machine handlers**, not the simple recipe; only the
3 simple guards + 4 linear init-sequences transcribe within the cap.

## (A) C-23 MMIO drainable — 9 (the ov006 uniform family + 1 clone)

The uniform shape: `h1(); if (*(int*)(guard+8)) { h2();
*(int*)0x04000540 = (data_020c3e48 << 1) | data_02103da0; } return 1;`
— only the guard symbol varies. **Default tier** (Style-B `pop {pc}`;
single MMIO ref, no base-fold). gotcha 18 (`021b2690`'s guard is the
local `data_ov006_021cf140`, the dotted `.p__sinit_ov003` is overlay
overlap) + gotcha 19 (`(g2<<1)|g3` shifted-first).

8 ov006 (`021b2690` `021b3240` `021b382c` `021b3dd0` `021b4668`
`021b4d68` `021b5340` `021b5994`) + 1 ov021 clone (`021aa848`, guard
`data_ov021_021ace80`). `0208be38` shipped in brief 269.

**Non-shipper — `0208c2e0`** (the 11th be38-class): DS hardware-sqrt of
`(f0²+f4²+f8²)<<2`. **Structure byte-exact**; the *only* divergence is
the `smull`/`smlal` operand reg-alloc — orig squares `f4` first (r2),
mwcc reorders the commutative sum and squares `f0` first (ip). A
reg-alloc near-miss **inside** the "drainable" tier (the commutative
sum-of-squares isn't controllable from source order). Filed P
(reg-alloc), not a recipe miss.

## (B) ov006 cf140-guard family — 7 (of the listed 21)

**Simple guard (gotcha 1 — `return r` keeps r0 live so the store
address lands in r1/r2), 3:**

```c
int f(void) { int r = func_ov005_021acfb0(); if (r) data_ov006_021cf140 = K; return r; }
```

`021b2b08` (K=9), `021b2c9c` (K=12), `021b2970` (K=6, multi-call
guard — brief-270 16/16).

**Linear state-handlers (init/teardown call-sequence + `cf140 = state`;
`return 1`), 4:** `021b287c` (state 7), `021b26e0` (state 4), `021b2d5c`
(state 5), `021b2cbc` (state 16). Each is a flat sequence of per-overlay
helper calls with pooled `data_ov006_*` args + the cf140 state write —
transcribed verbatim, reference `data_ov006_021cf140` (gotcha 18).

**Scope correction:** the listed 21 are **not** a uniform family. The
other ~14 are full state-machine handlers — `021b2400` (0x220) /
`021b2324` (0xa4) device-init monsters; `021b29b0` `021b2a58` `021b2b28`
`021b2bd4` (Fill32 + ov005 calls + MMIO); `021b2620` (MMIO `bic #0x1f00`
value-constant → reg-alloc defer per brief 270's discriminator);
`021b2760` `021b28c0` (`switch` jump-tables); `021b2804` `021b2de0`
(double-guard with overlay-overlap data-symbol calls). These are
per-pick Track-2 decomp, not the simple recipe.

**Non-shippers — `021b2280` (61 %), `021b22c8` (39 %):** fp-table
dispatch (`fp = table[*cf140]; if (fp()) cf140.f4 = 0;`) — the indirect
`blx` + the fp-table reg-alloc diverge. Reg-alloc-sensitive (P).

## Yield by tier

```text
(A) be38-class C-23 MMIO   : 9/10  (0208c2e0 smull reg-alloc)
(B) cf140 simple guard     : 3/3
(B) cf140 linear handler   : 4/4
(B) cf140 fp-table dispatch: 0/2   (021b2280/22c8 indirect-call reg-alloc)
overall                    : 16/19 (84%)
```

## For the brain

- gotcha 18 is validated end-to-end — the `.p__sinit` "block" was a red
  herring; the local `data_ov006_*` symbol works.
- The C-23 MMIO cohort's **clean** picks are now drained (the ov006/ov021
  uniform family + the simple cf140 guards). What remains:
  - `0208c2e0` + the fp-table dispatch (`021b2280/22c8`) = reg-alloc-
    sensitive (P, like the brief-270 defer tiers).
  - ~14 of the cf140 list = **large state-machine handlers** (device
    init, switch-tables, Fill32 sequences) = full per-pick Track-2
    decomp, not a drainable recipe.
- Consistent with waves 1-5: the over-fire / C-23 *cheap-recipe* veins
  are substantially drained; the residue is reg-alloc-sensitive or
  genuine per-pick reverse-engineering.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 16/16 at 100 % |
| `tools/check_match_invariants.py` | 0 errors (4634 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2276 passed |

## Cross-references

- `docs/research/brief-270-c23-mmio-triage-and-sinit-alias.md` — the
  drainable discriminator + the cf140 unblock this ships.
- `docs/research/recipe-gotchas.md` — gotcha 18 (dotted-symbol/overlay
  overlap), 19 (commutative-operand order), 1 (return r).
- `docs/research/first-wave-wall-mmio-base-folding.md` — the C-23 recipe.
