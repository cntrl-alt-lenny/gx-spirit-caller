/* data_ov006_021cbb74 (24 bytes, 4-aligned): Ov006StateCb dispatch table
 * (5 slots, NULL-terminated), cm-restock-carve-1. Already declared in
 * ov006_core.h line 73 as part of the "callback-dispatch family (5
 * members)": state 0224f2e8 / table 021cbb74, caller 021b49b4. Real
 * bytes confirmed via extract/eur/arm9_overlays/ov006.bin: 5 words in
 * ov006's own .text range + one trailing zero word, no more. Kept
 * non-const, matching the existing extern's non-const declaration
 * (.data ground truth). extern char + cast, matching this family's
 * already-shipped sibling data_ov006_021cbb50.c (cm-data-inference-8).
 */

typedef int (*Ov006StateCb)(void);

extern char func_ov006_021b49fc;
extern char func_ov006_021b4aa0;
extern char func_ov006_021b4db8;
extern char func_ov006_021b4e38;
extern char func_ov006_021b4ea8;

Ov006StateCb data_ov006_021cbb74[6] = {
    (Ov006StateCb)&func_ov006_021b49fc,
    (Ov006StateCb)&func_ov006_021b4aa0,
    (Ov006StateCb)&func_ov006_021b4db8,
    (Ov006StateCb)&func_ov006_021b4e38,
    (Ov006StateCb)&func_ov006_021b4ea8,
    0,
};
