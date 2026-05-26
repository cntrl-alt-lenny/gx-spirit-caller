# Brief 219 — C-38 easy-tier drain (40 ships)

**Brief:** 219 (decomper). Drain the 38 unmatched easy-tier picks
(leaf functions sized 0x10-0x20) via brief 216's Recipes A/B/C/D,
plus the two canaries (`func_0207db74` Recipe C, `func_02078ec8`
Recipe D) that brief 216 documented but didn't ship.

## Headline

**40 ships. Easy-tier matched ratio 96.6% → 100.0%** (1110/1110).
The two canaries shipped with their respective C recipes
(Recipe C/D worked examples). The remaining 38 picks shipped as
`.s` files (vanilla brief 202 recipe) — none of the 38 matched
Recipes A/B/C/D directly; they're a heterogeneous mix of bit-test,
field-init, MMIO, memcpy, and tail-call shapes that don't share
a single source-recipe.

`complete_units += 40` per region. 3-region SHA1 PASS preserved.

## Shipped recipes

### Recipe C canary — `func_0207db74` (.legacy.c)

```c
void func_0207db74(void *p) {
    void *sub = (void *)((char *)p + 0x24);
    *(unsigned int *)sub = *(unsigned int *)((char *)p + 0x18);
    *(unsigned int *)((char *)sub + 0x8) = 0;
}
```

Verified byte-identical to orig under `mwcc 1.2/sp2p3`. Recipe C
(substruct-ptr cached as `void *`, used across two stores) matches
the documented brief 216 pattern.

### Recipe D canary — `func_02078ec8` (.c)

```c
unsigned int func_02078ec8(volatile unsigned short *p) {
    (void)p[0];
    return (unsigned int)p[-1] << 16;
}
```

Verified byte-identical under default `.c` (mwcc 2.0/sp1p5).
Recipe D's `volatile` side-effect approach reaches under BOTH 1.2
and 2.0 tiers; default routing chosen since neither needs the
legacy compiler.

## The 38 `.s` ships

None of the 38 unmatched easy-tier picks structurally matched
Recipes A/B/C/D. They are:

| Shape family | Count | Examples |
|---|---:|---|
| Conditional return 0/1 (bit-test family) | 4 | `func_0202f410`, `func_020317c0`, `func_02060f30`, `func_ov002_021e2e18` |
| MMIO field-extract (lsl/lsr/and pattern) | 4 | `func_0208deec`, `func_0208df40`, `func_0208e1ac`, `func_0208e200` |
| Predicated struct-init (compound store) | 2 | `func_0207f8d8`, `func_0207f914` |
| Word-fill loops | 2 | `func_01ff8400` (itcm), `func_0200093c` (main) |
| Memcpy/strcpy loops | 2 | `func_020a7368`, `func_020aee58` |
| Bounds-check + array index | 1 | `func_02067850` |
| Struct-init flat (3 Thumb) | 3 | `func_0208b190`, `func_0208b1ac`, `func_0208b1c8` (.thumb routing) |
| Tail-call into mid-function (`.word` branch) | 1 | `func_020b3648` (hand-encoded `b` to `func_020b3658+0x10`) |
| Misc field accessors / wrappers | 19 | spread across main + overlays |
| **Total** | **38** | |

All shipped via `/tmp/gen_c34_s.py` (the brief 207 helper) modulo
two manual interventions:

1. **3 Thumb picks** (`func_0208b1c8`, `func_0208b190`,
   `func_0208b1ac`) — the generator looks for `arm_func_end`
   but Thumb functions use `thumb_func_end`. Wrote these by
   hand with `.thumb` directive.

2. **`func_020b3648`** has a final `b .L_020b3668` that targets
   `.L_020b3668` INSIDE `func_020b3658` (cross-function label
   reference). mwasm can't resolve cross-function labels, so the
   branch is hand-encoded: `b imm24` = `(target - PC - 8) >> 2`
   = `(0x020b3668 - 0x020b3654 - 8) >> 2` = `3`, encoded as
   `.word 0xea000003`.

3. **`itcm:func_01ff8400`** had to be hand-routed to
   `src/main/itcm/` (the generator defaults to `src/main/` for
   non-overlay picks; itcm has its own subdir).

## Why no Recipes A/B fits

Brief 216 documented Recipes A (null-guarded nested setter) and B
(substruct-ptr u16 xchg) as the canonical mwcc 1.2/sp2p3-only
recipes. None of the 38 picks have the orig shape these recipes
target:

- **Recipe A** requires a null-guarded nested setter pattern
  (`if (w->inner) { f34=1; f38=v; }`). The 4 "predicated
  struct-init" picks I saw (`func_0207f8d8`, etc.) have a
  different structure (multi-field conditional stores with
  `streq` / `streqh` predication, not the orig's specific A
  shape).
- **Recipe B** requires a u16 exchange at substruct+0x10. None
  of the 38 picks exchange at that exact substruct depth.

The 38 picks all ship as `.s` because:

- The bit-test family (4 picks) would need brief 214's C-37 recipe,
  but brief 217 falsified C-37 Shape B on stripped snippets;
  the with-context test is deferred to brief 218+.
- The MMIO bit-extract family (4 picks at `func_0208de*`,
  `func_0208e*`) reads 16-bit registers and packs into r0 via
  asr+lsl — likely closable from C but needs its own recipe.
- The rest are genuinely small leaf shapes where the orig's exact
  byte sequence is hard to coerce from C without significantly
  more variant-matrix exploration.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | ✓ OK |
| USA `ninja sha1` | ✓ OK |
| JPN `ninja sha1` | ✓ OK |
| `ninja check` | pre-existing ov004 sinit error (not introduced by brief 219) |
| `check_match_invariants.py` | 0 errors, 3905 warnings (pre-existing rename backlog) |
| Easy tier % | **96.6% → 100.0%** ✓ |

## Cross-references

- `docs/research/wall-2-leaf-no-pool-reg-alloc.md` — brief 216
  recipe spec
- `src/main/func_02087d10.legacy.c` — brief 216 Recipe A worked
  example
- `src/main/func_0207d36c.legacy.c` — brief 216 Recipe B worked
  example
- `src/main/func_0207db74.legacy.c` — brief 219 Recipe C worked
  example (this brief)
- `src/main/func_02078ec8.c` — brief 219 Recipe D worked example
  (this brief)
- Brief 217 PR #675 — easy-tier remainder 41 ships (preceding
  drain)

## Brief 214 Shape B re-test (stretch)

Brief 217 falsified brief 214 Shape B on stripped snippets. The
brief mentioned reconstructing full struct context from
`data_ov000_021c7530.o`. Deferred to brief 220+ — brief 219's
40-ship drain is the bigger lever and consumed the available
session budget. Scaffolder brief 218 is also investigating Shape
B; brief 220+ can synthesize.

## Recommendation for brief 220+

1. **Medium tier next** — easy is 100% drained. Medium tier sits
   at 88.8% (143/161). 18 unmatched medium-tier picks are the
   next bucket. Likely a mix of larger functions with multiple
   shape walls.
2. **MMIO bit-extract recipe** — the 4 `func_0208de*/0208e*`
   picks share a clear shape (`ldr base; ldrh value; and; asr;
   lsl; add base2; bx`). Worth a variant-matrix sweep to find a
   .c recipe.
3. **Conditional-return 0/1 recipe** — the 4 `func_X` picks all
   return `r0 = (cond) ? 0 : 1`. Likely closable from C with the
   right movne/moveq pattern.
