/* func_ov000_021aad54: C-42 — multi-call thunk; helper1 result saved in r4,
 * void helper2 called, then return helper1's saved result.
 *
 * Orig shape (32 B, 8 ARM insns):
 *
 *     push  {r4, lr}
 *     mov   r1, #4                    ; helper1 arg1 = 4
 *     mov   r2, #0                    ; helper1 arg2 = 0
 *     bl    func_02006bf0             ; helper1(x, 4, 0)
 *     mov   r4, r0                    ; save helper1 return in r4 (callee-saved)
 *     bl    func_02084f8c             ; helper2()
 *     mov   r0, r4                    ; r0 = helper1's saved return
 *     pop   {r4, pc}
 *
 * Brief 237 C-42 — natural recipe `int n = helper1(x, 4, 0); helper2();
 * return n;`. mwcc spills n to r4 (callee-saved) because helper2 clobbers
 * r0-r3; restores r0 = r4 for the return.
 *
 * See `func_ov002_021b0b54.c` for the recipe rationale.
 */

extern int func_02006bf0(int x, int arg1, int arg2);
extern void func_02084f8c(void);

int func_ov000_021aad54(int x) {
    int n = func_02006bf0(x, 4, 0);
    func_02084f8c();
    return n;
}
