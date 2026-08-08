/* data_ov006_021cc164 (84 bytes, 4-aligned): Ov006HitRect021cc164[7]
 * touch-hit-region table, cm-restock-carve-1. One member of a 6-table
 * family ALL dispatched by the same self->f40 switch in
 * func_ov006_021be948.s (Ov006_Battle_BuildChoice per
 * docs/research/retriage/Ov004Ov006DeepR8.md:2990-3110): case 1 ->
 * data_ov006_021cc164 (7 rows); case 2 -> data_ov006_021cc618 (15 rows);
 * case 5 -> data_ov006_021cc334 (9 rows); case 6 -> data_ov006_021cc1b8
 * (7 rows); case 0/3 -> data_ov006_021cc2c8 (9 rows); default ->
 * data_ov006_021cc268 (8 rows) -- all 6 siblings shipped together this
 * wave, all reusing this same typedef. Hit-test body
 * (func_ov006_021be948.s:264-277): four ldrsh reads at +0/+2/+4/+6
 * (`x0<=touchX<=x1 && y0<=touchY<=y1`) followed by one 32-bit ldr at +8
 * (the tag returned to the caller on a hit) -- decisive vs. the
 * unrelated same-shaped data_ov006_021ce084 "HitBox" family (different
 * consumer, func_ov006_021c6530.s, not part of this dispatch). This
 * table's own row count (7) matches the loop-bound literal `mov r6,#0x7`
 * exactly. Rows 0-4 are byte-identical to sibling data_ov006_021cc1b8
 * (shared UI hit-regions), diverging only in the last 2 rows.
 * relocs.txt: single load reloc matching the consumer's own literal pool
 * (_LIT... at .L_021bee50), no internal pointer relocations. Kept
 * non-const, matching the symbol's own prior non-const declaration
 * (.data ground truth).
 */
typedef struct {
    short x0, y0, x1, y1;
    int   tag;
} Ov006HitRect021cc164;

Ov006HitRect021cc164 data_ov006_021cc164[7] = {
    { 231, 167, 254, 190,  0 },
    {   0,   1,  28,  28,  2 },
    {  31,   1,  51,  28,  3 },
    {  53,   1,  71,  28,  4 },
    { 227,   0, 255,  14,  5 },
    {  11, 167,  76, 191, 15 },
    { 151, 167, 216, 191, 16 },
};
