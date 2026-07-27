/* data_ov002_022c8368 (40 bytes, 4-aligned): CONTRADICTION cluster
 * reconstruction, cm-data-inference-8. Absorbs the previously-separate
 * data_ov002_022c836c (36 bytes) plus the immediately preceding 4-byte
 * unclaimed gap at 0x022c8368 (symbols.txt-declared, never delinks.txt-
 * claimed) into one logical struct{unsigned int id; unsigned int flag;}[5]
 * table. Sole consumer func_ov002_02264b84.s indexes both `_LIT1 =
 * &data_ov002_022c8368` and the old `_LIT3 = &data_ov002_022c836c`
 * (== base+4) with the *same* runtime loop counter `r9` at the *same*
 * `lsl #0x3` (stride 8) -- an 8-byte stride only divides evenly starting
 * at 0x022c8368, proving the true record boundary is 4 bytes earlier than
 * the old data_ov002_022c836c symbol.
 *
 * The 4 leading bytes (record[0].id) were never carved into source; read
 * directly from the original overlay dump
 * (extract/eur/arm9_overlays/ov002.bin, file offset 0x11dec8 =
 * 0x022c8368 - the module's own .text base 0x021aa4a0) and round-trip-
 * verified byte-for-byte: the 36 bytes immediately following in that same
 * dump read match the already-shipped data_ov002_022c836c.c content
 * exactly, confirming the offset arithmetic.
 */
typedef struct {
    unsigned int id;
    unsigned int flag;
} Ov002IdFlagRecord;

const Ov002IdFlagRecord data_ov002_022c8368[5] = {
    { 0x1315, 1 },
    { 0x1449, 0 },
    { 0x144c, 0 },
    { 0x1452, 0 },
    { 0x1457, 0 },
};
