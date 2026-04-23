/* func_0201ab2c: extract byte 0 of state[0x900] (unsigned 8-bit field).
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_02018b28
 *     ldr   r0, [r0, #0x900]
 *     mov   r0, r0, lsl #0x18      ; (x << 24) >> 24 = low u8
 *     mov   r0, r0, lsr #0x18
 *     ldmia sp!, {r3, pc}
 */

extern char *func_02018b28(void);

unsigned int func_0201ab2c(void) {
    int v = *(int *)(func_02018b28() + 0x900);
    return (unsigned int)(v << 24) >> 24;
}
