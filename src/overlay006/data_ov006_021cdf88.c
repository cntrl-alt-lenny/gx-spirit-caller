/* data_ov006_021cdf88 (224 bytes, 4-aligned): retyped from opaque bytes to
 * a typed struct array as part of cm-data-inference-3.
 *
 * Evidence: 3 independent EUR consumers (func_ov006_021c1d74.s,
 * func_ov006_021c32ac.s, func_ov006_021c3384.s) plus a region port
 * (src/jpn|usa/overlay006/func_ov006_021c5e38.s) all compute
 * `base + idx*0x1C` at runtime (`mla ...,idx,#0x1c,base` or an explicit
 * `add r9,r9,#0x1c`-per-iteration loop), with func_ov006_021c3384.s's
 * loop bound (`cmp r7,#0x8`) confirming exactly 8 records (224/28).
 * Between the 3 consumers every one of the 10 4-byte-aligned sub-fields
 * is individually read (ldrsh for the six 2-byte fields, ldr for the
 * four 4-byte fields) and forwarded to a shared property-setter
 * (func_020216b0) with fixed property-ID literals matching x/y/grid
 * position/icon selection. func_ov006_021c32ac.s round-trips: it
 * re-derives the record index as `grid_col + grid_row*4 + 1`, which
 * maps back exactly onto records 1-7's own table positions --
 * self-consistent 2D grid indexing.
 *
 * Byte content is an exact reinterpretation of the same bytes previously
 * shipped as `unsigned char data_ov006_021cdf88[224]` -- mechanically
 * parsed out of the previous literal and round-trip-verified, never
 * hand-transcribed.
 */
typedef struct {
    short x;          /* +0x00 */
    short y;           /* +0x02 */
    short gridCol;       /* +0x04 -- sequential 0..3 / 0..2 per row group; -1 sentinel in record 0 */
    short gridRow;         /* +0x06 -- 0 or 1 per group; -1 sentinel in record 0 */
    short unk08;              /* +0x08 -- constant 3 in every record */
    short unk0A;                /* +0x0A -- constant 0 in every record */
    int unk0C;                    /* +0x0C -- constant 0 in every record */
    int iconId0;                    /* +0x10 */
    int iconId1;                      /* +0x14 */
    int iconId2;                        /* +0x18 */
} DuelIconEntry;

DuelIconEntry data_ov006_021cdf88[8] = {
    { 231, 167, -1, -1, 3, 0, 0, 21, 21, 22 },
    { 24, 47, 0, 0, 3, 0, 0, 0, 1, 2 },
    { 80, 47, 1, 0, 3, 0, 0, 3, 4, 5 },
    { 136, 47, 2, 0, 3, 0, 0, 6, 7, 8 },
    { 192, 47, 3, 0, 3, 0, 0, 9, 10, 11 },
    { 52, 103, 0, 1, 3, 0, 0, 12, 13, 14 },
    { 108, 103, 1, 1, 3, 0, 0, 15, 16, 17 },
    { 164, 103, 2, 1, 3, 0, 0, 18, 19, 20 },
};
