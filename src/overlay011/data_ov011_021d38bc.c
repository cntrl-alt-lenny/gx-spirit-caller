/* data_ov011_021d38bc (20 bytes, 4-aligned): retyped from a mislabeled
 * "D-2 scalar array" tag to a D-1 function-pointer dispatch table (5
 * slots, NULL-terminated) as part of cm-data-inference-6. The D-2 tag
 * was a misclassification: D-2 requires zero in-range relocs and >=0x40
 * bytes (docs/research/cluster-d-recipe.md); this symbol has 4 in-range
 * relocs and is only 0x14 bytes, matching the D-1 (fn-ptr table) profile
 * instead. relocs.txt confirms all 4 non-null words resolve to real
 * function symbols. Consumers (both already-matched C, computed-stride,
 * runtime-variable index via a mutable struct field, NULL-terminator-
 * proven count): func_ov011_021d0afc.c:8,11,14,17 and
 * func_ov011_021d0b4c.c:14,17,24,27.
 */

typedef int (*Ov011StepFn)(void);

/* extern char (not a function/fn-ptr type) + &target, matching this
 * project's own D-1 recipe precedent (src/main/data_0210210c.c) for
 * referencing not-yet-matched target symbols by address only. */
extern char func_ov011_021ca0c4;
extern char func_ov011_021cb574;
extern char func_ov011_021d07b0;
extern char func_ov011_021d0938;

Ov011StepFn data_ov011_021d38bc[5] = {
    (Ov011StepFn)&func_ov011_021ca0c4,
    (Ov011StepFn)&func_ov011_021cb574,
    (Ov011StepFn)&func_ov011_021d07b0,
    (Ov011StepFn)&func_ov011_021d0938,
    0,
};
