/* Cluster C Pattern 1 wave 3 — data_020bead0 (136 bytes, 4-aligned).
 *
 * cm-data-inference-3: sole consumer func_0202d558.s indexes it with a
 * runtime loop counter (0..33) scaled by lsl #0x2 (stride 4) --
 * `ldr r1, [r5, r6, lsl #0x2]` -- to fetch a display-order remap ID,
 * bit-tested against a runtime ownership bitset. Loop bound (34),
 * declared size (136/4=34), and content (a bijective permutation of
 * 0..33) all independently agree on the record count. Sole consumer is
 * unmatched .s, so retyping carries zero consumer-recompilation risk.
 */

const int data_020bead0[34] = {
    23, 24, 25, 26, 27, 22, 28, 29, 21, 2, 3, 4, 7, 8, 9, 10, 11,
    12, 13, 14, 15, 5, 6, 0, 1, 16, 17, 18, 19, 20, 30, 31, 32, 33,
};
