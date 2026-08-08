/* data_ov006_021cc08c (20 bytes, 4-aligned): {short x; short y;}[5]
 * screen-position table, cm-restock-carve-1. Same shape/idiom as the
 * already-shipped Ov006PosRow021cc03c family (data_ov006_021cc03c.c),
 * own instance per that file's per-family-typedef convention -- serves
 * the sibling "detail breakdown" renderer func_ov006_021c0dc8.s rather
 * than func_ov006_021bcedc.s/func_ov006_021be948.s. Consumer:
 * `ldr r4,_LIT1; add r0,r4,idx,lsl#0x2` selects this array (case
 * self->f40 in {1,4,6} of a 4-way dispatch alongside data_ov006_021cc0a0/
 * _021cc0b4/_021cc0c8), then `ldrsh r3,[r5,#0x2]` (y) / `ldrsh r1,[r5]`
 * (x), with x used as a base column and y+3 as a row offset for digit
 * rendering (func_ov006_021b6d00). relocs.txt: single load reloc
 * matching the consumer's own literal pool (_LIT1). Kept non-const,
 * matching the symbol's own prior non-const declaration (.data ground
 * truth).
 */
typedef struct {
    short x;
    short y;
} Ov006PosRow021cc08c;

Ov006PosRow021cc08c data_ov006_021cc08c[5] = {
    { 30, 183 }, { 80, 183 }, { 130, 183 }, { 180, 183 }, { 0, 0 },
};
