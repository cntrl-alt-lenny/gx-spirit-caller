/* data_ov006_021cbb8c (36 bytes, 4-aligned): Ov006StateCb dispatch table
 * (9 slots, NULL-terminated), cm-restock-carve-1. Already declared in
 * ov006_core.h line 75 as part of the "callback-dispatch family (5
 * members)": state 0224f330 / table 021cbb8c, caller 021b4f20. Real
 * bytes confirmed via extract/eur/arm9_overlays/ov006.bin: 8 words in
 * ov006's own .text range + one trailing zero word, no more. Kept
 * non-const, matching the existing extern's non-const declaration
 * (.data ground truth). extern char + cast, matching this family's
 * already-shipped sibling data_ov006_021cbb50.c (cm-data-inference-8,
 * also a 9-slot table -- same shape, different call site).
 */

typedef int (*Ov006StateCb)(void);

extern char func_ov006_021b4f68;
extern char func_ov006_021b5074;
extern char func_ov006_021b5390;
extern char func_ov006_021b53d4;
extern char func_ov006_021b543c;
extern char func_ov006_021b5490;
extern char func_ov006_021b5524;
extern char func_ov006_021b559c;

Ov006StateCb data_ov006_021cbb8c[9] = {
    (Ov006StateCb)&func_ov006_021b4f68,
    (Ov006StateCb)&func_ov006_021b5074,
    (Ov006StateCb)&func_ov006_021b5390,
    (Ov006StateCb)&func_ov006_021b53d4,
    (Ov006StateCb)&func_ov006_021b543c,
    (Ov006StateCb)&func_ov006_021b5490,
    (Ov006StateCb)&func_ov006_021b5524,
    (Ov006StateCb)&func_ov006_021b559c,
    0,
};
