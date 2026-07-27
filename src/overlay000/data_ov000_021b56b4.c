/* data_ov000_021b56b4 (120 bytes, 4-aligned): retyped from opaque bytes
 * to a { short f0, f1, f2, f3; }[3][5] array as part of
 * cm-data-inference-7.
 *
 * STRONG, loop-bound-proven: 6 consumers (5 in this overlay, plus
 * cross-overlay func_ov012_021cb400.s) share `base + row*0x28 +
 * local*8` addressing (row 0-2, local 0-4 -- 15 8-byte records,
 * exactly 120/8). func_ov000_021ae69c.s:23-34,46-95 has an explicit
 * `add r7,r3,#0x2` (mode+2) loop bound, independently confirmed by
 * hand-decoding all 15 records: row 0/1/2 have exactly 2/3/4 non-empty
 * records after each row's header slot, matching mode+2 with zero
 * mismatches. All reads are `ldrsh` (signed) across all 6 consumers.
 * f2 (0x0100) and f3 (0x000c) are constant across every populated
 * record; f0 is always 0 in every observed record (possibly unused by
 * every currently-traced consumer, not necessarily always 0).
 */

typedef struct {
    short f0;
    short f1;
    short f2;
    short f3;
} Ov000CardLayoutEntry;

const Ov000CardLayoutEntry data_ov000_021b56b4[3][5] = {
    {
        { 0, 0, 256, 12 }, { 0, 80, 256, 12 }, { 0, 104, 256, 12 },
        { 0, 0, 0, 0 },    { 0, 0, 0, 0 },
    },
    {
        { 0, 0, 256, 12 }, { 0, 72, 256, 12 }, { 0, 96, 256, 12 },
        { 0, 120, 256, 12 }, { 0, 0, 0, 0 },
    },
    {
        { 0, 0, 256, 12 }, { 0, 56, 256, 12 }, { 0, 80, 256, 12 },
        { 0, 104, 256, 12 }, { 0, 128, 256, 12 },
    },
};
