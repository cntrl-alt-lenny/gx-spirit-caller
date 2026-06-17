/* func_02055fc4: stmfd-only prologue + nested null-checks + helper.
 *
 *     stmfd sp!, {lr}; sub sp, sp, #4
 *     cmp r0, #0; addeq sp,#4; ldmeqia
 *     ldr r1, [r0, #0]; cmp r1, #0
 *     addeq sp,#4; ldmeqia
 *     bl func_02056680(self)
 *     pop
 */
extern void func_02056680(void *self);

void func_02055fc4(void **pp) {
    if (pp == 0) return;
    if (*pp == 0) return;
    func_02056680(pp);
}
