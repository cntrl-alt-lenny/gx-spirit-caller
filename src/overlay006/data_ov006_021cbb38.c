/* data_ov006_021cbb38 (24 bytes, 4-aligned): Ov006StateCb dispatch table
 * (5 slots, NULL-terminated), cm-restock-carve-1. Already declared in
 * ov006_core.h line 77 as part of the "callback-dispatch family (5
 * members)": state 0224f248 / table 021cbb38, caller 021b3a1c. Real
 * bytes confirmed via extract/eur/arm9_overlays/ov006.bin: 5 words in
 * ov006's own .text range + one trailing zero word, no more. Kept
 * non-const, matching the existing extern's non-const declaration
 * (.data ground truth). extern char + cast, matching this family's
 * already-shipped sibling data_ov006_021cbb50.c (cm-data-inference-8).
 */

typedef int (*Ov006StateCb)(void);

extern char func_ov006_021b3a64;
extern char func_ov006_021b3b08;
extern char func_ov006_021b3e20;
extern char func_ov006_021b3ea0;
extern char func_ov006_021b3f10;

Ov006StateCb data_ov006_021cbb38[6] = {
    (Ov006StateCb)&func_ov006_021b3a64,
    (Ov006StateCb)&func_ov006_021b3b08,
    (Ov006StateCb)&func_ov006_021b3e20,
    (Ov006StateCb)&func_ov006_021b3ea0,
    (Ov006StateCb)&func_ov006_021b3f10,
    0,
};
