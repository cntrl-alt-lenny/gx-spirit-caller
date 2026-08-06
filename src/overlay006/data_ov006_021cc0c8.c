/* data_ov006_021cc0c8 (20 bytes, 4-aligned): {short x; short y;}[5]
 * screen-position table, cm-restock-carve-1. Sibling of
 * data_ov006_021cc08c -- same struct, same consumer func_ov006_021c0dc8.s
 * (case self->f40 in {0,5} of the same 4-way dispatch, `_LIT4 =
 * data_ov006_021cc0c8`), same {0,0}-padded 5th slot idiom. See
 * data_ov006_021cc08c.c for the full field-usage writeup. relocs.txt:
 * single load reloc matching the consumer's own literal pool. Kept
 * non-const, matching the symbol's own prior non-const declaration
 * (.data ground truth).
 */
typedef struct {
    short x;
    short y;
} Ov006PosRow021cc08c;

Ov006PosRow021cc08c data_ov006_021cc0c8[5] = {
    { 0, 0 }, { 38, 183 }, { 108, 183 }, { 178, 183 }, { 0, 0 },
};
