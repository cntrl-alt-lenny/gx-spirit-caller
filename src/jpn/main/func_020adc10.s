; func_020adc10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020adc10
        .arm
func_020adc10:
    stmdb sp!, {r4, lr}
    cmp r1, #0x0
    bge .L_e6c
.L_e50:
    mov r1, #0x0
    strh r1, [r0, #0x2]
    mov r1, #0x1
    strb r1, [r0, #0x4]
    mov r1, #0x30
    strb r1, [r0, #0x5]
    ldmia sp!, {r4, pc}
.L_e6c:
    ldrb lr, [r0, #0x4]
    cmp r1, lr
    ldmgeia sp!, {r4, pc}
    add ip, r0, #0x5
    add r2, ip, r1
    add r2, r2, #0x1
    ldrsb r3, [r2, #-1]!
    sub r3, r3, #0x30
    mov r3, r3, lsl #0x18
    mov r3, r3, asr #0x18
    cmp r3, #0x5
    bne .L_ecc
    add ip, ip, lr
.L_ea0:
    sub ip, ip, #0x1
    cmp ip, r2
    bls .L_eb8
    ldrsb r3, [ip]
    cmp r3, #0x30
    beq .L_ea0
.L_eb8:
    cmp ip, r2
    ldreqsb r3, [r2, #-1]
    andeq r4, r3, #0x1
    movne r4, #0x1
    b .L_ed4
.L_ecc:
    movgt r4, #0x1
    movle r4, #0x0
.L_ed4:
    cmp r1, #0x0
    beq .L_f30
    mov ip, #0x0
    mov lr, #0x1
.L_ee4:
    ldrsb r3, [r2, #-1]!
    sub r3, r3, #0x30
    add r3, r3, r4
    mov r3, r3, lsl #0x18
    mov r3, r3, asr #0x18
    cmp r3, #0x9
    movgt r4, lr
    movle r4, ip
    cmp r4, #0x0
    bne .L_f14
    cmp r3, #0x0
    bne .L_f1c
.L_f14:
    sub r1, r1, #0x1
    b .L_f28
.L_f1c:
    add r3, r3, #0x30
    strb r3, [r2]
    b .L_f30
.L_f28:
    cmp r1, #0x0
    bne .L_ee4
.L_f30:
    cmp r4, #0x0
    beq .L_f58
    ldrsh r3, [r0, #0x2]
    mov r2, #0x1
    mov r1, #0x31
    add r3, r3, #0x1
    strh r3, [r0, #0x2]
    strb r2, [r0, #0x4]
    strb r1, [r0, #0x5]
    ldmia sp!, {r4, pc}
.L_f58:
    cmp r1, #0x0
    beq .L_e50
    strb r1, [r0, #0x4]
    ldmia sp!, {r4, pc}
