/* func_0203455c: NULL-check wrapper around Task_InvokeLocked.
 *
 *     stmdb sp!, {r3, lr}
 *     cmp   r0, #0x0
 *     ldmeqia sp!, {r3, pc}         ; null → early return (void)
 *     bl    Task_InvokeLocked
 *     ldmia sp!, {r3, pc}
 *
 * 5 ARM instructions, 0x14 bytes. The conditional `ldmeqia` is mwcc's
 * standard early-return codegen for a top-of-function null-guard
 * followed by an unconditional delegated call. Contrast with a
 * symmetric `if (x) Task_InvokeLocked(x); return;` form, which emits the
 * exact same bytes — both parse to this idiom.
 */

extern void Task_InvokeLocked(void *p);

void func_0203455c(void *p) {
    if (p == 0) return;
    Task_InvokeLocked(p);
}
