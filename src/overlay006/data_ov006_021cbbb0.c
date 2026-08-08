/* data_ov006_021cbbb0 (24 bytes, 4-aligned): Ov006StateCb dispatch table
 * (5 slots, NULL-terminated), cm-restock-carve-1. Already declared in
 * ov006_core.h line 71 as part of the "callback-dispatch family (5
 * members)": state 0224f38c / table 021cbbb0, caller 021b5614. Real
 * bytes confirmed via extract/eur/arm9_overlays/ov006.bin: 5 words in
 * ov006's own .text range + one trailing zero word, no more. Kept
 * non-const, matching the existing extern's non-const declaration
 * (.data ground truth). extern char + cast, matching this family's
 * already-shipped sibling data_ov006_021cbb50.c (cm-data-inference-8).
 */

typedef int (*Ov006StateCb)(void);

extern char func_ov006_021b565c;
extern char func_ov006_021b56d8;
extern char func_ov006_021b59e4;
extern char func_ov006_021b5a2c;
extern char func_ov006_021b5a54;

Ov006StateCb data_ov006_021cbbb0[6] = {
    (Ov006StateCb)&func_ov006_021b565c,
    (Ov006StateCb)&func_ov006_021b56d8,
    (Ov006StateCb)&func_ov006_021b59e4,
    (Ov006StateCb)&func_ov006_021b5a2c,
    (Ov006StateCb)&func_ov006_021b5a54,
    0,
};
