/* data_ov006_021ce0a8 (196 bytes, 4-aligned): DuelIconEntry[7], reuses
 * the already-shipped DuelIconEntry typedef (data_ov006_021cdf88.c)
 * verbatim, cm-restock-carve-1. Sole consumer func_ov006_021c5f44.s
 * (`add r9,r9,#0x1c; cmp r6,#0x7`, 7 records of 28 bytes = 196 exactly)
 * reads offsets +0x0/+0x2/+0x8/+0xa/+0xc/+0x10/+0x18, forwarding every
 * one to func_020216b0 with property IDs {3,4,0x11,0x12,0xc,0xd} -- the
 * identical offset/property-ID mapping df88's own consumers use (see
 * data_ov006_021cddec.c). gridCol/gridRow (+4/+6) are the -1 sentinel in
 * EVERY record here (this table isn't 2D-grid-positioned, unlike df88);
 * iconId1 (+0x14) is never read by this consumer, same as several of
 * DuelIconEntry's ten sub-fields are only touched by df88's own OTHER
 * consumers, not all by one function. relocs.txt: single load reloc in
 * the whole 196-byte span, zero interior pointer relocations. NOTE:
 * USA/JPN's own data_ov006_021ce0a8.c is a 4-byte brief-174 mechanical
 * bundle placeholder (unrelated to this EUR struct) -- checked against
 * docs/research/cross-region-symbol-aliasing-audit.md, this address is
 * NOT among the 105 flagged aliasing-risk addresses; not itself carved
 * here (EUR-only per this campaign's phased strategy), just noted per
 * that lane's "flag real cases" request. Kept non-const, matching the
 * symbol's own prior non-const declaration (.data ground truth).
 */
typedef struct {
    short x, y;
    short gridCol, gridRow;
    short unk08, unk0A;
    int   unk0C;
    int   iconId0, iconId1, iconId2;
} DuelIconEntry;

DuelIconEntry data_ov006_021ce0a8[7] = {
    { 231, 167, -1, -1, 3, 0, 0,  6,  6,  7 },
    { 173, 166, -1, -1, 3, 0, 0,  8,  8,  9 },
    { 227,   0, -1, -1, 3, 0, 0, 10, 10, 11 },
    { 231,  34, -1, -1, 3, 2, 0,  0,  0,  0 },
    { 231,  32, -1, -1, 3, 1, 0,  0,  0,  1 },
    { 231, 140, -1, -1, 3, 1, 0,  2,  2,  3 },
    { 231,  51, -1, -1, 3, 0, 0,  4,  4,  5 },
};
