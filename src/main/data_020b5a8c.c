/* data_020b5a8c -- 7-entry position table + 2-byte pad (44 bytes,
 * 4-aligned).
 *
 * Sole consumer func_0201ac60.c: `data_020b5a8c + (idx-1)*6` (computed,
 * runtime-variable stride). Bound proven code-side by the enumerator
 * func_0201ac1c.c (`if (n >= 8) return 0; for (i=n;i<8;i++) ...`), which
 * caps every reachable idx to [1,7] -- 7 records, matching 7*6=42 of the
 * 44 declared bytes exactly (the trailing 2 bytes are unreached, 4-byte
 * alignment padding, both zero in the committed literal). The one real
 * dereference site (src/overlay011/func_ov011_021cdc68.s) reads offset 0
 * as unsigned (id/key), offsets 2 and 4 as SIGNED halfwords, each <<12
 * before use (fixed-point x/y). NOTE: naming docs (docs/research/map/
 * NAMES.md et al.) label func_0201ac60 "Card_GetNamePtr", contradicted
 * by this access pattern (no byte-loop/draw/copy call) -- likely stale,
 * flagged for a human to revisit, not corrected here.
 * See docs/research/data/cm-data-inference-4-2026-07-25.md.
 */

typedef struct {
    unsigned char id;   /* offset 0x0 -- ldrb (unsigned), search key */
    unsigned char pad;  /* offset 0x1 -- unread by the known consumer;
                            0x00 in all 7 records, needed for 2-byte
                            alignment of the next field */
    short x;             /* offset 0x2 -- ldrsh (signed), <<12 fixed-point */
    short y;             /* offset 0x4 -- ldrsh (signed), <<12 fixed-point */
} Entry020b5a8c;          /* sizeof == 6 */

const struct {
    Entry020b5a8c entries[7];
    unsigned char tail[2];  /* unreached; index 8 is never returned */
} data_020b5a8c = {
    .entries = {
        { 3, 0, 290, 210 },
        { 4, 0, 205, 424 },
        { 2, 0, 235, 186 },
        { 2, 0, 64, 318 },
        { 2, 0, 172, 294 },
        { 5, 0, 359, 70 },
        { 2, 0, 197, 250 },
    },
    .tail = { 0x00, 0x00 },
};
