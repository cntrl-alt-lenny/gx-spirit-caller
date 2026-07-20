/* func_0207cfc8: branch-free conditional chain -- if r1==0, load a
 * u32 at r0+4; otherwise load a u16 at r0+0xa THEN use that value as
 * an offset into r1. The second branch's load depends on the first
 * conditional load's result -- ships as asm rather than risk a
 * natural-C phrasing mwcc might schedule differently.
 */

asm void func_0207cfc8(void) {
    nofralloc
    cmp     r1, #0x0
    ldreq   r0, [r0, #0x4]
    ldrneh  r0, [r0, #0xa]
    ldrne   r0, [r1, r0]
    bx      lr
}
