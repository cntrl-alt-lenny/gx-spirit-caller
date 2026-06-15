; func_020b0bdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b0bdc
        .arm
func_020b0bdc:
    stmdb sp!, {r3, r4, r5, lr}
    ldrb r2, [r0, #0x5]
    cmp r2, #0x0
    bne .L_7b4
    ldrb r0, [r1, #0x5]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_7b4:
    ldrb r2, [r1, #0x5]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrsh r3, [r1, #0x2]
    ldrsh r2, [r0, #0x2]
    cmp r2, r3
    bne .L_864
    ldrb r5, [r0, #0x4]
    ldrb r4, [r1, #0x4]
    mov ip, #0x0
    mov lr, r5
    cmp r5, r4
    movgt lr, r4
    cmp lr, #0x0
    ble .L_828
.L_7f4:
    add r3, r1, ip
    add r2, r0, ip
    ldrb r3, [r3, #0x5]
    ldrb r2, [r2, #0x5]
    cmp r2, r3
    movcc r0, #0x1
    ldmccia sp!, {r3, r4, r5, pc}
    cmp r3, r2
    movcc r0, #0x0
    ldmccia sp!, {r3, r4, r5, pc}
    add ip, ip, #0x1
    cmp ip, lr
    blt .L_7f4
.L_828:
    cmp lr, r5
    bne .L_85c
    cmp ip, r4
    bge .L_85c
.L_838:
    add r0, r1, ip
    ldrb r0, [r0, #0x5]
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, pc}
    ldrb r0, [r1, #0x4]
    add ip, ip, #0x1
    cmp ip, r0
    blt .L_838
.L_85c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_864:
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
