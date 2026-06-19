/* func_ov020_021ab6fc: family ae6bf115 sibling of ov010_021b35a4.
 * Identical shape — free-and-null two pointer slots via func_02006e00.
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0
 *     ldr   r0, [r5, #0x0]
 *     mov   r4, r1
 *     cmp   r0, #0x0
 *     beq   .L_a
 *     bl    func_02006e00
 *     mov   r0, #0x0
 *     str   r0, [r5, #0x0]
 *  .L_a:
 *     ldr   r0, [r4, #0x0]
 *     cmp   r0, #0x0
 *     popeq {r3, r4, r5, pc}
 *     bl    func_02006e00
 *     mov   r0, #0x0
 *     str   r0, [r4, #0x0]
 *     pop   {r3, r4, r5, pc}
 */

extern void func_02006e00(void *p);

void func_ov020_021ab6fc(void **a, void **b) {
    if (*a != 0) {
        func_02006e00(*a);
        *a = 0;
    }
    if (*b != 0) {
        func_02006e00(*b);
        *b = 0;
    }
}
