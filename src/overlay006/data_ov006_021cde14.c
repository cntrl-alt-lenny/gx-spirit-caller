/* data_ov006_021cde14 (24 bytes, 4-aligned): TouchBoxEntry[2], second-
 * priority touch region, cm-restock-carve-1. Same struct/consumer as
 * data_ov006_021cddfc (see that file for the full field-provenance
 * writeup) -- func_ov006_021c43bc.s's second cascade table (.L_1f3c),
 * gated on data_ov006_021cde2c[self->0x58]==2, returning {3, loop_index}
 * on a hit. The +8 id field is NEVER read on this cascade branch
 * (confirmed in the .s: only the box bounds feed the compare chain), and
 * both records carry the sentinel 0xffffffff there rather than a real
 * id -- an honest "confirmed dead", not a guess. relocs.txt: single load
 * reloc matching the consumer's own literal pool (_LIT2). Kept non-const,
 * matching the symbol's own prior non-const declaration (.data ground
 * truth).
 */
typedef struct {
    short xMin, yMin, xMax, yMax;
    int   id;
} TouchBoxEntry;

TouchBoxEntry data_ov006_021cde14[2] = {
    { 10,  146, 125, 164, -1 },
    { 130, 146, 244, 164, -1 },
};
