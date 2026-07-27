/* data_ov006_021cb7b8 (40 bytes, 4-aligned): retyped from opaque bytes to
 * a signed short[5][4] record table as part of cm-data-inference-10.
 * Same evidence class as already-shipped sibling data_ov006_021cb634
 * (cm-data-inference-6): sole consumer func_ov006_021c426c.s bulk-copies
 * all 40 bytes (mov r2,#0xa-bounded loop) then reads the copy back as 5
 * records of 4 ldrsh halfwords (cmp lr,#0x5-bounded loop). Resolves a
 * wave-5 "CONTRADICTION" label that was really just a family-mismatch
 * note (this symbol doesn't belong to the RGB555-palette cluster the
 * other addresses in that batch belonged to), not a genuine
 * relocs/boundary contradiction -- re-derived independently here as a
 * clean STRONG verdict on its own terms.
 */

typedef struct {
    short f0;
    short f1;
    short f2;
    short f3;
} Row021cb7b8;

const Row021cb7b8 data_ov006_021cb7b8[5] = {
    { 217,  49, 240, 121 },
    { 217,  30, 240,  48 },
    { 217, 122, 240, 140 },
    { 217,  49, 240,  68 },
    { 217, 102, 240, 121 },
};
