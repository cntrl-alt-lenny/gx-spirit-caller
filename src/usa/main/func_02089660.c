/* func_02089660: twin of func_02036010 — same shape, different
 * middle-call value. Identical 3-call sandwich.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    func_020954b4
 *     mov   r4, r0
 *     mov   r0, #0x1
 *     bl    func_02095584
 *     mov   r0, r4
 *     bl    func_020954f4
 *     ldmia sp!, {r4, pc}
 *
 * Asm is byte-identical shape to func_02036010 — but lives at a
 * different address with the same 3 callees. Treat as a true
 * clone.
 */

extern int func_020954b4(void);
extern int func_02095584(int x);
extern int func_020954f4(int x);

int func_02089660(void) {
    int saved = func_020954b4();
    func_02095584(1);
    return func_020954f4(saved);
}
