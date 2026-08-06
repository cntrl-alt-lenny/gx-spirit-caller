/* data_ov006_021cc618 (180 bytes, 4-aligned): Ov006HitRect021cc164[15],
 * cm-restock-carve-1. One of the 6-table family dispatched by
 * func_ov006_021be948.s's self->f40 switch -- case 2 (`mov r6,#0xf`
 * confirms 15 rows, the family's largest member). See
 * data_ov006_021cc164.c for the full family/field-provenance writeup
 * (same struct, same consumer, same hit-test idiom). relocs.txt: single
 * load reloc matching the consumer's own literal pool, no internal
 * pointer relocations. Kept non-const, matching the symbol's own prior
 * non-const declaration (.data ground truth).
 */
typedef struct {
    short x0, y0, x1, y1;
    int   tag;
} Ov006HitRect021cc164;

Ov006HitRect021cc164 data_ov006_021cc618[15] = {
    { 231, 167, 254, 190, 0 },
    {   0,   1,  28,  28, 2 },
    {  31,   1,  51,  28, 3 },
    {  53,   1,  71,  28, 4 },
    { 227,   0, 255,  14, 5 },
    {  74,  11,  93,  28, 6 },
    {  95,  11, 111,  28, 7 },
    { 113,  11, 129,  28, 8 },
    { 131,  11, 148,  28, 9 },
    { 150,  11, 167,  28, 10 },
    { 169,  11, 186,  28, 11 },
    { 188,  11, 205,  28, 12 },
    { 207,  11, 224,  28, 13 },
    {  11, 167, 112, 191, 14 },
    { 117, 167, 218, 191, 15 },
};
