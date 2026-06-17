/* func_02087cbc: sibling of 02087d7c (different helper).
 *
 *     stmfd sp!, {lr}; sub sp, sp, #4
 *     ldr r0, [r0]; cmp r0, #0
 *     addeq sp, sp, #4; ldmfdeq sp!, {pc}
 *     ldrb r0, [r0, #0x3c]
 *     bl func_02095158(p[60])
 *     add sp, sp, #4; ldmfd sp!, {pc}
 */
extern void func_02095158(unsigned char x);

void func_02087cbc(unsigned char **pp) {
    unsigned char *p = *pp;
    if (p == 0) return;
    func_02095158(p[60]);
}
