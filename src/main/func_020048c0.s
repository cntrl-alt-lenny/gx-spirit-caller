; func_020048c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c7c
        .extern func_02004684
        .global func_020048c0
        .arm
func_020048c0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x34
    mov r8, r0
    ldr r0, [r8, #0x1c]
    mov r7, r1
    mov r0, r0, lsl #0x18
    mov r1, r0, lsr #0x18
    ldr r0, [sp, #0x5c]
    cmp r1, #0xff
    str r0, [sp, #0x5c]
    ldr r0, [sp, #0x60]
    str r2, [sp, #0x8]
    str r3, [sp, #0xc]
    ldr r6, [sp, #0x58]
    str r0, [sp, #0x60]
    moveq r4, #0x0
    beq .L_a78
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x17
    mov r4, r0, lsr #0x17
.L_a78:
    cmp r1, #0xff
    movne r0, #0x1
    strne r0, [sp, #0x14]
    moveq r0, #0x0
    streq r0, [sp, #0x14]
    ldr r0, [r8, #0x10]
    ldr r2, [r8, #0x24]
    str r0, [sp, #0x10]
    cmp r0, #0x0
    ldreq r0, [sp, #0x5c]
    ldr r5, [r8, #0x14]
    streq r0, [sp, #0x10]
    ldr r0, [sp, #0x5c]
    cmp r5, #0x0
    sub r1, r0, #0x8
    ldreq r5, [sp, #0x5c]
    mov r0, r2, lsl #0x10
    cmp r1, #0x8
    mov fp, r2, lsl #0x14
    str r0, [sp, #0x30]
    addls pc, pc, r1, lsl #0x2
    b .L_b40
    b .L_af4
    b .L_b40
    b .L_b04
    b .L_b40
    b .L_b14
    b .L_b40
    b .L_b24
    b .L_b40
    b .L_b34
.L_af4:
    ldr r0, _LIT0
    ldr r0, [r0, #0x88]
    str r0, [sp, #0x2c]
    b .L_b40
.L_b04:
    ldr r0, _LIT0
    ldr r0, [r0, #0x90]
    str r0, [sp, #0x2c]
    b .L_b40
.L_b14:
    ldr r0, _LIT0
    ldr r0, [r0, #0x98]
    str r0, [sp, #0x2c]
    b .L_b40
.L_b24:
    ldr r0, _LIT0
    ldr r0, [r0, #0xa0]
    str r0, [sp, #0x2c]
    b .L_b40
.L_b34:
    ldr r0, _LIT0
    ldr r0, [r0, #0xa8]
    str r0, [sp, #0x2c]
.L_b40:
    mov r0, #0x0
    str r0, [r8, #0x28]
    ldr r0, [r8, #0x20]
    bic r0, r0, #0x400000
    str r0, [r8, #0x20]
    ldrsb r1, [r7]
    cmp r1, #0x0
    beq .L_1038
    ldr r0, [sp, #0x5c]
    mov r0, r0, asr #0x1
    str r0, [sp, #0x20]
    ldr r0, [sp, #0x10]
    mov r0, r0, asr #0x1
    str r0, [sp, #0x1c]
    ldr r0, [sp, #0x5c]
    add r0, r0, r0, lsl #0x1
    str r0, [sp, #0x18]
.L_b84:
    cmp r1, #0x20
    bgt .L_bb8
    bge .L_bec
    cmp r1, #0xd
    bgt .L_cd0
    cmp r1, #0x9
    blt .L_cd0
    beq .L_ca0
    cmp r1, #0xa
    beq .L_bc4
    cmp r1, #0xd
    beq .L_cbc
    b .L_cd0
.L_bb8:
    cmp r1, #0x40
    beq .L_c5c
    b .L_cd0
.L_bc4:
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    add r7, r7, #0x1
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_1038
    b .L_102c
.L_bec:
    ldr r0, [r8, #0x24]
    mov r0, r0, lsl #0x18
    cmp r4, r0, lsr #0x18
    mov r0, r0, lsr #0x18
    bls .L_c54
    ldr r1, [r8, #0x20]
    mov r1, r1, lsl #0x7
    movs r1, r1, lsr #0x1f
    ldrne r1, [r8, #0x18]
    bne .L_c20
    ldr r1, [r8, #0x10]
    cmp r1, #0x0
    ldreq r1, [sp, #0x20]
.L_c20:
    add r4, r4, r1
    ldr r1, [sp, #0xc]
    add r1, r1, r4
    add r2, r1, fp, lsr #0x1c
    ldr r1, [r8]
    cmp r2, r1, lsl #0x3
    bls .L_c54
    mov r4, r0
    add r6, r6, r5
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_1038
.L_c54:
    add r7, r7, #0x1
    b .L_102c
.L_c5c:
    ldrsb r1, [r7, #0x1]!
    cmp r1, #0x30
    blt .L_cd0
    cmp r1, #0x39
    bgt .L_cd0
    sub r0, r1, #0x30
    rsb r1, r0, #0xf
    and r2, r1, #0xf
    ldr r0, _LIT0
    add r7, r7, #0x1
    str r2, [r0, #0x8]
    mov r2, r1, lsl #0x1c
    ldr r0, [r8, #0x24]
    bic r0, r0, #0x1e0000
    orr r0, r0, r2, lsr #0xb
    str r0, [r8, #0x24]
    b .L_102c
.L_ca0:
    ldr r1, [r8, #0x24]
    and r0, r4, #0xff
    bic r1, r1, #0xff
    orr r0, r1, r0
    str r0, [r8, #0x24]
    add r7, r7, #0x1
    b .L_102c
.L_cbc:
    ldr r0, [r8, #0x24]
    add r7, r7, #0x1
    bic r0, r0, #0xff
    str r0, [r8, #0x24]
    b .L_102c
.L_cd0:
    cmp r1, #0x0
    blt .L_d5c
    ldr r0, [r8, #0x24]
    and r9, r1, #0xff
    mov r0, r0, lsl #0xf
    movs r0, r0, lsr #0x1f
    ldrne r0, [sp, #0x1c]
    strne r0, [sp, #0x28]
    bne .L_d10
    ldr r0, [sp, #0x2c]
    ldrb r1, [r0, r9, asr #0x1]
    mov r0, r9, lsl #0x1f
    mov r0, r0, lsr #0x1d
    mov r0, r1, asr r0
    and r0, r0, #0xf
    str r0, [sp, #0x28]
.L_d10:
    add r0, r7, #0x1
    str r0, [sp, #0x24]
    ldr r0, [sp, #0xc]
    add r1, r0, r4
    ldr r0, [sp, #0x28]
    add r0, r0, r1
    add r1, r0, fp, lsr #0x1c
    ldr r0, [r8]
    cmp r1, r0, lsl #0x3
    bls .L_fc4
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_1038
    b .L_fc4
.L_d5c:
    ldr r0, [sp, #0x10]
    and r2, r1, #0xff
    ldrb r1, [r7, #0x1]
    str r0, [sp, #0x28]
    add r0, r7, #0x2
    str r0, [sp, #0x24]
    orr r9, r1, r2, lsl #0x8
    ldr r0, [sp, #0xc]
    ldr r2, [sp, #0x5c]
    add r1, r0, r4
    add r2, r2, r1
    ldr r0, [r8]
    add r2, r2, fp, lsr #0x1c
    cmp r2, r0, lsl #0x3
    bls .L_dbc
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_1038
    b .L_fc4
.L_dbc:
    ldr r2, [sp, #0x5c]
    add r3, r4, r2, lsl #0x1
    ldr r2, [sp, #0xc]
    add r2, r3, r2
    add r2, r2, fp, lsr #0x1c
    cmp r2, r0, lsl #0x3
    bls .L_e50
    mov r0, r7
.L_ddc:
    ldrsb r1, [r0, #0x2]!
    cmp r1, #0x40
    beq .L_ddc
    bl func_02004684
    cmp r0, #0x0
    beq .L_e18
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_1038
    b .L_fc4
.L_e18:
    ldr r0, _LIT1
    cmp r9, r0
    addne r0, r0, #0xc
    cmpne r9, r0
    bne .L_fc4
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_1038
    b .L_fc4
.L_e50:
    ldr r2, [sp, #0x18]
    add r2, r1, r2
    add r2, r2, fp, lsr #0x1c
    cmp r2, r0, lsl #0x3
    bls .L_f2c
    ldr r0, _LIT1
    mov sl, r7
    cmp r9, r0
    addne r0, r0, #0xc
    cmpne r9, r0
    bne .L_ed0
.L_e7c:
    ldrsb r0, [sl, #0x2]!
    cmp r0, #0x40
    beq .L_e7c
    cmp r0, #0x0
    beq .L_fc4
.L_e90:
    ldrsb r0, [sl, #0x2]!
    cmp r0, #0x40
    beq .L_e90
    mov r0, sl
    bl func_02004684
    cmp r0, #0x0
    beq .L_fc4
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_1038
    b .L_fc4
.L_ed0:
    ldrsb r0, [sl, #0x2]!
    cmp r0, #0x40
    beq .L_ed0
    mov r0, sl
    bl func_02004684
    cmp r0, #0x0
    beq .L_fc4
.L_eec:
    ldrsb r0, [sl, #0x2]!
    cmp r0, #0x40
    beq .L_eec
    mov r0, sl
    bl func_02004684
    cmp r0, #0x0
    beq .L_fc4
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_1038
    b .L_fc4
.L_f2c:
    ldr r2, [sp, #0x5c]
    add r1, r1, r2, lsl #0x2
    add r1, r1, fp, lsr #0x1c
    cmp r1, r0, lsl #0x3
    bls .L_fc4
    ldr r0, _LIT1
    mov sl, r7
    cmp r9, r0
    addne r0, r0, #0xc
    cmpne r9, r0
    bne .L_fc4
.L_f58:
    ldrsb r0, [sl, #0x2]!
    cmp r0, #0x40
    beq .L_f58
    cmp r0, #0x0
    beq .L_fc4
.L_f6c:
    ldrsb r0, [sl, #0x2]!
    cmp r0, #0x40
    beq .L_f6c
    mov r0, sl
    bl func_02004684
    cmp r0, #0x0
    beq .L_fc4
.L_f88:
    ldrsb r0, [sl, #0x2]!
    cmp r0, #0x40
    beq .L_f88
    mov r0, sl
    bl func_02004684
    cmp r0, #0x0
    beq .L_fc4
    ldr r0, [r8, #0x24]
    add r6, r6, r5
    mov r0, r0, lsl #0x18
    mov r4, r0, lsr #0x18
    ldr r0, [r8, #0x20]
    mov r0, r0, lsl #0x8
    movs r0, r0, lsr #0x1f
    bne .L_1038
.L_fc4:
    ldr r0, [sp, #0x30]
    add r1, r6, r5
    add r1, r1, r0, lsr #0x1c
    ldr r0, [r8, #0x4]
    cmp r1, r0, lsl #0x3
    bls .L_fec
    ldr r0, [r8, #0x20]
    orr r0, r0, #0x400000
    str r0, [r8, #0x20]
    b .L_1038
.L_fec:
    ldr r3, [sp, #0xc]
    ldr r0, [sp, #0x5c]
    str r6, [sp]
    str r0, [sp, #0x4]
    ldr r2, [sp, #0x8]
    ldr r7, [sp, #0x60]
    mov r1, r9
    mov r0, r8
    add r3, r3, r4
    blx r7
    ldr r0, [sp, #0x28]
    ldr r7, [sp, #0x24]
    add r4, r4, r0
    ldr r0, [sp, #0x14]
    cmp r0, #0x0
    bne .L_1038
.L_102c:
    ldrsb r1, [r7]
    cmp r1, #0x0
    bne .L_b84
.L_1038:
    ldr r0, [sp, #0xc]
    str r7, [r8, #0x28]
    add r0, r0, r4
    str r0, [r8, #0x8]
    str r6, [r8, #0xc]
    add sp, sp, #0x34
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02102c7c
_LIT1: .word 0x00008169
