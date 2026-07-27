/* data_ov010_021b8940 -- 6x5 u16 table (60 bytes).
 *
 * Sole consumer func_ov010_021b799c.s: `mla r0,r2,r5,r8` (r5=10, the
 * STRIDE) with a runtime idx from the same data_02104f4c+4 idiom as
 * the sibling data_ov010_021b889c, inside an outer `sl<5` loop reading
 * `base+idx*10+sl*2` -- computed-stride, loop-bound-proven column
 * count. See docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

const unsigned short data_ov010_021b8940[6][5] = {
    { 0x000f, 0x0010, 0x0011, 0x0012, 0x0001 },
    { 0x000f, 0x0010, 0x0011, 0x0012, 0x0001 },
    { 0x000f, 0x0010, 0x0011, 0x0012, 0x0002 },
    { 0x000f, 0x0010, 0x0011, 0x0012, 0x0003 },
    { 0x000f, 0x0010, 0x0011, 0x0012, 0x0004 },
    { 0x000f, 0x0010, 0x0011, 0x0012, 0x0005 },
};
