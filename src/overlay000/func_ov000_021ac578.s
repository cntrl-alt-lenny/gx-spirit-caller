; func_ov000_021ac578 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02006110
        .extern func_02006164
        .extern func_0200617c
        .extern func_02006194
        .global func_ov000_021ac578
        .arm
func_ov000_021ac578:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r0, [r5]
    mov r4, #0x0
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    bne .L_34
    ldr r0, [r5, #0x8]
    add sp, sp, #0x8
    bic r0, r0, #0x20000
    str r0, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, pc}
.L_34:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    bl func_02006194
    cmp r0, #0x0
    bne .L_58
    bl func_0200617c
    cmp r0, #0x0
    beq .L_ec
.L_58:
    ldr r0, [r5, #0x4]
    ldr r2, [r5]
    mov r1, r0, lsl #0x10
    movs ip, r1, lsr #0x18
    bne .L_ac
    mov r0, r0, lsl #0x18
    mov r1, r2, lsl #0x7
    mov r0, r0, lsr #0x19
    ldr r3, [sp]
    add r1, r0, r1, lsr #0x17
    sub r3, r3, r1
    mul r1, r3, r3
    mov r2, r2, lsl #0x10
    ldr r3, [sp, #0x4]
    add r2, r0, r2, lsr #0x17
    sub r3, r3, r2
    mla r2, r3, r3, r1
    mul r1, r0, r0
    cmp r2, r1
    movlt r4, #0x1
    b .L_ec
.L_ac:
    ldr r1, [sp, #0x4]
    mov r3, r2, lsl #0x10
    cmp r1, r3, lsr #0x17
    bls .L_ec
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, r3, lsr #0x17
    cmp r1, r0
    bcs .L_ec
    ldr r1, [sp]
    mov r0, r2, lsl #0x7
    cmp r1, r0, lsr #0x17
    bls .L_ec
    add r0, ip, r0, lsr #0x17
    cmp r1, r0
    movcc r4, #0x1
.L_ec:
    cmp r4, #0x0
    beq .L_168
    bl func_02006164
    cmp r0, #0x0
    ldrne r0, [r5, #0x8]
    orrne r0, r0, #0x30000
    strne r0, [r5, #0x8]
    ldr r0, [r5, #0x8]
    mov r0, r0, lsl #0xf
    movs r0, r0, lsr #0x1f
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_02006194
    cmp r0, #0x0
    beq .L_140
    ldr r0, [r5]
    add sp, sp, #0x8
    bic r0, r0, #0x78
    orr r0, r0, #0x8
    str r0, [r5]
    ldmia sp!, {r3, r4, r5, pc}
.L_140:
    bl func_0200617c
    cmp r0, #0x0
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r5]
    add sp, sp, #0x8
    orr r0, r0, #0x4
    bic r0, r0, #0x78
    str r0, [r5]
    ldmia sp!, {r3, r4, r5, pc}
.L_168:
    bl func_02006194
    cmp r0, #0x0
    beq .L_184
    ldr r0, [r5, #0x8]
    mov r0, r0, lsl #0xd
    movs r0, r0, lsr #0x1f
    beq .L_1a0
.L_184:
    ldr r0, [r5]
    bic r0, r0, #0x78
    str r0, [r5]
    ldr r0, [r5, #0x8]
    bic r0, r0, #0x10000
    bic r0, r0, #0x40000
    str r0, [r5, #0x8]
.L_1a0:
    ldr r0, [r5, #0x8]
    bic r0, r0, #0x20000
    str r0, [r5, #0x8]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
