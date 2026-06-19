/* func_ov011_021cc098: returns whether two accessors agree (a == b-1) for
 * the handle at data_ov011_021d4030[idx].
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     ldr   r1, =data_ov011_021d4030
 *     ldr   r5, [r1, r0, lsl #0x2]     ; handle = table[idx]
 *     mov   r0, r5
 *     bl    func_0201e7a0              ; a
 *     mov   r4, r0
 *     mov   r0, r5
 *     bl    func_0201e7b8              ; b
 *     sub   r0, r0, #0x1
 *     cmp   r4, r0
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     ldmia sp!, {r3, r4, r5, pc}
 */

extern char data_ov011_021d4030[];
extern int func_0201e7a0(int handle);
extern int func_0201e7b8(int handle);

int func_ov011_021cc098(int idx) {
    int handle = *(int *)(data_ov011_021d4030 + idx * 4);
    return func_0201e7a0(handle) == func_0201e7b8(handle) - 1;
}
