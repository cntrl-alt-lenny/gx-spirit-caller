/* func_0201abd4: clear bit (n-1) in state[0x8fc] — 1-indexed bit flag clear.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     bl    func_02018b28
 *     sub   r1, r4, #0x1           ; bit index = n - 1
 *     mov   r2, #0x1
 *     mvn   r1, r2, lsl r1         ; r1 = ~(1 << (n-1))
 *     ldr   r2, [r0, #0x8fc]
 *     and   r1, r2, r1             ; slot &= ~(1 << (n-1))
 *     str   r1, [r0, #0x8fc]
 *     ldmia sp!, {r4, pc}
 */

extern char *func_02018b28(void);

void func_0201abd4(int n) {
    int *slot = (int *)(func_02018b28() + 0x8fc);
    *slot &= ~(1 << (n - 1));
}
