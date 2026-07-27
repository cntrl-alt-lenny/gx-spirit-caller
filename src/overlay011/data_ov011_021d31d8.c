/* data_ov011_021d31d8 (100 bytes, 4-aligned): retyped from opaque bytes to
 * a signed int[5][5] symmetric distance matrix as part of cm-data-inference-6.
 * Byte content is already-verified byte-identical (real, already-matched
 * consumer -- the strongest possible evidence class): func_ov011_021cd6e0.c:4
 * -- `*(const int *)(data_ov011_021d31d8 + (row - 1) * 20 + (col - 1) * 4)`,
 * proving row stride 20 (5 cols x 4 bytes) with runtime-variable row/col.
 * Symmetry (matrix[i][j] == matrix[j][i]) independently corroborates the
 * 5x5 shape.
 */

const int data_ov011_021d31d8[5][5] = {
    { 0, 408730, 369772, 748883, 1406571 },
    { 408730, 0, 476424, 851229, 1506266 },
    { 369772, 476424, 0, 666144, 1323566 },
    { 748883, 851229, 666144, 0, 640654 },
    { 1406571, 1506266, 1323566, 640654, 0 },
};
