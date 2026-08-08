/* func_020854a4: resolve a sub-block pointer via a u16 relative offset at
 * +0xc; if the u16 tag at +0xe isn't 1, use the block's own +4 offset
 * field; else verify a "BTX0" magic at +0 before using the block's +0
 * offset field. Leaf, no stack frame.
 *
 *     ldrh  r2, [r0, #0xc]
 *     ldrh  r1, [r0, #0xe]
 *     add   r3, r0, r2
 *     cmp   r1, #0x1
 *     bne   .L_b8
 *     ldr   r2, [r0]
 *     ldr   r1, =0x30585442
 *     cmp   r2, r1
 *     ldreq r1, [r3]
 *     addeq r0, r0, r1
 *     movne r0, #0x0
 *     bx    lr
 *   .L_b8:
 *     ldr   r1, [r3, #0x4]
 *     add   r0, r0, r1
 *     bx    lr
 */

void *func_020854a4(void *self) {
    unsigned short fc = *(unsigned short *)((char *)self + 0xc);
    unsigned short fe = *(unsigned short *)((char *)self + 0xe);
    char *base = (char *)self + fc;
    if (fe != 1) goto not_one;
    if (*(int *)self == 0x30585442) {
        return (char *)self + *(int *)base;
    }
    return 0;
not_one:
    return (char *)self + *(int *)(base + 4);
}
