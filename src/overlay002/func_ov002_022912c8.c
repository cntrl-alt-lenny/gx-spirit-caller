/* func_ov002_022912c8: Tail-calls func_ov002_0227da98 with the low bit of obj->field_2 (halfword) as the argument.
 * Ships as asm -- verbatim transcription of the original
 * instructions; the exact register/branch shape isn't reliably
 * reachable from natural C without risking a mismatch.
 */

extern void func_ov002_0227da98(void);

asm void func_ov002_022912c8(void) {
    nofralloc
    ldrh r0, [r0, #0x2]
    ldr ip, =func_ov002_0227da98
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bx ip
}
