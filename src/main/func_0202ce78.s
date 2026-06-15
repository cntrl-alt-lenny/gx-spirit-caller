; func_0202ce78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102c90
        .extern func_02001c98
        .extern func_02005088
        .extern func_02005240
        .global func_0202ce78
        .arm
func_0202ce78:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x8
    mov sl, r0
    ldrsb r0, [sl]
    ldr r6, [sp, #0x30]
    mov r9, r1
    cmp r0, #0x0
    mov r8, r2
    mov r7, r3
    addeq sp, sp, #0x8
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_80:
    cmp r0, #0x24
    ldreqsb r0, [sl, #0x1]
    cmpeq r0, #0x52
    bne .L_15c
    ldrsb r3, [sl, #0x2]!
    mov r0, #0x0
    mov r2, r0
    mov r1, sl
    cmp r3, #0x28
    beq .L_b8
.L_a8:
    ldrsb r3, [sl, #0x2]!
    add r2, r2, #0x1
    cmp r3, #0x28
    bne .L_a8
.L_b8:
    mov r3, #0x0
    strb r3, [sl], #0x1
    ldrsb r3, [sl]
    mov fp, sl
    cmp r3, #0x29
    beq .L_e0
.L_d0:
    ldrsb r3, [sl, #0x2]!
    add r0, r0, #0x1
    cmp r3, #0x29
    bne .L_d0
.L_e0:
    mul r3, r6, r2
    mov r5, r0, lsl #0x3
    cmp r3, r0, lsl #0x3
    movlt r4, r5
    movge r4, r3
    mov r2, #0x0
    sub r0, r4, r3
    add r3, r0, r0, lsr #0x1f
    strb r2, [sl], #0x1
    add r2, r7, #0x8
    str r2, [sp]
    ldr r0, _LIT0
    mov r2, r9
    add r3, r8, r3, asr #0x1
    str r6, [sp, #0x4]
    bl func_02005088
    mov r0, #0xf
    mov r1, #0x0
    bl func_02001c98
    sub r0, r4, r5
    add r0, r0, r0, lsr #0x1f
    add r3, r8, r0, asr #0x1
    str r7, [sp]
    mov r0, #0x8
    str r0, [sp, #0x4]
    ldr r0, _LIT0
    mov r1, fp
    mov r2, r9
    bl func_02005240
    add r8, r8, r4
    b .L_1c0
.L_15c:
    mov r1, sl
    mov r2, #0x0
    mov r3, #0x1
    b .L_180
.L_16c:
    cmp r4, #0x0
    movlt r0, r3
    movge r0, r2
    add r0, r0, #0x1
    add sl, sl, r0
.L_180:
    ldrsb r4, [sl]
    cmp r4, #0x0
    cmpne r4, #0x24
    bne .L_16c
    mov r0, #0x0
    strb r0, [sl]
    add r0, r7, #0x8
    str r0, [sp]
    ldr r0, _LIT0
    mov r2, r9
    mov r3, r8
    str r6, [sp, #0x4]
    bl func_02005088
    ldr r0, _LIT0
    ldr r8, [r0, #0x8]
    strb r4, [sl]
.L_1c0:
    ldrsb r0, [sl]
    cmp r0, #0x0
    bne .L_80
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02102c90
