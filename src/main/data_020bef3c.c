/* data_020bef3c -- 8-entry bitmask-merge table (32 bytes).
 *
 * Sole consumer func_020843e0.s indexes it twice with independent
 * runtime-variable indices, each explicitly masked `and rX,rX,#0x7`
 * before an `lsl #0x2` word load -- the mod-8 mask directly proves 8
 * valid entries (not just size-inferred). Each word is used as a
 * `(default & ~mask) | (override & mask)` bitfield-merge constant. See
 * docs/queue/claude-scaffolder.md (cm-data-inference-5).
 */

const unsigned int data_020bef3c[8] = {
    0x00000000, 0x00007fff, 0x7fff0000, 0x7fff7fff,
    0x00008000, 0x0000ffff, 0x7fff8000, 0x7fffffff,
};
