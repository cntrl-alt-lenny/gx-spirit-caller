/* data_ov006_021ce084 (36 bytes, 4-aligned): Ov006HitRect021ce084[3]
 * point-in-rectangle hit-test table, cm-restock-carve-1. Sole consumer
 * func_ov006_021c6530.s: `ldrsh [r6]/[r6,#2]/[r6,#4]/[r6,#6]` tests
 * `(r9,r8)` (the function's own (x,y) args) against
 * `[xMin,xMax]x[yMin,yMax]`; on a hit, `ldr [r6,#8]` returns
 * `{found=1, id=record.id}`. Loop bound 3 (`cmp r5,#0x3`) matches
 * 36/12 exactly. Same 4-short+1-int shape as the unrelated
 * Ov006HitRect021cc164 family (different consumer/subsystem --
 * func_ov006_021be948.s -- kept as a separate typedef rather than
 * conflated). relocs.txt: single load reloc matching the consumer's own
 * literal pool, zero interior pointer relocations. id=2's record is
 * conditionally skipped elsewhere based on
 * func_ov006_021c6f24(&data_ov006_0225deb4), consistent with a
 * conditionally-hidden corner button. Kept non-const, matching the
 * symbol's own prior non-const declaration (.data ground truth).
 */
typedef struct {
    short xMin, yMin, xMax, yMax;
    int   id;
} Ov006HitRect021ce084;

Ov006HitRect021ce084 data_ov006_021ce084[3] = {
    { 231, 167, 254, 190, 0 },
    { 174, 167, 227, 190, 1 },
    { 227,   0, 255,  19, 2 },
};
