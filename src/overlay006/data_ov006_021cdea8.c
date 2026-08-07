/* data_ov006_021cdea8 (224 bytes, 4-aligned): second DuelIconEntry[8]
 * table (same 28-byte layout as the already-shipped data_ov006_021cdf88,
 * see that file for the typedef's original field-provenance writeup),
 * cm-restock-carve-1. Consumer func_ov006_021c3714.s walks it with
 * `add r9,r9,#0x1c` per iteration over exactly 8 records (`cmp r7,#0x8`)
 * and reads the SAME offsets forwarded to the SAME func_020216b0
 * property IDs (0xc/0xd/0x11/0x12) that df88's own consumers use (see
 * data_ov006_021cddec.c) -- decisive structural match. gridCol/gridRow
 * (+4/+6) are the -1 sentinel in every record here (never read by this
 * consumer); unk0A/unk0C vary per record (0/1/2), unlike df88's constant
 * filler, and are forwarded verbatim as func_020216b0 properties
 * 0x11/0xc -- their exact per-record meaning beyond that isn't pinned
 * down, same honesty level already accepted for df88's own unk08/unk0A/
 * unk0C naming. Called from func_ov006_021c2280.s and 3x from
 * func_ov006_021c2510.s, both siblings of the df88-driving
 * func_ov006_021c1d74. relocs.txt: single load reloc matching the
 * consumer's own literal pool (_LIT1). Kept non-const, matching the
 * symbol's own prior non-const declaration (.data ground truth).
 */
typedef struct {
    short x, y;
    short gridCol, gridRow;
    short unk08, unk0A;
    int   unk0C;
    int   iconId0, iconId1, iconId2;
} DuelIconEntry;

DuelIconEntry data_ov006_021cdea8[8] = {
    { 231, 167, -1, -1, 3, 0, 0,  6,  6,  7 },
    { 173, 166, -1, -1, 3, 0, 0, 21, 21, 22 },
    {  14, 150, -1, -1, 3, 0, 1,  0,  0,  0 },
    { 134, 150, -1, -1, 3, 0, 2,  0,  0,  0 },
    { 217,  32, -1, -1, 3, 2, 0,  0,  0,  0 },
    { 217,  30, -1, -1, 3, 1, 0,  0,  0,  1 },
    { 217, 121, -1, -1, 3, 1, 0,  2,  2,  3 },
    { 217,  49, -1, -1, 3, 0, 0,  4,  4,  5 },
};
