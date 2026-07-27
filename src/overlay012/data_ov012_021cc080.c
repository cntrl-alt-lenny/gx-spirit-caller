/* data_ov012_021cc080 (36 bytes, 4-aligned): retyped from opaque bytes
 * as part of cm-data-inference-7. Last symbol of the real 56-byte
 * object also spanning data_ov012_021cc06c/021cc078/021cc07c (see
 * data_ov012_021cc06c.c for the full object's provenance).
 *
 * First 4 bytes (2 halfwords) STRONG: func_ov012_021ca964.s:268-269,275
 * (single live loop iteration, `cmp r8,#1`), forwarded as args to
 * func_ov000_021ac478.s alongside sibling data_ov012_021cc078's pair.
 * Bytes 4-15 (3 words) and bytes 30-35 (2 words) unevidenced -- no
 * consumer found anywhere in src/, kept opaque rather than guessing a
 * shape/width. Bytes 16-21 (the 6-byte lookup table) STRONG:
 * func_ov012_021ca18c.s:29-45,61-78 copies these 6 bytes to a stack
 * buffer then indexes it with a runtime value -- a genuine
 * copy-then-index array access, independently corroborated by
 * docs/research/c-match-prep/021ca18c.c's own prior reading of the
 * same disassembly. Bytes 22-27 unevidenced (visually pattern-like --
 * 0x20 then five 0x40s -- but no consumer reads them, not forced into
 * a second lookup table on pattern alone).
 */

typedef struct {
    unsigned short unk_00; /* = 28 */
    unsigned short unk_02; /* = 20 */
    unsigned char unk_04[12];
    unsigned char lut[6]; /* = {5, 1, 4, 0, 3, 2} */
    unsigned char unk_1a[6];
    unsigned char unk_20[8];
} Ov012Entry021cc080;

const Ov012Entry021cc080 data_ov012_021cc080 = {
    .unk_00 = 28,
    .unk_02 = 20,
    .unk_04 = { 0x02, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x3c, 0x00, 0x00, 0x00 },
    .lut = { 5, 1, 4, 0, 3, 2 },
    .unk_1a = { 0x20, 0x40, 0x40, 0x40, 0x40, 0x40 },
    .unk_20 = { 0x80, 0xd6, 0x01, 0x00, 0x40, 0x00, 0x00, 0x00 },
};
