/* data_ov010_021b889c -- 6x3 u16 table (36 bytes).
 *
 * Sole consumer func_ov010_021b5898.s: `mla r0,r2,r5,r8` (r5=6, the
 * STRIDE) with a runtime idx `r2` read from data_02104f4c+4 (matching
 * already-matched func_ov010_021b4144.c's identical decode), inside an
 * outer `sl<3` loop reading `base+idx*6+sl*2` -- computed-stride, loop-
 * bound-proven column count. See docs/queue/claude-scaffolder.md
 * (cm-data-inference-5).
 */

const unsigned short data_ov010_021b889c[6][3] = {
    { 0x000f, 0x0010, 0x0001 },
    { 0x000f, 0x0010, 0x0001 },
    { 0x000f, 0x0010, 0x0002 },
    { 0x000f, 0x0010, 0x0003 },
    { 0x000f, 0x0010, 0x0004 },
    { 0x000f, 0x0010, 0x0005 },
};
