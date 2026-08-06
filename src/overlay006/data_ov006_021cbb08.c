/* data_ov006_021cbb08 (24 bytes, 4-aligned): Ov006StateCb dispatch table
 * (5 slots, NULL-terminated), cm-restock-carve-1. Already declared in
 * ov006_core.h line 148 ("extern int (*data_ov006_021cbb08[])(void);" --
 * same type as the Ov006StateCb typedef, spelled out). Dispatch-family
 * variant: state 0224f1b0 / table 021cbb08, caller 021b2e58 (ov006_core.h
 * lines 141-148). Real bytes confirmed via extract/eur/arm9_overlays/
 * ov006.bin: 5 words in ov006's own .text range + one trailing zero word,
 * no more. Kept non-const, matching the existing extern's non-const
 * declaration (.data ground truth). extern char + cast, matching this
 * project's D-1 recipe precedent (src/main/data_0210210c.c and this
 * family's own sibling, data_ov006_021cbb50.c from cm-data-inference-8).
 */

typedef int (*Ov006StateCb)(void);

extern char func_ov006_021b2eac;
extern char func_ov006_021b2f70;
extern char func_ov006_021b3290;
extern char func_ov006_021b3318;
extern char func_ov006_021b33c4;

Ov006StateCb data_ov006_021cbb08[6] = {
    (Ov006StateCb)&func_ov006_021b2eac,
    (Ov006StateCb)&func_ov006_021b2f70,
    (Ov006StateCb)&func_ov006_021b3290,
    (Ov006StateCb)&func_ov006_021b3318,
    (Ov006StateCb)&func_ov006_021b33c4,
    0,
};
