/* data_ov010_021b88c0 -- 16x2 u16 table (64 bytes).
 *
 * Sole consumer func_ov010_021b534c.s: a hard-coded 16-iteration copy
 * loop (`mov r2,#0x10`, 4-byte stride) proves exactly 16 rows -- the
 * loop bound directly proves the element count, not size-inference.
 * The copy is then walked with a genuine computed index reading only
 * the first 8 rows, matching the raw bytes exactly (rows 8-15 are all
 * zero). See docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

const unsigned short data_ov010_021b88c0[16][2] = {
    { 0x229f, 0x2108 }, { 0x03ff, 0x2108 }, { 0x7fe0, 0x2108 }, { 0x03e0, 0x2108 },
    { 0x7c1f, 0x1084 }, { 0x319f, 0x210a }, { 0x7e10, 0x2000 }, { 0x7fff, 0x1084 },
    { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000, 0x0000 },
    { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000, 0x0000 },
};
