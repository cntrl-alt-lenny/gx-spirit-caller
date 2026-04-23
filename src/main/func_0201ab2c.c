/* func_0201ab2c: extract byte 0 of state[0x900] (unsigned 8-bit field).
 *
 *     stmdb sp!, {r3, lr}
 *     bl    GetSystemWork
 *     ldr   r0, [r0, #0x900]
 *     mov   r0, r0, lsl #0x18      ; (x << 24) >> 24 = low u8
 *     mov   r0, r0, lsr #0x18
 *     ldmia sp!, {r3, pc}
 */

extern char *GetSystemWork(void);

unsigned int func_0201ab2c(void) {
    int v = *(int *)(GetSystemWork() + 0x900);
    return (unsigned int)(v << 24) >> 24;
}
