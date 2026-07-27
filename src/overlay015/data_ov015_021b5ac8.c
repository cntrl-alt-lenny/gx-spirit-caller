/* data_ov015_021b5ac8 -- 8x2 u16 table (32 bytes).
 *
 * Sole consumer func_ov015_021b4ba0.s: a hard-coded 8-iteration copy
 * loop (`mov r2,#0x8`, 4-byte stride) proves exactly 8 rows -- the
 * loop bound directly proves the element count, not size-inference.
 * Column values are RGB555 red/red+blue/red+green/white masks
 * (content observation, not part of the shape proof). See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

const unsigned short data_ov015_021b5ac8[8][2] = {
    { 0x4210, 0x7c00 }, { 0x001f, 0x7c1f }, { 0x03e0, 0x7fe0 }, { 0x03ff, 0x7fff },
    { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000, 0x0000 }, { 0x0000, 0x0000 },
};
