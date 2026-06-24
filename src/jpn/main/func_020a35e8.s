; func_020a35e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9818
        .extern func_020a36ec
        .extern func_020a4104
        .global func_020a35e8
        .arm
func_020a35e8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    ldr ip, _LIT0
    mov r3, r1, lsl #0x10
    ldr r5, [ip]
    mov ip, r2, lsl #0x10
    add lr, r5, #0x500
    ldrh r4, [lr, #0x28]
    mov r1, r0
    mov r2, r3, lsr #0x10
    cmp r4, #0x0
    mov r4, ip, lsr #0x10
    beq .L_40
    ldrh r0, [lr, #0x26]
    cmp r0, #0x1
    bne .L_50
.L_40:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_50:
    ldrh r0, [lr, #0x24]
    cmp r0, #0x1
    beq .L_68
    cmp r0, #0x2
    beq .L_b4
    b .L_ec
.L_68:
    ldrh r0, [lr, #0x2c]
    cmp r0, #0x0
    moveq r0, #0x3e8
    movne r0, #0x0
    mov r3, r0, lsl #0x10
    str r4, [sp]
    ldr r0, [r5, #0x508]
    mov r3, r3, lsr #0x10
    bl func_020a36ec
    cmp r0, #0x2
    ldreq r1, _LIT0
    moveq r2, #0x1
    ldreq r1, [r1]
    add sp, sp, #0x4
    streqb r2, [r1, #0x50c]
    cmp r0, #0x2
    moveq r0, #0x0
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_b4:
    ldr r0, _LIT1
    mov r3, #0x0
    str r4, [sp]
    bl func_020a36ec
    cmp r0, #0x2
    ldreq r1, _LIT0
    moveq r2, #0x1
    ldreq r1, [r1]
    add sp, sp, #0x4
    streqb r2, [r1, #0x50c]
    cmp r0, #0x2
    moveq r0, #0x0
    ldmia sp!, {r4, r5, lr}
    bx lr
.L_ec:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a9818
_LIT1: .word func_020a4104
