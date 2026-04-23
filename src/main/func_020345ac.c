/* func_020345ac: NULL-check wrapper around func_02006870.
 *
 *     stmdb sp!, {r3, lr}
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}         ; null → early return (void)
 *     bl    func_02006870
 *     ldmia sp!, {r3, pc}
 *
 * 5 ARM instructions, 0x14 bytes. The conditional `ldmeqia` is mwcc's
 * standard early-return codegen for a top-of-function null-guard
 * followed by an unconditional delegated call. Contrast with a
 * symmetric `if (x) func_02006870(x); return;` form, which emits the
 * exact same bytes — both parse to this idiom.
 */

extern void func_02006870(void *p);

void func_020345ac(void *p) {
    if (p == 0) return;
    func_02006870(p);
}
