/* data_ov006_021cc118 (36 bytes, 4-aligned): {short x; short y;}[9]
 * screen-position table, cm-restock-carve-1. Same shape as the
 * Ov006PosRow021cc03c/021cc08c families but its own standalone instance
 * (used unconditionally, not part of a self->f40 dispatch): consumer
 * func_ov006_021c0c14.s (sibling of the func_ov006_021c0dc8.s "detail
 * breakdown" family) loops exactly 9 times (`cmp fp,#0x9`) at stride 4,
 * reading `[r9]`=x / `[r9,#0x2]`=y, with y+3 used as a row offset (same
 * idiom as data_ov006_021cc08c). y is constant (31) across all 9 rows.
 * Independently corroborated by docs/research/dossiers (Ov004Ov006DeepR9
 * .md:3099,3357), which already flagged this as a "9-entry, stride-4
 * halfword-pair table" with a matching C sketch. relocs.txt: single load
 * reloc matching the consumer's own literal pool (_LIT1). Kept non-const,
 * matching the symbol's own prior non-const declaration (.data ground
 * truth).
 */
typedef struct {
    short x;
    short y;
} Ov006PosRow021cc118;

Ov006PosRow021cc118 data_ov006_021cc118[9] = {
    { 13, 31 }, { 38, 31 }, { 63, 31 }, { 84, 31 }, { 207, 31 },
    { 232, 31 }, { 115, 31 }, { 150, 31 }, { 182, 31 },
};
