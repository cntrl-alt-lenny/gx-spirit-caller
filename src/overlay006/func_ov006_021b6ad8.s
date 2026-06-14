; func_ov006_021b6ad8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02008d1c
        .global func_ov006_021b6ad8
        .arm
func_ov006_021b6ad8:
    stmdb sp!, {r3, lr}
    cmp r1, #0x0
    beq .L_18
    cmp r1, #0x1
    beq .L_74
    b .L_cc
.L_18:
    cmp r3, #0x0
    beq .L_3c
    mov r1, r2
    mov r0, #0x0
    bl func_02008d1c
    cmp r0, #0x0
    bne .L_cc
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_3c:
    mov r1, r2, asr #0x4
    add r1, r2, r1, lsr #0x1b
    mov r1, r1, asr #0x5
    add r0, r0, r1, lsl #0x2
    mov r1, r2, lsr #0x1f
    add r3, r0, #0x6000
    rsb r0, r1, r2, lsl #0x1b
    ldr r2, [r3, #0xb4]
    add r0, r1, r0, ror #0x1b
    mov r1, #0x1
    tst r2, r1, lsl r0
    bne .L_cc
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_74:
    cmp r3, #0x0
    beq .L_98
    mov r1, r2
    mov r0, #0x1
    bl func_02008d1c
    cmp r0, #0x0
    bne .L_cc
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_98:
    mov r1, r2, asr #0x4
    add r1, r2, r1, lsr #0x1b
    mov r1, r1, asr #0x5
    add r0, r0, r1, lsl #0x2
    mov r1, r2, lsr #0x1f
    add r3, r0, #0x6000
    rsb r0, r1, r2, lsl #0x1b
    add r0, r1, r0, ror #0x1b
    ldr r2, [r3, #0x1b4]
    mov r1, #0x1
    tst r2, r1, lsl r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
.L_cc:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
