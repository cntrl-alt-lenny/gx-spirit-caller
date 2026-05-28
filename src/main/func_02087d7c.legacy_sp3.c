/* func_02087d7c: stmfd-only prologue + ptr-null-check + helper(byte).
 *
 *     stmfd sp!, {lr}; sub sp, sp, #4
 *     ldr r0, [r0]; cmp r0, #0
 *     addeq sp, sp, #4; ldmfdeq sp!, {pc}
 *     ldrb r0, [r0, #0x3c]
 *     bl func_02095130(p[60])
 *     add sp, sp, #4; ldmfd sp!, {pc}
 *
 * Brief 242 sub-shape 4 sibling — .legacy_sp3.c routing tier.
 */
extern void func_02095130(unsigned char x);

void func_02087d7c(unsigned char **pp) {
    unsigned char *p = *pp;
    if (p == 0) return;
    func_02095130(p[60]);
}
