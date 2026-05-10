/* func_02089748: twin of func_02036060 — same shape, different
 * middle-call value. Identical 3-call sandwich.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    func_020955a8
 *     mov   r4, r0
 *     mov   r0, #0x1
 *     bl    func_02095678
 *     mov   r0, r4
 *     bl    func_020955e8
 *     ldmia sp!, {r4, pc}
 *
 * Asm is byte-identical shape to func_02036060 — but lives at a
 * different address with the same 3 callees. Treat as a true
 * clone.
 */

extern int func_020955a8(void);
extern int func_02095678(int x);
extern int func_020955e8(int x);

int func_02089748(void) {
    int saved = func_020955a8();
    func_02095678(1);
    return func_020955e8(saved);
}
