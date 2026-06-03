[//]: # (markdownlint-disable MD013 MD041)

# Brief 328 — permuter pilot (macOS) → ov020 clean-C fallback

**Brief:** 328 (decomper). Plan: validate the permuter + `.s`/GLOBAL_ASM
toolchain on the M1 Mac (Windows-dead per brief 306), then pilot the permuter
on ov016's catalogued 1-instruction reg-swap misses; if the toolchain is
broken, fall back to a fresh clean-C overlay (ov020). Gate = EUR objdiff 100%.

## Step 1 result — toolchain NOT validated: session is on Windows, not macOS

**The session ran on the Windows box, not the M1 Mac the brief assumes.** The
macOS move that was to unblock the permuter/`.s` lane has not taken effect in
this execution environment (`uname` → `MINGW64_NT … x86_64`). On this box the
lane is structurally dead — confirmed, not assumed:

| Dependency | Needed by | Status here |
|---|---|---|
| `wine` / `wine64` | `asm_escape.py` mwcc compile + assemble; permuter compile loop | **absent** |
| `arm-none-eabi-objdump` | `asm_escape.py` `disasm()` / `gap_object()` (hardcoded) | **absent** |
| decomp-permuter (`import permuter`, `.venv_permuter`) | `permute.py` | **not installed** |

`permute.py --help` runs (it is only a bootstrap wrapper) but cannot execute a
permutation without the compiler-under-wine + permuter package. So **Step 2
(the ov016 reg-swap pilot) was impossible from here.** Per the brief's
contingency — and confirmed with the user — I fell back to the ov020 clean-C
overlay. **Recommendation: route the permuter lane to an actual M1 Mac
session; it cannot be validated or run on the Windows host.**

## Step 2 (fallback) — ov020 clean-C wave 1: 7 matched

ov020 is the Quiz UI/graphics overlay (45 gap funcs, 32 `<0x100`). **7 shipped,
all EUR objdiff fuzzy 100%, EUR `ninja sha1` OK.** `ov020_core.h` promoted.

| # | func | size | shape |
|---|---|---|---|
| 1 | `021ab0ac` | 0x2c | single `func_0209448c` clear-region wrapper |
| 2 | `021ab418` | 0x24 | single `Fill32` slot-clear wrapper |
| 3 | `021aae0c` | 0x3c | 3-iter single-call fill loop |
| 4 | `021ab06c` | 0x40 | 18-iter single-call fill loop |
| 5 | `021ab3c8` | 0x50 | 4-iter single-call fill loop (computed base) |
| 6 | `021aa7ac` | 0x60 | point-in-rect predicate (`func_02006110` + `&&` chain) |
| 7 | `021aa6cc` | 0x34 | scratch-buffer archive open (`func_02006c0c`) |

## The real finding — ov020's accessible tier is permuter territory

Yield was **7 / 12 attempted (58%)**, and *every one of the 5 misses is a
reg-alloc / scheduling / layout near-miss* — i.e. the exact class brief 328
wanted the permuter for. This is a strong signal that the medium/"wall" tier
bottleneck is **not** thinning clean-C overlays; it is the codegen-wall classes
that need the permuter on the Mac. Catalogued for that lane (`ov020_core.h`
§WALL):

- **Inline tilemap-fill nested loops** (`021aae64`, `021ab364`/`021ab43c`
  siblings, `021ab0d8`): byte-for-byte identical *instructions*, only the
  `{row,p,tile,col}` → register mapping is rotated. Declaration-order reorder
  (gotcha 11) made it **worse** (44% → 11%). Pure reg-swap — permuter's
  sweet spot.
- **OBJ-dispatch stack-arg builders** (`021ab8f8`/`964`/`aba54`/`abac0` — a
  4-member family — and `021abb94`): 59% near-miss; the entire tail matches
  (incl. the `sub ip,#1` -1 derivation), but mwcc hoists the pool load and
  picks a different temp for the `(idx*0x28+K)<<12` pair value. A handle-temp
  reorder did not move it.
- **Script-step dispatcher** (`021ada1c`): gotcha-20 block layout (predicated
  `return 1` vs forward-branch-placed-last) **plus** post-call field-address
  pooling on the `+0xb6c` re-read (the ov011 §WALL class).

All reverted; none shipped (they would fail SHA-1). They are concrete,
pre-characterised permuter inputs for when the Mac lane is live.

## Verification

| Gate | Status |
|---|:---:|
| EUR objdiff fuzzy, per-pick | **7/7 = 100%** |
| EUR `ninja sha1` | **OK** (byte-identical ROM with all 7 carved) |
| ov020 `delinks.txt` | 7 `complete .text` blocks appended (EUR only) |
| 3-region `ninja sha1` | **deferred to brain** (EUR-baseline `.c`, no region port) |

EUR-only config changes; no tool change, no USA/JPN config change, no renames.
`src/overlay020/` gains 7 `.c` + `ov020_core.h`.

## Recommendation for the brain

1. **Permuter lane needs a real Mac.** It is dead on Windows (wine + objdump +
   permuter absent). Re-issue brief 328's Steps 1–2 on the M1 Mac.
2. **ov020 wave 1 is a productive byproduct, not the prize.** 7 clean matches;
   the remaining accessible tier is permuter-class (4-member OBJ-dispatch
   family + inline-fill siblings + dispatcher), all pre-catalogued in
   `ov020_core.h` §WALL — feed these to the permuter first when the Mac is up.
3. **Run the 3-region SHA1 on merge** (EUR-baseline `.c`, expect USA/JPN to
   reproduce; wire their `delinks.txt` if ov020 addresses differ per region).

## Cross-references

- `docs/research/brief-308-ov011-clean-c-wave1.md` / `brief-311`/`313` — the
  ov011 clean-C playbook this mirrors.
- `docs/research/permuter-workflow.md` — the permuter lane (Mac).
- `src/overlay020/ov020_core.h` — the promoted ov020 vocabulary + wall census.
