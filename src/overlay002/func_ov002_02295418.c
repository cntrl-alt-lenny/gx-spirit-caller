/* func_ov002_02295418: Tail-calls func_ov002_02281994 with the low bit of obj->field_2 and a fixed constant (0x15a3).
 * Ships as asm -- verbatim transcription of the original
 * instructions; the exact register/branch shape isn't reliably
 * reachable from natural C without risking a mismatch.
 */

extern void func_ov002_02281994(void);

asm void func_ov002_02295418(void) {
    nofralloc
    ldrh r0, [r0, #0x2]
    ldr ip, =func_ov002_02281994
    ldr r1, =0x15a3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bx ip
}
