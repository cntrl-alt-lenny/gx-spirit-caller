/* func_020552b0: minimal pass-through thunk to func_02091680.
 *
 *     ldr  ip, .L_0205532c
 *     bx   ip
 * .L_0205532c: .word func_02091680
 *
 * 3 insns + 1 pool = 0x10 bytes.
 *
 * Tests whether mwcc-C emits the indirect `ldr ip; bx ip` form for a
 * zero-arg-adjustment tail call to a cross-TU function. PR #217
 * showed it does for 5-insn arg-rearranging thunks; this tests the
 * minimal case.
 */

extern void func_02091680(void *p);

void func_020552b0(void *p) {
    func_02091680(p);
}
