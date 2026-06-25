; func_02032adc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032790
        .extern func_0203347c
        .global func_02032adc
        .arm
func_02032adc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r4, [sp, #0x1c]
    mov r7, r1
    mov r0, r4
    mov r6, r2
    mov r5, r3
    bl func_0203347c
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r7, #0x0
    bne .L_44
    ldr r1, [r4, #0xeac]
    mov r0, r4
    orr r1, r1, #0x3000
    str r1, [r4, #0xeac]
    bl func_02032790
    b .L_a8
.L_44:
    ldr r0, [r4, #0xeac]
    tst r0, #0x4000
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    bne .L_74
    ldr r0, [r4, #0xeac]
    cmp r6, #0x0
    orrne r0, r0, #0x4000
    strne r0, [r4, #0xeac]
    biceq r0, r0, #0x4000
    streq r0, [r4, #0xeac]
.L_74:
    cmp r6, #0x0
    bne .L_98
    cmp r5, #0x0
    beq .L_a8
    ldr r0, [r4, #0xeac]
    orr r0, r0, #0x1000
    bic r0, r0, #0x2000
    str r0, [r4, #0xeac]
    b .L_a8
.L_98:
    ldr r0, [r4, #0xeac]
    orr r0, r0, #0x1000
    bic r0, r0, #0x2000
    str r0, [r4, #0xeac]
.L_a8:
    ldr r4, [r4, #0xee4]
    cmp r4, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r3, [sp, #0x18]
    mov r0, r7
    mov r1, r6
    mov r2, r5
    blx r4
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
