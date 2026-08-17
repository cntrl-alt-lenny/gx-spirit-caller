/* data_ov006_021cc0b4 (20 bytes, 4-aligned): {short x; short y;}[5]
 * screen-position table, cm-restock-carve-8. Sibling of
 * data_ov006_021cc08c -- same struct, same consumer func_ov006_021c0dc8.s
 * (case self->f40 == 3 of the same 4-way dispatch, `_LIT3 =
 * data_ov006_021cc0b4`), same {0,0}-padded-slot idiom. See
 * data_ov006_021cc08c.c for the full field-usage writeup. relocs.txt:
 * single load reloc matching the consumer's own literal pool, zero
 * internal relocations inside this symbol's own span (pure value data,
 * confirmed). Kept non-const, matching the symbol's own prior non-const
 * declaration (.data ground truth).
 */
typedef struct {
    short x;
    short y;
} Ov006PosRow021cc08c;

Ov006PosRow021cc08c data_ov006_021cc0b4[5] = {
    { 74, 183 }, { 180, 183 }, { 0, 0 }, { 0, 0 }, { 0, 0 },
};
