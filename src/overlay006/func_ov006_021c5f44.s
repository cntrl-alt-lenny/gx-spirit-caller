; func_ov006_021c5f44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021b1d4c
        .extern data_ov006_021ce0a8
        .extern data_ov006_0225deb4
        .extern func_02021660
        .extern func_020216b0
        .extern func_020b3870
        .extern func_ov006_021c6f24
        .global func_ov006_021c5f44
        .arm
func_ov006_021c5f44:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, [sl, #0x4c]
    add r1, sl, #0x6c
    ldr r9, _LIT0
    add r4, r1, r0, lsl #0x4
    mov r6, #0x0
.L_170:
    ldr r0, [sl]
    mov r1, #0x5
    mov r2, r6
    bl func_02021660
    mov r5, r0
    cmp r6, #0x3
    mov fp, #0x0
    beq .L_1cc
    ldr r0, [r4, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_1b8
    cmp r6, #0x3
    blt .L_1b8
    cmp r6, #0x6
    bgt .L_1b8
    cmp r6, #0x3
    bne .L_1cc
.L_1b8:
    ldr r0, _LIT1
    bl func_ov006_021c6f24
    cmp r0, #0x0
    cmpeq r6, #0x2
    ldrne fp, _LIT2
.L_1cc:
    ldr r0, [sl, #0x68]
    cmp r6, r0
    ldreq r7, [r9, #0x18]
    beq .L_22c
    ldr r0, [r4, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_228
    ldr r0, _LIT3
    ldr r0, [r0, #0x18]
    cmp r0, #0x1
    cmpeq r6, #0x6
    beq .L_218
    cmp r0, #0x2
    cmpeq r6, #0x4
    beq .L_218
    cmp r0, #0x3
    cmpeq r6, #0x5
    bne .L_220
.L_218:
    ldr r7, [r9, #0x18]
    b .L_22c
.L_220:
    ldr r7, [r9, #0x10]
    b .L_22c
.L_228:
    ldr r7, [r9, #0x10]
.L_22c:
    ldrsh r0, [r9]
    ldrsh r8, [r9, #0x2]
    str r0, [sp]
    ldr r0, [r4, #0xc]
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    beq .L_26c
    cmp r6, #0x6
    bne .L_26c
    ldr r2, [r4, #0x4]
    mov r0, #0x46
    mul r0, r2, r0
    ldr r1, [r4, #0x8]
    sub r1, r1, #0x6
    bl func_020b3870
    add r8, r8, r0
.L_26c:
    mov r0, r5
    mov r1, #0x2
    mov r2, r6
    bl func_020216b0
    ldr r2, [sp]
    mov r0, r5
    mov r1, #0x3
    bl func_020216b0
    mov r2, r8
    mov r0, r5
    mov r1, #0x4
    bl func_020216b0
    ldrsh r2, [r9, #0x8]
    mov r0, r5
    mov r1, #0x11
    bl func_020216b0
    ldrsh r2, [r9, #0xa]
    mov r0, r5
    mov r1, #0x12
    bl func_020216b0
    ldr r2, [r9, #0xc]
    mov r0, r5
    mov r1, #0xc
    bl func_020216b0
    mov r2, r7
    mov r0, r5
    mov r1, #0xd
    bl func_020216b0
    mov r0, r5
    mov r2, fp
    mov r1, #0x0
    bl func_020216b0
    add r6, r6, #0x1
    add r9, r9, #0x1c
    cmp r6, #0x7
    blt .L_170
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov006_021ce0a8
_LIT1: .word data_ov006_0225deb4
_LIT2: .word 0x000001c1
_LIT3: .word data_ov000_021b1d4c
