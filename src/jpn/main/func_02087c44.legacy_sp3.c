/* func_02087c44: stmfd-only prologue + ptr-null-check + helper(field).
 *
 *     stmfd sp!, {lr}
 *     sub   sp, sp, #4
 *     ldr   r0, [r0]
 *     cmp   r0, #0
 *     addeq sp, sp, #4
 *     ldmfdeq sp!, {pc}
 *     ldrb  r0, [r0, #60]
 *     bl    helper
 *     add   sp, sp, #4
 *     ldmfd sp!, {pc}
 *
 * Brief 242 C-42 sub-shape 4 (stmfd + sub sp #4 prologue). NOT a
 * reg-alloc issue — brief 240's diagnosis was incomplete: this is
 * an mwcc 1.2/sp3 routing tier. The `*.legacy_sp3.c` filename
 * routes through 1.2/sp3 which emits `stmfd sp!, {lr}; sub sp, #4`
 * for 8-byte stack alignment (vs mwcc 2.0's `push {r3, lr}`).
 */
extern void func_0209510c(unsigned char x);

void func_02087c44(unsigned char **pp) {
    unsigned char *p = *pp;
    if (p == 0) return;
    func_0209510c(p[60]);
}
