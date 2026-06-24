; func_020b0a08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b0a08
        .arm
func_020b0a08:
    stmdb sp!, {r4, lr}
    ldrb r3, [r0, #0x5]
    cmp r3, #0x0
    bne .L_3a8
    ldrb r0, [r1, #0x5]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_3a8:
    ldrb r2, [r1, #0x5]
    cmp r2, #0x0
    bne .L_3c4
    cmp r3, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_3c4:
    ldrsh r3, [r0, #0x2]
    ldrsh r2, [r1, #0x2]
    cmp r3, r2
    bne .L_45c
    ldrb r4, [r0, #0x4]
    ldrb r2, [r1, #0x4]
    mov ip, #0x0
    mov lr, r4
    cmp r4, r2
    movgt lr, r2
    cmp lr, #0x0
    ble .L_41c
.L_3f4:
    add r3, r0, ip
    add r2, r1, ip
    ldrb r3, [r3, #0x5]
    ldrb r2, [r2, #0x5]
    cmp r3, r2
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    add ip, ip, #0x1
    cmp ip, lr
    blt .L_3f4
.L_41c:
    cmp lr, r4
    moveq r0, r1
    ldrb r1, [r0, #0x4]
    cmp ip, r1
    bge .L_454
.L_430:
    add r1, r0, ip
    ldrb r1, [r1, #0x5]
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrb r1, [r0, #0x4]
    add ip, ip, #0x1
    cmp ip, r1
    blt .L_430
.L_454:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_45c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
