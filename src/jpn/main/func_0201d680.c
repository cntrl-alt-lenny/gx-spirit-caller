/* func_0201d680: helper-call + null-check + shift. Ternary form drives
 * mwcc to emit the predicated body BEFORE the moveq fallback (matching
 * orig's `ldrne; movne; moveq; bx lr` order).
 *
 *     stmdb sp!, {r3, lr}
 *     ldr   r1, .L_0201d6f4           ; 0x50414c54
 *     bl    func_0201d5cc
 *     cmp   r0, #0x0
 *     ldrne r0, [r0, #0x8]
 *     movne r0, r0, lsl #0x1
 *     moveq r0, #0x0
 *     ldmia sp!, {r3, pc}
 */

extern void *func_0201d5cc(void *self, unsigned int tag);

int func_0201d680(void *self) {
    int *p = (int *)func_0201d5cc(self, 0x50414c54u);
    return (p != 0) ? (p[2] << 1) : 0;
}
