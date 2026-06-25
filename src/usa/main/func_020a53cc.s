; func_020a53cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0209e404
        .global func_020a53cc
        .arm
func_020a53cc:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_0209e404
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldrh r3, [r4, #0x4]
    mov ip, #0x0
    mov lr, r3
    mov r2, #0x1
.L_2c:
    sub r1, lr, #0x1
    mov r1, r2, lsl r1
    ands r1, r0, r1
    beq .L_48
    cmp r3, lr
    strneh lr, [r4, #0x4]
    bne .L_70
.L_48:
    add r1, ip, #0x1
    mov r1, r1, lsl #0x10
    cmp lr, #0x10
    mov ip, r1, lsr #0x10
    moveq r1, r2
    addne r1, lr, #0x1
    mov r1, r1, lsl #0x10
    cmp ip, #0x10
    mov lr, r1, lsr #0x10
    bcc .L_2c
.L_70:
    mov r0, #0x1
    ldmia sp!, {r4, lr}
    bx lr
