/* func_ov011_021d2d44: read the (x,y) short pair at index idx from the
 * obj->+0x20 array into *out_x / *out_y (sign-extended). obj->+0x20 is
 * re-read for the second component (orig reloads it).
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   ip, [r0, #0x20]
 *     mov   lr, r1, lsl #0x2
 *     ldrsh ip, [ip, lr] ; str ip, [r2, #0x0]
 *     ldr   r0, [r0, #0x20]
 *     add   r0, r0, r1, lsl #0x2
 *     ldrsh r0, [r0, #0x2] ; str r0, [r3, #0x0]
 *     ldmia sp!, {r3, pc}
 */

void func_ov011_021d2d44(void *obj, int idx, int *out_x, int *out_y) {
    *out_x = *(short *)((char *)*(void **)((char *)obj + 0x20) + idx * 4);
    *out_y = *(short *)((char *)*(void **)((char *)obj + 0x20) + idx * 4 + 2);
}
