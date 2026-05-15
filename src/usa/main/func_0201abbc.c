/* func_0201abbc: test bit (n-1) in state[0x8fc] — 1-indexed bit flag read.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    GetSystemWork
 *     ldr   r2, [r0, #0x8fc]
 *     sub   r0, r4, #0x1
 *     mov   r1, #0x1
 *     and   r0, r2, r1, lsl r0     ; return slot & (1 << (n-1))
 *     ldmia sp!, {r4, pc}
 *
 * No store — pure read. Returns the masked value (non-zero if set).
 */

extern char *GetSystemWork(void);

int func_0201abbc(int n) {
    int slot = *(int *)(GetSystemWork() + 0x8fc);
    return slot & (1 << (n - 1));
}
