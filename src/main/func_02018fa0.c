/* func_02018fa0: `state[0x91c] += value` — read-modify-write add.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    GetSystemWork
 *     ldr   r1, [r0, #0x91c]
 *     add   r1, r1, r4
 *     str   r1, [r0, #0x91c]
 *     ldmia sp!, {r4, pc}
 */

extern char *GetSystemWork(void);

void func_02018fa0(int value) {
    int *slot = (int *)(GetSystemWork() + 0x91c);
    *slot += value;
}
