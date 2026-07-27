/* data_020be9e8 -- 34-entry short lookup table (68 bytes, 4-aligned).
 *
 * Sole consumer func_0202d4a8.s: `ldrsh r2, [r2, r1]` with r1 = arg1<<1
 * (computed stride, signed halfword) -> OS_SPrintf(buf, fmt,
 * data_020be9e8[arg1]). arg1 is proven bounded to [0,33] two ways: the
 * outer loop bound (func_0202d558.s, `cmp r6,#0x22`) and the value fed
 * in, data_020bead0[r6] -- an already-shipped, proven bijective
 * permutation of 0..33 (src/main/data_020bead0.c). Content is itself a
 * clean bijection of 1..34, and a pre-existing independent dossier
 * (docs/research/dossiers/0202d4a8.md) already reconstructed the same
 * `extern short data_020be9e8[]` typing. See
 * docs/research/data/cm-data-inference-4-2026-07-25.md.
 */

const short data_020be9e8[34] = {
    30, 29, 20, 33, 16, 21, 22, 23, 14, 15, 3, 2, 5, 4, 1, 19, 24, 27,
    28, 25, 26, 34, 13, 7, 8, 9, 6, 12, 10, 11, 31, 32, 17, 18,
};
