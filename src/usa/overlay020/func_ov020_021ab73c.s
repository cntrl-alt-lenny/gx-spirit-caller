; func_ov020_021ab73c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov020_021adf80
        .extern data_ov020_021adfc8
        .extern func_0207e550
        .extern func_020b377c
        .extern func_ov020_021aa810
        .global func_ov020_021ab73c
        .arm
func_ov020_021ab73c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x10
    ldr r2, _LIT0
    mov sl, r0
    ldr r0, [r2, #0x8c8]
    mov r9, r1
    cmp r0, #0x0
    ldr r5, _LIT1
    moveq r6, #0x10
    beq .L_40
    ldr r1, [r5, #0x880]
    ldr r0, [r5, #0x884]
    sub r0, r1, r0
    mov r0, r0, lsl #0x4
    bl func_020b377c
    mov r6, r0
.L_40:
    mov r1, #0xc6000
    mov r0, #0x4000
    mov r8, #0x0
    mov r7, r8
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    cmp r6, #0x0
    ble .L_c8
    mov fp, r8
    mvn r4, #0x0
.L_68:
    cmp r7, #0x0
    moveq r0, #0x4
    beq .L_80
    cmp r7, #0xf
    moveq r0, #0x6
    movne r0, #0x5
.L_80:
    mov r1, r0, lsl #0x10
    ldr r0, [r5, #0x924]
    mov r1, r1, lsr #0x10
    bl func_0207e550
    str fp, [sp]
    mov r2, r0
    str r4, [sp, #0x4]
    mov r0, sl
    mov r1, r9
    add r3, sp, #0x8
    bl func_ov020_021aa810
    add r8, r8, r0
    ldr r0, [sp, #0x8]
    add r7, r7, #0x1
    sub r0, r0, #0xa000
    str r0, [sp, #0x8]
    cmp r7, r6
    blt .L_68
.L_c8:
    mov r0, r8
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov020_021adf80
_LIT1: .word data_ov020_021adfc8
