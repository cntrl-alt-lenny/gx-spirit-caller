/* data_ov006_021cc1b8 (84 bytes, 4-aligned): Ov006HitRect021cc164[7],
 * cm-restock-carve-1. Sibling of data_ov006_021cc164 -- same 6-table
 * family dispatched by func_ov006_021be948.s's self->f40 switch (case 6
 * selects this table, `mov r6,#0x7` confirms 7 rows). See
 * data_ov006_021cc164.c for the full family/field-provenance writeup.
 * Rows 0-4 are byte-identical to data_ov006_021cc164 (shared UI
 * hit-regions cut from the same design template), diverging only in the
 * last 2 rows. relocs.txt: single load reloc matching the consumer's own
 * literal pool (_LIT... at .L_021bee5c). Kept non-const, matching the
 * symbol's own prior non-const declaration (.data ground truth).
 */
typedef struct {
    short x0, y0, x1, y1;
    int   tag;
} Ov006HitRect021cc164;

Ov006HitRect021cc164 data_ov006_021cc1b8[7] = {
    { 231, 167, 254, 190,  0 },
    {   0,   1,  28,  28,  2 },
    {  31,   1,  51,  28,  3 },
    {  53,   1,  71,  28,  4 },
    { 227,   0, 255,  14,  5 },
    { 175, 167, 200, 190, 30 },
    { 203, 167, 228, 190, 31 },
};
