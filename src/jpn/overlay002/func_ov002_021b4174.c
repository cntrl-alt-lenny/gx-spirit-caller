/* func_ov002_021b4174: Looks up data_ov002_022d0172[idx*4] as a halfword, tail-calls func_ov002_021b3c4c with the result.
 * Ships as asm -- verbatim transcription of the original
 * instructions; the exact register/branch shape isn't reliably
 * reachable from natural C without risking a mismatch.
 */

extern void func_ov002_021b3c4c(void);
extern char data_ov002_022d0172[];

asm void func_ov002_021b4174(void) {
    nofralloc
    ldr r2, =data_ov002_022d0172
    mov r0, r0, lsl #0x2
    ldr ip, =func_ov002_021b3c4c
    ldrh r0, [r2, r0]
    bx ip
}
