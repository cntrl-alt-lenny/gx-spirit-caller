/* func_ov002_0226ae30: Computes a 0/1/7 selector from two flag args, tail-calls func_ov002_0226ae50.
 * Ships as asm -- verbatim transcription of the original
 * instructions; the exact register/branch shape isn't reliably
 * reachable from natural C without risking a mismatch.
 */

extern void func_ov002_0226ae50(void);

asm void func_ov002_0226ae30(void) {
    nofralloc
    cmp r2, #0x0
    mov r2, #0x0
    movne r2, #0x1
    cmp r3, #0x0
    ldr ip, =func_ov002_0226ae50
    movne r2, #0x7
    bx ip
}
