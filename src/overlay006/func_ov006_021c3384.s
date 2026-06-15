; func_ov006_021c3384 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_021cddec
        .extern data_ov006_021cdf88
        .extern func_02021660
        .extern func_020216b0
        .global func_ov006_021c3384
        .arm
func_ov006_021c3384:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr r9, _LIT0
    ldr r4, _LIT1
    mov sl, r0
    mov r7, #0x0
    mov fp, #0x2
    mov r5, #0x5
.L_e90:
    ldr r0, [sl]
    mov r1, r5
    mov r2, r7
    bl func_02021660
    mov r6, r0
    cmp r7, #0x1
    blt .L_ee8
    cmp r7, #0x7
    bgt .L_ee8
    ldrsh r1, [r9, #0x4]
    ldr r0, [sl, #0x5c]
    cmp r1, r0
    ldreqsh r1, [r9, #0x6]
    ldreq r0, [sl, #0x60]
    cmpeq r1, r0
    bne .L_ee0
    ldr r0, [sl, #0x68]
    cmp r0, #0x0
    ldrne r8, [r9, #0x14]
    bne .L_ef8
.L_ee0:
    ldr r8, [r9, #0x10]
    b .L_ef8
.L_ee8:
    ldr r0, [sl, #0x98]
    cmp r7, r0
    ldreq r8, [r9, #0x18]
    ldrne r8, [r9, #0x10]
.L_ef8:
    mov r0, r6
    mov r1, fp
    mov r2, r7
    bl func_020216b0
    ldrsh r2, [r9]
    mov r0, r6
    mov r1, #0x3
    bl func_020216b0
    ldrsh r2, [r9, #0x2]
    mov r0, r6
    mov r1, #0x4
    bl func_020216b0
    ldrsh r2, [r9, #0x8]
    mov r0, r6
    mov r1, #0x11
    bl func_020216b0
    ldrsh r2, [r9, #0xa]
    mov r0, r6
    mov r1, #0x12
    bl func_020216b0
    ldr r2, [r9, #0xc]
    mov r0, r6
    mov r1, #0xc
    bl func_020216b0
    mov r2, r8
    mov r0, r6
    mov r1, #0xd
    bl func_020216b0
    mov r2, r7, lsl #0x1
    ldrsh r2, [r4, r2]
    mov r0, r6
    mov r1, #0xe
    bl func_020216b0
    ldr r2, _LIT2
    mov r0, r6
    mov r1, #0x0
    bl func_020216b0
    add r7, r7, #0x1
    add r9, r9, #0x1c
    cmp r7, #0x8
    blt .L_e90
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_021cdf88
_LIT1: .word data_ov006_021cddec
_LIT2: .word 0x000001c1
