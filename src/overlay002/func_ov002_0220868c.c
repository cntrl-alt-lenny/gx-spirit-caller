/* func_ov002_0220868c: C-42 — single helper + fn-pointer arg + bool-from-cmp tail.
 *
 * Orig shape (32 B, 7 ARM insns + 1 pool word):
 *
 *     push  {r3, lr}
 *     ldr   r1, [pc, #16]             ; r1 = &func_ov002_021e96a0 (fn ptr)
 *     bl    func_ov002_02257878       ; helper(x, fn)
 *     cmp   r0, #0
 *     movgt r0, #1                    ; bool: result > 0
 *     movle r0, #0
 *     pop   {r3, pc}
 *     .word func_ov002_021e96a0
 *
 * Brief 237 C-42 — pool-loaded function pointer passed as helper arg, plus
 * mwcc's standard `cmp + movgt/movle` bool-from-comparison tail (the same
 * pattern brief 227 wave 2 documented as "boolean-from-helper").
 *
 * Natural recipe: `return helper(x, (void *)fn_target) > 0;` — mwcc
 * pool-loads the function pointer + emits the bool tail.
 *
 * See `func_ov002_021b0c34.c` for the recipe rationale.
 */

extern int func_ov002_02257878(int x, void *fn);
extern int func_ov002_021e96a0(void);

int func_ov002_0220868c(int x) {
    return func_ov002_02257878(x, (void *)func_ov002_021e96a0) > 0;
}
