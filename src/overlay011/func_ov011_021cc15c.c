/* func_ov011_021cc15c: returns whether two accessors agree (a == b-1) for
 * the handle at data_ov011_021d4110[idx].
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     ldr   r1, =data_ov011_021d4110
 *     ldr   r5, [r1, r0, lsl #0x2]     ; handle = table[idx]
 *     mov   r0, r5
 *     bl    func_0201e7f4              ; a
 *     mov   r4, r0
 *     mov   r0, r5
 *     bl    func_0201e80c              ; b
 *     sub   r0, r0, #0x1
 *     cmp   r4, r0
 *     moveq r0, #0x1
 *     movne r0, #0x0
 *     ldmia sp!, {r3, r4, r5, pc}
 */

extern char data_ov011_021d4110[];
extern int func_0201e7f4(int handle);
extern int func_0201e80c(int handle);

int func_ov011_021cc15c(int idx) {
    int handle = *(int *)(data_ov011_021d4110 + idx * 4);
    return func_0201e7f4(handle) == func_0201e80c(handle) - 1;
}
