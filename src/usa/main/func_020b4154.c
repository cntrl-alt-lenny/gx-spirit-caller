/* func_020b4154: call func_020b40cc(arr+i) for i in [0,count), count read
 * through a pointer. First param (self) unused. Fused pop{regs,pc}, even
 * push count, no sub sp -- ambiguous default/sp3, trying default first.
 *
 *     stmdb sp!, {r4, r5, r6, lr}
 *     ldr   r5, [r2]
 *     mov   r6, r1
 *     cmp   r5, #0x0
 *     mov   r4, #0x0
 *     bls   .L_7c
 *   .L_68:
 *     add   r0, r6, r4
 *     bl    func_020b40cc
 *     add   r4, r4, #0x1
 *     cmp   r4, r5
 *     bcc   .L_68
 *   .L_7c:
 *     mov   r0, #0x0
 *     ldmia sp!, {r4, r5, r6, pc}
 */

extern void func_020b40cc(char *p);

int func_020b4154(void *self, char *arr, unsigned int *countPtr) {
    unsigned int i;
    unsigned int count = *countPtr;
    for (i = 0; i < count; i++) {
        func_020b40cc(arr + i);
    }
    return 0;
}
