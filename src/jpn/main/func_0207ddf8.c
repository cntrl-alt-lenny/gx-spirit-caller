/* func_0207ddf8: register-reshuffling tail call into func_0207d3ac
 * (itself still unmatched -- ships as asm for the same reason as
 * func_02052d68). new_r0 = *(old_r0 + 0x4); new_r2 = *(old_r0 + 0x8);
 * tail-call via pool-loaded address + bx.
 */

extern void func_0207d3ac(void);

asm void func_0207ddf8(void) {
    nofralloc
    ldr     ip, =func_0207d3ac
    mov     r2, r0
    ldr     r0, [r2, #0x4]
    ldr     r2, [r2, #0x8]
    bx      ip
}
