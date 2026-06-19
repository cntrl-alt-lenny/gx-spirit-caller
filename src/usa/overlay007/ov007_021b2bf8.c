/* func_ov007_021b2bf8: 2D global-table lookup (row stride 0x20, col stride 0x4).
 *
 *     ldr r0, .L_021b2d08          ; base = &data_ov007_021b2fc0
 *     add r0, r0, r1, lsl #0x5     ; row = base + idx1 * 0x20
 *     ldr r0, [r0, r2, lsl #0x2]   ; r0 = row[idx2]  (int[] indexing)
 *     bx  lr
 * .L_021b2d08: .word data_ov007_021b2fc0
 *
 * Reads `data_ov007_021b2fc0[idx1].col[idx2]` where each "row" is
 * an 0x20-byte struct interpreted as int[8]. Sibling of
 * ov007_021b2ce8.c (same table family, different base offset +4
 * into the row).
 */

extern char data_ov007_021b2fc0[];

int func_ov007_021b2bf8(int _ctx, int idx1, int idx2) {
    int *row = (int *)(data_ov007_021b2fc0 + idx1 * 0x20);
    (void)_ctx;
    return row[idx2];
}
