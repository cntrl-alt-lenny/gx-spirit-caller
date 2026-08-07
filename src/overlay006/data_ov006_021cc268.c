/* data_ov006_021cc268 (96 bytes, 4-aligned): Ov006HitRect021cc164[8],
 * cm-restock-carve-1. One of the 6-table family dispatched by
 * func_ov006_021be948.s's self->f40 switch -- this is the default/case-4
 * table (`mov r6,#0x8` confirms 8 rows). See data_ov006_021cc164.c for
 * the full family/field-provenance writeup (same struct, same consumer,
 * same hit-test idiom: ldrsh at +0/+2/+4/+6, ldr at +8). relocs.txt:
 * single load reloc matching the consumer's own literal pool, no
 * internal pointer relocations. Kept non-const, matching the symbol's
 * own prior non-const declaration (.data ground truth).
 */
typedef struct {
    short x0, y0, x1, y1;
    int   tag;
} Ov006HitRect021cc164;

Ov006HitRect021cc164 data_ov006_021cc268[8] = {
    { 231, 167, 254, 190, 0 },
    {   0,   1,  28,  28, 2 },
    {  31,   1,  51,  28, 3 },
    {  53,   1,  71,  28, 4 },
    { 227,   0, 255,  14, 5 },
    {  11, 167,  76, 191, 15 },
    {  81, 167, 146, 191, 16 },
    { 151, 167, 216, 191, 17 },
};
