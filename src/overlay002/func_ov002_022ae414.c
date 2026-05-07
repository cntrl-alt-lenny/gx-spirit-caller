/* func_ov002_022ae414: guarded indexed write — if r2 < 0 return
 * immediately; else if `arr[r1].f_1c != r2` then `arr[r1].f_1c = r2`.
 *
 *     cmp   r2, #0x0
 *     bxlt  lr
 *     add   r1, r0, r1, lsl #0x2     ; r1 = arr + idx*4
 *     ldr   r0, [r1, #0x1c]
 *     cmp   r2, r0
 *     strne r2, [r1, #0x1c]
 *     bx    lr
 *
 * Stride-4 indexed access (treats r0 as int*) with a CSE-suppressing
 * "write only if changed" guard.
 */

void func_ov002_022ae414(int *arr, int idx, int v) {
    int *slot;
    if (v < 0) return;
    slot = (int *)((char *)(arr + idx) + 0x1c);
    if (v != *slot) *slot = v;
}
