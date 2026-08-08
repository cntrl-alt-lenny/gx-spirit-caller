/* func_020a2cbc: cache-flush + notify wrapper. Style A (2-step epilogue).
 *
 *     stmdb sp!, {r4, r5, r6, lr}
 *     mov   r6, r0
 *     mov   r4, r2
 *     add   r2, r6, #0x1f
 *     mov   r5, r1
 *     mov   r0, r4
 *     bic   r1, r2, #0x1f
 *     bl    func_02092904
 *     bl    DC_WaitWriteBufferEmpty
 *     mov   r0, r4
 *     mov   r1, r6
 *     mov   r2, r5
 *     bl    func_020a36dc
 *     ldmia sp!, {r4, r5, r6, lr}
 *     bx    lr
 */

extern void func_02092904(int c, int roundedA);
extern void DC_WaitWriteBufferEmpty(void);
extern int func_020a36dc(int c, int a, int b);

int func_020a2cbc(int a, int b, int c) {
    func_02092904(c, (a + 0x1f) & ~0x1f);
    DC_WaitWriteBufferEmpty();
    return func_020a36dc(c, a, b);
}
