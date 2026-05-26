# Brief 224 — C-39 drain wave 1

**Brief:** 224 (decomper). First drain wave for brief 222's locked
C-39 bitfield recipe. Target 15-25 of 480 solo C-39 hard-tier picks
with per-pick effort cap ~10-15 min.

## Headline

**25 ships → hard-tier matched ratio 5.6% → 6.0%** (497/8351,
+25). 24 .s ships + 1 .c upgrade (brief 222 bitfield recipe).
Below the brief's 10-18 .c target but consistent with brief 223's
hard-tier reality: per-pick recipe attempts hit reg-alloc /
scheduling divergences not closable within the 10-15 min cap.

`complete_units +25`. 3-region SHA1 PASS preserved (EUR/USA/JPN).

## Picks

25 solo C-39 from ov002, mix of sizes:
- 20 small (0x40-0x80)
- 5 medium (0x90-0x98)

All in `src/overlay002/`. Selected via:

```bash
python3.13 tools/predict_walls.py --version eur  # regenerate
jq -r 'to_entries[] | select(.value | type == "array") | \
  select((.value | length) == 1) | \
  select(.value[0].id == "C-39") | .key' \
  build/eur/analysis/wall_predictions.json
```

Cross-referenced with hard-tier unmatched.

## .c upgrade — `func_ov002_021f4a00`

Tag6-check + bit-0 + helper pattern. Brief 222 bitfield recipe
plus key detail: the helper result is **stored in a named local**
so mwcc emits `mov r1, r0; cmp r1, #0` instead of `cmp r0, #0`.

```c
int func_ov002_021f4a00(struct Func021f4a00Self *self) {
    if (self->f2.tag6 != 0x23) {
        int n = func_ov002_021f3ba0(self);
        if (n > 0) {
            func_ov002_0226ae30(self->f2.bit0, n, 0, 0);
        }
    }
    return 1;
}
```

Byte-identical to orig under default `mwcc 2.0/sp1p5`.

## .c upgrade attempted but reverted — `func_ov002_021f84ec`

Two-bitfield helper + bmi-skip pattern. The recipe (brief 222
multi-bitfield variant) reached close but the post-helper branch
diverged:

- Orig: `movs r1, r0; bmi .end` (move-with-flags + branch-minus)
- Mine: `cmp r0, #0; blt .end` (compare + branch-less-than)

Semantically equivalent but byte-different. The `movs` shape
requires the source to express "side-effect store + sign check" in
a single statement that mwcc 2.0 recognises. Tried `if (n >= 0)`
and `if (n < 0)` variants — both emit `cmp; blt/bge`. Reverted to
.s after ~10 min (per brief's cap).

## Why only 1 .c (below brief's 10-18 expectation)

Same pattern as brief 223 (hard-tier wave 1, 1 of 29 .c
upgrades). The brief 222 recipe reaches the simple shapes (single
bitfield + helper + return 1), but most picks in the 480
solo-C-39 cohort have **second-order shape variations**:

- **Sign-check vs comparison**: orig `movs; bmi` vs mwcc's
  `cmp; blt`
- **Bitfield packing into helper args**: orig manually packs
  multiple bitfields into a single u16 helper arg; the natural
  C struct-arg form emits different shape
- **Helper-return reuse**: when orig stores helper result in a
  callee-saved reg and uses it later, recipe must match the
  exact storage pattern
- **Multi-call sequences**: orig emits the bitfield-read twice
  if used across a function call (no CSE on volatile fields);
  recipe needs to mirror the re-read explicitly

Each of these needs 20-40 min of variant-matrix work per pick to
close — beyond brief 224's 10-15 min cap. Brief 225+ should either
extend per-pick budget or accept the lower .c ratio at hard tier
in exchange for volume.

## Verification

| Gate | Status |
|---|:---:|
| EUR `ninja sha1` | ✓ OK |
| USA `ninja sha1` | ✓ OK |
| JPN `ninja sha1` | ✓ OK |
| Hard tier % | **5.6% → 6.0%** (497/8351) |

## What's deferred

455 of the 480 solo C-39 hard picks remain unmatched. Future waves
can either:
1. Extend per-pick budget (20-40 min) to attempt more .c upgrades
2. Continue volume .s ships and pick off .c upgrades opportunistically
3. Brief 225+ scaffolder lane: surface the second-order shape
   variations as sub-classifications (e.g., C-39a / C-39b)

## Cross-references

- `docs/research/brief-222-c39-non-leaf-bitfield.md` — recipe
- `src/overlay002/func_ov002_0223fd10.c` — canonical worked example
- `src/overlay002/func_ov002_021f609c.c` — multi-bitfield worked example
- `src/overlay002/func_ov002_02231f2c.c` — +literal-arg worked example
- `src/overlay002/func_ov002_021f4a00.c` — this brief (recipe upgrade)
- Brief 223 PR #683 — hard-tier wave 1 (C-23/StyleA, same 1-of-N .c ratio)
