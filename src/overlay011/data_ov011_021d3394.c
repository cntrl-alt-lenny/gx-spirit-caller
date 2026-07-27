/* data_ov011_021d3394 (40 bytes, 4-aligned): retyped from opaque bytes
 * as part of cm-data-inference-7. Address and size are UNCHANGED --
 * this symbol turns out to be 2 clean fields (offset 0x4a/0x52) of a
 * much larger 0x72-stride row table starting at (still uncarved)
 * data_ov011_021d32d8, confirmed by 9+ independent consumer functions
 * all sharing the same `#0x72` stride literal. This file deliberately
 * does NOT attempt the full table reconciliation (would require
 * editing 2 other already-matched C consumers, `data_ov011_021d32d9`'s
 * and `data_ov011_021d33bc`'s, plus resolving an open question about
 * row 0's anomalous content) -- filed as a carried-over lead for a
 * future wave. This symbol's OWN 40 bytes are safe and well-evidenced
 * to type in isolation: both real consumers below use
 * `data_ov011_021d3394 + row*0x72 + slot` addressing, which is
 * indifferent to this symbol's own C-level type (raw pointer
 * arithmetic in walled .s), so retyping carries no risk regardless of
 * the wider table's un-reconciled state.
 *
 * STRONG: func_ov011_021cd2d4.s:36-39 and func_ov011_021d191c.s:101-109
 * (both walled .s, computed-stride, runtime row+slot indices) --
 * entries[slot] read as a single byte, `entries[0..1]` populated
 * (0x11,0x12 -- a "global ID = slot+0x11" numbering matching sibling
 * `data_ov011_021d334a`'s row1 memberIds={1,2}), rest zero-padded.
 * posC[0..1] populated with plausible small coordinate pairs, rest
 * zero -- self-consistent with a 2-valid-entry row (count field lives
 * in the row's own still-uncarved header, not in this symbol's range).
 */

typedef struct {
    unsigned char entries[8];
    struct {
        short x;
        short y;
    } posC[8];
} Ov011Row021d3394Tail;

const Ov011Row021d3394Tail data_ov011_021d3394 = {
    .entries = { 0x11, 0x12, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 },
    .posC = {
        { 217, 220 }, { 250, 408 }, { 0, 0 }, { 0, 0 },
        { 0, 0 }, { 0, 0 }, { 0, 0 }, { 0, 0 },
    },
};
