/* func_02018fa0: `state[0x91c] += value` — read-modify-write add.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02018b28
 *     ldr   r1, [r0, #0x91c]
 *     add   r1, r1, r4
 *     str   r1, [r0, #0x91c]
 *     ldmia sp!, {r4, pc}
 */

extern char *func_02018b28(void);

void func_02018fa0(int value) {
    int *slot = (int *)(func_02018b28() + 0x91c);
    *slot += value;
}
