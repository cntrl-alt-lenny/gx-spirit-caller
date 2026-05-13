/* func_02037a74: combine 2 halfword globals + a call result into
 * a 2-bit flag word.
 *
 *     stmdb sp!, {r4, lr}
 *     ldr   r1, .L_02037afc                ; data_0219c3a0
 *     ldr   r0, .L_02037b00                ; data_0219c3a2
 *     ldrh  r1, [r1, #0x0]
 *     ldrh  r0, [r0, #0x0]
 *     mov   r4, #0x0
 *     orr   r0, r1, r0
 *     cmp   r0, #0x0
 *     movgt r4, #0x1
 *     bl    func_0203c38c
 *     cmp   r0, #0x0
 *     orrne r4, r4, #0x2
 *     mov   r0, r4
 *     ldmia sp!, {r4, pc}
 *  .L_02037afc: .word data_0219c3a0
 *  .L_02037b00: .word data_0219c3a2
 */

extern unsigned short data_0219c3a0;
extern unsigned short data_0219c3a2;
extern int            func_0203c38c(void);

int func_02037a74(void) {
    int flags = 0;
    if ((int)(data_0219c3a0 | data_0219c3a2) > 0) flags = 1;
    if (func_0203c38c() != 0) flags |= 2;
    return flags;
}
