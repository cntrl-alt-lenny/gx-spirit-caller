[//]: # (markdownlint-disable MD013 MD041)

# Brief 269 — Over-fire drain wave 4 (freshly-unblocked tiers)

**Brief:** 269 (decomper). (A) Drain the frameless-leaf diverse tail
(brief-266 coercibles: switch / gotcha 16 / gotcha 17). (B) Continue
C23-noMMIO + open the C-23 real-MMIO tier (~220).

## Headline

**35 .c shipped, all objdiff 100 % + 3-region SHA1 PASS** — target met.
The big win was a **20-member C-39f bit0-indexed `0x868`-table family**
(ov002, default tier) surfaced while mining the C23/indexed cohort. The
5 brief-266 quirk-class picks all shipped (switch / u8-cast / volatile);
C-41 + Fill32-tail-init are clean families; the C-23 real-MMIO tier
(220) is **reg-alloc-sensitive and partly blocked**, lower-yield than
hoped.

## (A) frameless-leaf diverse tail — 5/5 (brief-266 coercibles)

All 5 reverted wave-2 non-shippers ship with brief-266's levers:

| Pick | Class | Lever |
|---|---|---|
| `0202f3e8` | predication | `switch` (defeats the 0/1 predication) |
| `021ac508`, `021abf50` | bit/byte-insert | gotcha 16 (`u8`/`u16` type) + `(x<<K)>>M` shift-form |
| `02092614`, `020a6d94` | dead-store / re-read | gotcha 17 (`volatile` + delayed temp) |

(The ≤0x40 frameless-leaf cohort is otherwise drained — these were the
concrete remainder.)

## (B) the big win — C-39f bit0-indexed `0x868`-table family (20)

A uniform ov002 family (default tier): `v = *(base + IDX*0x868);
return <compare>`, `IDX = (self->bit0 & 1)` or `((1 - self->bit0) & 1)`.
**Both index variants need the explicit `& 1`** to emit the redundant
`and #1` (gotcha 14) — the 9 `1-bit0` members first shipped at 80 %
(missing `and #1` after the `rsb #1`); `((1 - self->bit0) & 1)` fixed
all 9. Compare tails vary: `!= 0`, `== 0`, `== K`, `(unsigned) >= K`,
`<= K`, `> 1 ? 2 : 1`, `(v>>25)&1` — value typed `unsigned` for the
`cs/cc/ls/hi` (unsigned) compares.

20 picks: `021ff91c` `021c3cc8` `021ff690` `021b8fcc` (2-D `+a1*20`)
`022003c4` `02202470` `02203670` `02204cb8` `02204f6c` `0220575c`
`02208448` `022090f4` `02209160` `02209a70` `0220a10c` `0220a1dc`
`0220b120` `0220c7f4` `022923d0` `02294d24`.

## (B) other tiers — 10

| Tier | n | Picks / recipe |
|---|--:|---|
| C-41 MMIO bit-clear + tail | 4 | `0208ccf4/cd18/cefc/cf20` — `*(u32*)0x4000000 &= ~MASK; return fn(data);` (indirect `bx ip` tail) |
| Fill32 tail-init | 3 | `0202adf8/c24c/c490` — `g->fOFF = a0; return Fill32(0, a0, K);` |
| C-23 MMIO base-fold | 1 | `0208be38` — DS divider; `.legacy.c` + per-base `volatile int *` (keep base separate) |
| C23-noMMIO clean | 2 | `021afba0` (u16 table lookup), `021ae4d8` (field copies + masked OR) |

The C-41 indirect tail-call (`ldr ip; bx ip`) reproduces from
`return fn(args)`; confirmed across the family.

## Non-shippers — P-candidates with byte-diff evidence

| Pick(s) | % | Divergence |
|---|---:|---|
| `0208be9c` | 60 | C-23 MMIO reg-alloc: a `mov #0x1000` constant temp competes with the MMIO base — orig base→r2/temp→r3, mine swapped. `be38` (no constant temp) shipped, so it's value-specific. |
| `0201d0b0`, `02022580` | ~50 | table-index + **predicated** early-return guard (`movlt/bxlt`) + the index reg-alloc diverge together. |
| `020a3afc` | 44 | `*(*g+0x1320)=1; tail fn()` — store/tail reg-alloc. |
| ov006 C-23 family (17) | — | **blocked**: the guard global is `.p__sinit_ov003_021cf114` (a dotted compiler symbol) — not referenceable from C with the needed reloc. |

These are per-pick mwcc reg-alloc / predication quirks (not new walls);
the ov006 family is blocked by the dotted-symbol reference, not a recipe.

## Yield by tier

```text
frameless-leaf (brief-266 quirks) : 5/5   (100%)
C-39f indexed 0x868-table         : 20/20 (100%, after the (1-bit0)&1 fix)
C-41 / Fill32-tail / C23-noMMIO   : 9/9   (100%)
C-23 real-MMIO base-fold          : 1/2   (be9c reg-alloc)
table-index-guard / tail-store    : 0/3   (predication+reg-alloc)
overall                           : 35/41 (85%)
```

## For wave 5 / the brain

- **Still-productive veins:** the C-39f indexed-`0x868`-table family
  (more members likely beyond ≤0x40), the C-41 / Fill32 tail families,
  clean C23-noMMIO.
- **The C-23 real-MMIO tier (220) is NOT the easy 220 it looks:** it's
  reg-alloc-sensitive (constant temps vs MMIO base), has a 17-member
  family blocked by a dotted `.p__sinit` symbol, and many are
  control-flow-heavy. Recommend a scaffolder pass to (a) sub-classify
  the genuine simple-register-init MMIO picks from the clustered-pool
  over-fires, and (b) decide how to reference dotted `.p__sinit_*`
  symbols (a `relocs.txt`/alias mechanism) to unblock the ov006 family.
- The over-fire cheap vein continues but is increasingly per-pick
  reg-alloc work outside the clean families.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | OK |
| USA `ninja sha1` | OK |
| JPN `ninja sha1` | OK |
| objdiff per-pick | 35/35 at 100 % |
| `tools/check_match_invariants.py` | 0 errors (4602 pre-existing warns) |
| `ruff check .` | clean |
| `tests/` (full suite) | 2276 passed |

## Cross-references

- `docs/research/brief-266-overfire-frameless-leaf-tail-classify.md` —
  the 3 coercible classes this wave's (A) ships.
- `docs/research/recipe-gotchas.md` — gotcha 14 (redundant `& 1`),
  16 (u-cast mask), 17 (volatile), § StyleA over-fire families.
- `docs/research/first-wave-wall-mmio-base-folding.md` — the C-23 MMIO
  `.legacy.c` recipe (be38).
