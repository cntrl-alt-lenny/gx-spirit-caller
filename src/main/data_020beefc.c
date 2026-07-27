/* data_020beefc -- 4x4 row/column-indexed int table (64 bytes).
 *
 * Sole consumer func_0208147c.c: `data_020beefc[p[1]][p[0]]`, a real
 * matched (100%-objdiff) 2D computed-index access. Row/column bounds
 * independently corroborated: the only caller sources p[0]/p[1] from
 * the already-shipped sibling data_020beedc[4][4][2], whose own values
 * are proven mathematically confined to {0,1,2,3} -- so the runtime
 * indices reaching this table are independently known to range over
 * exactly 4 values per axis, matching the 64/16=4 row count exactly.
 * See docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

const int data_020beefc[4][4] = {
    { 0x00000000, 0x00004000, 0x40004000, 0x00000000 },
    { 0x00008000, 0x40000000, 0x80004000, 0x00000000 },
    { 0x40008000, 0x80008000, 0x80000000, 0xc0004000 },
    { 0x00000000, 0x00000000, 0xc0008000, 0xc0000000 },
};
