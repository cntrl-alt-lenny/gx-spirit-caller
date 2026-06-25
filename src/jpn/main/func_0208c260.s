; func_0208c260 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208c260
        .arm
func_0208c260:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    ldr ip, [r1, #0x8]
    ldr r9, [r0, #0x4]
    ldr r3, [r0]
    ldr fp, [r1, #0x4]
    ldr r0, [r0, #0x8]
    ldr sl, [r1]
    smull r4, r7, r9, ip
    smull r1, r6, r0, fp
    subs r8, r4, r1
    smull r5, r4, r0, sl
    smull lr, ip, r3, ip
    smull r1, r0, r3, fp
    smull sl, r3, r9, sl
    sbc r6, r7, r6
    mov r9, #0x800
    adds r7, r8, r9
    adc r6, r6, #0x0
    subs r8, r5, lr
    sbc r5, r4, ip
    adds r8, r8, r9
    mov r4, r7, lsr #0xc
    adc r5, r5, #0x0
    subs r1, r1, sl
    orr r4, r4, r6, lsl #0x14
    mov r6, r8, lsr #0xc
    sbc r0, r0, r3
    adds r1, r1, r9
    str r4, [r2]
    orr r6, r6, r5, lsl #0x14
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    str r6, [r2, #0x4]
    orr r1, r1, r0, lsl #0x14
    str r1, [r2, #0x8]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
