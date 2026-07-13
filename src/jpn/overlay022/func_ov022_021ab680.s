; func_ov022_021ab680 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov022_021ab3d0
        .extern func_ov022_021ab4e8
        .global func_ov022_021ab680
        .arm
func_ov022_021ab680:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r3, r2, lsr #0x10
    mov r2, r2, lsl #0x10
    mov r7, r2, lsr #0x10
    mov r3, r3, lsl #0x10
    mov r2, r3, lsr #0x10
    cmp r7, #0x0
    mov sl, r0
    mov r9, r1
    sub r8, r2, #0x100
    mov r6, #0x0
    addle sp, sp, #0xc
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r5, sp, #0x8
    add r4, sp, #0x4
    add fp, sp, #0x0
.L_1124:
    ldrh r0, [sl]
    mov r1, r5
    mov r2, r4
    mov r3, fp
    bl func_ov022_021ab3d0
    ldr r0, [sp, #0x4]
    ldr r2, [sp]
    add r1, r0, r8
    str r1, [sp, #0x4]
    cmp r1, #0x0
    movle r1, #0x0
    ldr r0, [sp, #0x8]
    str r1, [sp, #0x4]
    cmp r1, #0xff
    movgt r1, #0xff
    str r1, [sp, #0x4]
    bl func_ov022_021ab4e8
    add r6, r6, #0x1
    cmp r6, r7
    strh r0, [r9], #0x2
    add sl, sl, #0x2
    blt .L_1124
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
