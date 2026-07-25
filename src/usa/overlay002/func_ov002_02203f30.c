/* func_ov002_02203f30: Tail-calls func_ov002_021b3fb8 with the low bit of obj->field_2 plus two fixed constant args (0xb, 0x14c0).
 * Ships as asm -- verbatim transcription of the original
 * instructions; the exact register/branch shape isn't reliably
 * reachable from natural C without risking a mismatch.
 */

extern void func_ov002_021b3fb8(void);

asm void func_ov002_02203f30(void) {
    nofralloc
    ldrh r0, [r0, #0x2]
    ldr ip, =func_ov002_021b3fb8
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r2, #0x14c0
    mov r0, r0, lsr #0x1f
    bx ip
}
